report 50000 Top_TransferBomToReqJnl
{
    // UsageCategory = Administration;
    // ApplicationArea = All;
    ProcessingOnly = true;

    dataset
    {
        dataitem(DataItemName; "Production BOM Header")
        {

        }
    }

    requestpage
    {
        layout
        {
            area(Content)
            {
                group(Filters)
                {
                    CaptionML = DAN = 'Indtast filtre', ENU = 'Enter filters';
                    field(JournalBatchName; JournalBatchName)
                    {
                        ApplicationArea = All;
                        CaptionML = DAN = 'Kladdenavn', ENU = 'Journal Batch Name';

                        trigger OnValidate()
                        begin
                            IF NOT ReqWkshName.GET(WorksheetTemplateName, JournalBatchName) THEN BEGIN
                                MESSAGE(STRSUBSTNO(TOP002, JournalBatchName));
                                JournalBatchName := '';
                            END;
                        end;

                        trigger OnLookup(var Text: Text): Boolean
                        begin
                            CLEAR(PageReqWkshNames);
                            ReqWkshName.RESET;
                            ReqWkshName.FILTERGROUP(2);
                            ReqWkshName.SETRANGE("Worksheet Template Name", WorksheetTemplateName);
                            ReqWkshName.FILTERGROUP(0);
                            PageReqWkshNames.LOOKUPMODE(TRUE);
                            PageReqWkshNames.SETTABLEVIEW(ReqWkshName);
                            IF PageReqWkshNames.RUNMODAL = ACTION::LookupOK THEN BEGIN
                                PageReqWkshNames.GETRECORD(ReqWkshName);
                                JournalBatchName := ReqWkshName.Name;
                            END;
                        end;
                    }
                    field(JobNo; JobNo)
                    {
                        ApplicationArea = All;
                        CaptionML = DAN = 'Sagsnr.', ENU = 'Job No.';
                        trigger OnValidate()
                        begin
                            IF NOT Job.GET(JobNo) THEN BEGIN
                                MESSAGE(STRSUBSTNO(TOP003, JobNo));
                                JobNo := '';
                            END;
                        end;

                        trigger OnLookup(var Text: Text): Boolean
                        var
                            PageJobs: Page "Job List";
                            Job: Record Job;
                        begin
                            CLEAR(PageJobs);
                            Job.RESET;
                            PageJobs.LOOKUPMODE(TRUE);
                            PageJobs.SETTABLEVIEW(Job);
                            IF PageJobs.RUNMODAL = ACTION::LookupOK THEN BEGIN
                                PageJobs.GETRECORD(Job);
                                JobNo := Job."No.";
                            END;
                        end;
                    }
                    field(ReqDelDate; ReqDelDate)
                    {
                        ApplicationArea = All;
                        CaptionML = DAN = 'Ønsket leveringsdato', ENU = 'Requested delivery date';
                    }

                    field(RequestQty; RequestQty)
                    {
                        ApplicationArea = All;
                        CaptionML = DAN = 'Antal til bestilling', ENU = 'Requested quantity';
                    }
                }
            }
        }

        actions
        {
            area(processing)
            {
                action(ActionName)
                {
                    ApplicationArea = All;

                }
            }
        }
    }

    var
        WorksheetTemplateName: Code[20];
        JournalBatchName: code[20];
        JobNo: code[20];
        ReqDelDate: Date;
        LinesCreated: Boolean;
        Version: Code[20];
        ProdBOMNo: Code[20];
        Linjenr: Integer;
        CurrentLevel: Integer;
        LevelQty: Array[99] of Integer;
        LevelBOM: Array[99] of Code[20];
        RequestQty: Decimal;
        VersionMgt: Codeunit VersionManagement;
        Item: Record Item;
        Job: Record Job;
        ReqJnlLine: Record "Requisition Line";
        PageReqWkshNames: Page "Req. Wksh. Names";
        ReqWkshName: Record "Requisition Wksh. Name";
        TOP000: TextConst DAN = 'Der blev ikke fundet et kladdetypenavn tilhørende page 291', ENU = 'No worksheet template name found connected to page 291';
        TOP001: TextConst DAN = 'Angiv kladdenavn i anfordringen', ENU = 'Enter journal batch name';
        TOP002: TextConst DAN = 'Kladdenavn %1 ikke fundet', ENU = 'Journal Batch Name %1 not found';
        TOP003: TextConst DAN = 'Sag nr. %1 ikke fundet', ENU = 'Job no. %1 not found';
        TOP004: TextConst DAN = 'Antal til bestilling må ikke være 0', ENU = 'Requested quantity must not be 0';

    procedure SetProdBomNo(_ProdBomNo: Code[20])
    var
        myInt: Integer;
    begin
        ProdBOMNo := _ProdBomNo;
    end;

    procedure SetVersion(_Version: Code[20])
    var
        myInt: Integer;
    begin
        Version := _Version;
    end;

    procedure GetLinesCreated(): Boolean
    var
        myInt: Integer;
    begin
        EXIT(LinesCreated);
    end;

    procedure GetJnlVars(VAR _WorksheetTemplateName: Code[10]; VAR _JournalBatchName: Code[10])
    var
        myInt: Integer;
    begin
        _WorksheetTemplateName := WorksheetTemplateName;
        _JournalBatchName := JournalBatchName;
        message('%1 %2', _WorksheetTemplateName, _JournalBatchName);
    end;

    local procedure TransferToReqJnlLine()
    var
        ProdBomLine: Record "Production BOM Line";
        ReqJnlLine: Record "Requisition Line";
    begin
        LinesCreated := FALSE;

        IF Version = '' THEN
            Version := VersionMgt.GetBOMVersion(ProdBOMNo, WORKDATE, TRUE);

        ProdBomLine.Reset();
        ProdBomLine.SETRANGE("Production BOM No.", ProdBOMNo);
        ProdBomLine.SETRANGE("Version Code", Version);
        IF ProdBomLine.FINDSET(false, false) THEN BEGIN
            LinesCreated := TRUE;

            ReqJnlLine.Reset();
            ReqJnlLine.SETRANGE("Worksheet Template Name", WorksheetTemplateName);
            ReqJnlLine.SetRange("Journal Batch Name", JournalBatchName);
            IF ReqJnlLine.FindLast() THEN
                Linjenr := ReqJnlLine."Line No." + 10000
            ELSE
                Linjenr := 10000;

            REPEAT
                CLEAR(LevelQty);
                CLEAR(LevelBOM);
                CurrentLevel := 1;
                LevelQty[CurrentLevel] := ProdBomLine.Quantity * RequestQty;
                LevelBOM[CurrentLevel] := ProdBOMNo;
                IF ProdBomLine.Type = ProdBomLine.Type::Item THEN
                    InsertReqJnlLineItem(ProdBomLine)
                ELSE
                    IF ProdBomLine.Type = ProdBomLine.Type::"Production BOM" THEN
                        InsertReqJnlLineBOM(ProdBomLine);
            UNTIL ProdBomLine.NEXT = 0;
        END;
    end;

    local procedure InsertReqJnlLineItem(_ProdBomLine: Record "Production BOM Line")
    begin
        ReqJnlLine.Reset();
        ReqJnlLine.Init();
        ReqJnlLine.VALIDATE("Worksheet Template Name", WorksheetTemplateName);
        ReqJnlLine.VALIDATE("Journal Batch Name", JournalBatchName);
        ReqJnlLine.VALIDATE("Line No.", Linjenr);
        ReqJnlLine.INSERT(true);
        Linjenr += 10000;
        Item.GET(_ProdBomLine."No.");
        ReqJnlLine.VALIDATE(Type, ReqJnlLine.Type::Item);
        ReqJnlLine."No." := Item."No.";
        ReqJnlLine.VALIDATE(Quantity, LevelQty[CurrentLevel]);
        ReqJnlLine.VALIDATE("Unit of Measure Code", _ProdBomLine."Unit of Measure Code");
        ReqJnlLine.VALIDATE("Vendor No.", Item."Vendor No.");
        ReqJnlLine.VALIDATE(TopJobNo, JobNo);
        ReqJnlLine.VALIDATE(TopJobTaskNo, Item.TopJobTaskNo);
        ReqJnlLine.VALIDATE("Due Date", ReqDelDate);
        ReqJnlLine.VALIDATE(TopRevision, Item.TopCtRevision);
        ReqJnlLine.VALIDATE(TopSwCat, Item.TopCtSwCat);
        ReqJnlLine.VALIDATE(TopSubsupplier, Item.TopCtSubsupplier);
        ReqJnlLine.VALIDATE("Action Message", ReqJnlLine."Action Message"::New);
        ReqJnlLine.VALIDATE(TopProdBomNoMachTech, LevelBOM[CurrentLevel]);
        ReqJnlLine.MODIFY(true);
    end;

    local procedure InsertReqJnlLineBOM(_ProdBomLine: record "Production BOM Line")
    var
        ProdBomLine2: Record "Production BOM Line";
    begin
        Version := VersionMgt.GetBOMVersion(_ProdBomLine."No.", WORKDATE, TRUE);

        ProdBomLine2.RESET;
        ProdBomLine2.SETRANGE("Production BOM No.", _ProdBomLine."No.");
        ProdBomLine2.SETRANGE("Version Code", Version);
        IF ProdBomLine2.FINDSET THEN BEGIN
            CurrentLevel := CurrentLevel + 1;
            REPEAT
                IF CurrentLevel > 1 THEN
                    LevelQty[CurrentLevel] := ProdBomLine2.Quantity * LevelQty[CurrentLevel - 1];
                LevelBOM[CurrentLevel] := _ProdBomLine."No.";
                IF ProdBomLine2.Type = ProdBomLine2.Type::Item THEN
                    InsertReqJnlLineItem(ProdBomLine2)
                ELSE
                    IF ProdBomLine2.Type = ProdBomLine2.Type::"Production BOM" THEN
                        InsertReqJnlLineBOM(ProdBomLine2);
            UNTIL ProdBomLine2.NEXT = 0;
        END;

        CurrentLevel := CurrentLevel - 1;
    end;

    local procedure GetWorksheetTemplateName(): Code[20]
    var
        ReqWkshTemplate: Record "Req. Wksh. Template";
    begin
        ReqWkshTemplate.RESET;
        ReqWkshTemplate.SETRANGE("Page ID", 291);
        ReqWkshTemplate.SETRANGE(Type, ReqWkshTemplate.Type::"Req.");
        IF ReqWkshTemplate.FINDFIRST THEN
            EXIT(ReqWkshTemplate.Name);

        EXIT('');
    end;

    trigger OnInitReport()
    begin

        WorksheetTemplateName := GetWorksheetTemplateName();

        IF WorksheetTemplateName = '' THEN
            ERROR(TOP000);
    end;

    trigger OnPreReport()
    begin

        IF JournalBatchName = '' THEN
            ERROR(TOP001);
        IF RequestQty = 0 THEN
            ERROR(TOP004);

        TransferToReqJnlLine();
    end;

}