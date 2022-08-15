report 50010 TopMachTechJobAnalysis
{
    DefaultLayout = RDLC;
    RDLCLayout = './Reports/TopJobAnalysis.rdlc';
    Caption = 'Job Analysis Mach-Tech';
    PreviewMode = PrintLayout;
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    dataset
    {
        dataitem(JobDataItem; Job)
        {
            PrintOnlyIfDetail = true;
            RequestFilterFields = "No.", "Posting Date Filter", "Planning Date Filter";
            column(TodayFormatted; FORMAT(TODAY, 0, 4))
            {
            }
            column(CompanyName; COMPANYNAME)
            {
            }
            column(JobtableCaptJobFilter; TABLECAPTION + ': ' + JobFilter)
            {
            }
            column(JobFilter; JobFilter)
            {
            }
            column(JobTasktableCaptFilter; JobTaskdataItem.TABLECAPTION + ': ' + JobTaskFilter)
            {
            }
            column(JobTaskFilter; JobTaskFilter)
            {
            }
            column(No_Job; JobCaptionLbl + "No.")
            {
            }
            column(CurrReportPageNoCaption; CurrReportPageNoCaptionLbl)
            {
            }
            column(JobAnalysisCapt; JobAnalysisCaptLbl)
            {
            }
            column(PriceCapt; PriceLbl)
            {
            }
            column(TotalPrice; TotalPrice)
            {
            }
            column(CostLblCapt; CostLbl)
            {
            }
            column(TotalCost; TotalCost)
            {
            }
            column(InvoicedCapt; InvoicedLbl)
            {
            }
            column(InvoicedTotal; InvoicedTotal)
            {
            }
            column(DBCapt; DBLbl)
            {
            }
            column(DB; DB)
            {
            }
            column(DGCapt; DGLbl)
            {
            }
            column(DG; DG)
            {
            }
            dataitem(JobTaskDataItem; "Job Task")
            {
                DataItemLink = "Job No." = FIELD("No.");
                DataItemTableView = SORTING("Job No.", "Job Task No.");
                RequestFilterFields = "Job Task No.";
                column(HeadLineText8; HeadLineText[8])
                {
                }
                column(HeadLineText7; HeadLineText[7])
                {
                }
                column(HeadLineText6; HeadLineText[6])
                {
                }
                column(HeadLineText5; HeadLineText[5])
                {
                }
                column(HeadLineText4; HeadLineText[4])
                {
                }
                column(HeadLineText3; HeadLineText[3])
                {
                }
                column(HeadLineText2; CostAmountLbl)
                {
                }
                column(HeadLineText1; CostAmountLbl)
                {
                }
                column(Description_Job; JobDataItem.Description)
                {
                }
                column(DescriptionCaption; DescriptionCaptionLbl)
                {
                }
                column(JobTaskNoCapt; JobTaskNoCaptLbl)
                {
                }
                column(HoursUsedCapt; HoursUsedCaptionLbl)
                {
                }
                column(HoursScheduledCapt; HoursScheduledCaptionLbl)
                {
                }
                column(UsedPercentageCapt; UsedPercentageCaptionLbl)
                {
                }
                column(BudgetCpt; BudgetLbl)
                {
                }
                column(RealCpt; RealiseretLbl)
                {
                }
                dataitem(BlankLine; Integer)
                {
                    DataItemTableView = SORTING(Number);

                    trigger OnPreDataItem()
                    begin
                        SETRANGE(Number, 1, JobTaskDataItem."No. of Blank Lines");
                    end;
                }
                dataitem(DataItem5444; Integer)
                {
                    DataItemTableView = SORTING(Number)
                                        WHERE(Number = CONST(1));
                    column(JobTaskNo_JobTask; JobTaskDataItem."Job Task No.")
                    {
                    }
                    column(Indentation_JobTask; PADSTR('', 2 * JobTaskDataItem.Indentation) + JobTaskDataItem.Description)
                    {
                    }
                    column(ShowIntBody1; JobTaskDataItem."Job Task Type" IN [JobTaskDataItem."Job Task Type"::Heading, JobTaskDataItem."Job Task Type"::"Begin-Total"])
                    {
                    }
                    column(HoursUsed; UsedHours)
                    {
                    }
                    column(HoursScheduled; JobTaskDataItem.TopScheduleHours)
                    {
                    }
                    column(UsedPercentage; UsedPercentage)
                    {
                    }
                    column(Amt1; Amt[1])
                    {
                    }
                    column(Amt2; Amt[2])
                    {
                    }
                    column(Amt3; Amt[3])
                    {
                    }
                    column(Amt4; Amt[4])
                    {
                    }
                    column(Amt5; Amt[5])
                    {
                    }
                    column(Amt6; Amt[6])
                    {
                    }
                    column(Amt7; Amt[7])
                    {
                    }
                    column(Amt8; Amt[8])
                    {
                    }
                    column(ShowIntBody2; JobTaskDataItem."Job Task Type" IN [JobTaskDataItem."Job Task Type"::Total, JobTaskDataItem."Job Task Type"::"End-Total"])
                    {
                    }
                    column(ShowIntBody3; (JobTaskDataItem."Job Task Type" IN [JobTaskDataItem."Job Task Type"::Posting]) AND PrintSection)
                    {
                    }

                    trigger OnAfterGetRecord()
                    begin
                        PrintSection := TRUE;
                        IF ExcludeJobTask THEN BEGIN
                            PrintSection := FALSE;
                            FOR I := 1 TO 8 DO
                                IF (Amt[I] <> 0) AND (AmountField[I] <> AmountField[I] ::" ") THEN
                                    PrintSection := TRUE;
                        END;
                    end;
                }

                trigger OnAfterGetRecord()
                begin
                    CLEAR(JobCalcStatistics);
                    // Tjek
                    // CALCFIELDS("Schedule (Hours)");
                    CalcFields(TopScheduleHours);

                    // Er task en optælling eller ej?
                    IF JobTaskDataItem.Totaling = '' THEN BEGIN
                        CalcUsedHours(JobDataItem."No.", "Job Task No.");
                        // Gem beregnede timer til array, som bruges ved opsummeringslinjer.
                        UsedIndex += 1;
                        UsedTaskNo[UsedIndex] := "Job Task No.";
                        UsedQty[UsedIndex] := UsedHours;
                    END ELSE
                        GetUsedTotal(JobTaskDataItem.Totaling);

                    JobCalcStatistics.ReportAnalysis(JobDataItem, JobTaskDataItem, Amt, AmountField, CurrencyField, FALSE);
                    IF Amt[1] <> 0 THEN
                        UsedPercentage := ROUND(Amt[2] / Amt[1] * 100, 0.1)
                    ELSE
                        UsedPercentage := 0;
                end;
            }

            trigger OnAfterGetRecord()
            begin

                AmountField[1] := AmountField::"Schedule Cost";
                AmountField[2] := AmountField::"Usage Cost";
                AmountField[3] := AmountField::"Schedule Price";
                AmountField[4] := AmountField::"Invoiced Price";
                CurrencyField[1] := CurrencyField::"Local Currency";
                CurrencyField[2] := CurrencyField::"Local Currency";
                CurrencyField[3] := CurrencyField::"Local Currency";
                CurrencyField[4] := CurrencyField::"Local Currency";

                JobCalcStatistics.GetHeadLineText(AmountField, CurrencyField, HeadLineText, JobDataItem);

                // Hent totaler til hoved:
                GetJobTotals("No.");
                UsedIndex := 0;
                CLEAR(UsedTaskNo);
                CLEAR(UsedQty);
            end;
        }
    }

    requestpage
    {
        SaveValues = true;

        layout
        {
            area(content)
            {
                group(Indstillinger)
                {
                    Caption = 'Options';
                    field(ExcludeJobTask; ExcludeJobTask)
                    {
                        Caption = 'Exclude Zero-Lines';
                        MultiLine = true;
                    }
                }
            }
        }

        actions
        {
        }
    }

    labels
    {
    }

    trigger OnPreReport()
    begin
        JobFilter := JobDataItem.GETFILTERS;
        JobTaskFilter := JobTaskDataItem.GETFILTERS;
    end;

    var
        JobCalcStatistics: Codeunit "Job Calculate Statistics";
        HeadLineText: array[8] of Text[50];
        Amt: array[8] of Decimal;
        AmountField: array[8] of Option " ","Schedule Price","Usage Price","Contract Price","Invoiced Price","Schedule Cost","Usage Cost","Contract Cost","Invoiced Cost","Schedule Profit","Usage Profit","Contract Profit","Invoiced Profit";
        CurrencyField: array[8] of Option "Local Currency","Foreign Currency";
        JobFilter: Text;
        JobTaskFilter: Text;
        ExcludeJobTask: Boolean;
        PrintSection: Boolean;
        I: Integer;
        CurrReportPageNoCaptionLbl: Label 'Page';
        JobAnalysisCaptLbl: Label 'Job Analysis';
        DescriptionCaptionLbl: Label 'Description';
        JobTaskNoCaptLbl: Label 'Task No.';
        HoursUsedCaptionLbl: Label 'Hours used';
        HoursScheduledCaptionLbl: Label 'Hours scheduled';
        UsedPercentageCaptionLbl: Label '%';
        JobCaptionLbl: label 'Job';
        UsedPercentage: Decimal;
        CostAmountLbl: Label 'Cost amount';
        BudgetLbl: Label 'BUDGET';
        RealiseretLbl: Label 'ACHIEVEMENT';
        InvoicedLbl: Label 'Invoiced, DKK';
        InvoicedTotal: Decimal;
        TotalPrice: Decimal;
        TotalCost: Decimal;
        DB: Decimal;
        DG: Decimal;
        CostLbl: Label 'Cost:';
        PriceLbl: Label 'Price:';
        DBLbl: Label 'DB:';
        DGLbl: Label 'DG %:';
        UsedHours: Decimal;
        UsedTaskNo: array[100] of Code[20];
        UsedQty: array[100] of Decimal;
        UsedIndex: Integer;

    // [Scope('Internal')]
    procedure InitializeRequest(NewAmountField: array[8] of Option " ","Schedule Price","Usage Price","Contract Price","Invoiced Price","Schedule Cost","Usage Cost","Contract Cost","Invoiced Cost","Schedule Profit","Usage Profit","Contract Profit","Invoiced Profit"; NewCurrencyField: array[8] of Option "Local Currency","Foreign Currency"; NewExcludeJobTask: Boolean)
    begin
        AmountField[1] := NewAmountField[1];
        CurrencyField[1] := NewCurrencyField[1];
        AmountField[2] := NewAmountField[2];
        CurrencyField[2] := NewCurrencyField[2];
        AmountField[3] := NewAmountField[3];
        CurrencyField[3] := NewCurrencyField[3];
        AmountField[4] := NewAmountField[4];
        CurrencyField[4] := NewCurrencyField[4];
        AmountField[5] := NewAmountField[5];
        CurrencyField[5] := NewCurrencyField[5];
        AmountField[6] := NewAmountField[6];
        CurrencyField[6] := NewCurrencyField[6];
        AmountField[7] := NewAmountField[7];
        CurrencyField[7] := NewCurrencyField[7];
        AmountField[8] := NewAmountField[8];
        CurrencyField[8] := NewCurrencyField[8];
        ExcludeJobTask := NewExcludeJobTask;
    end;

    local procedure GetJobTotals(JobNo: Code[20])
    var
        JobTask: Record "Job Task";
        JobPlanningLine: Record "Job Planning Line";
        JobPlanningLineInvoice: Record "Job Planning Line Invoice";
    begin
        InvoicedTotal := 0;
        TotalCost := 0;
        TotalPrice := 0;
        DB := 0;
        DG := 0;

        // Total price:
        JobPlanningLine.SETRANGE("Job No.", JobNo);
        // Tjek optionvalue
        JobPlanningLine.SETRANGE("Line Type", JobPlanningLine."Line Type"::Budget);
        JobPlanningLine.SETRANGE(Type, JobPlanningLine.Type::"G/L Account");
        IF JobPlanningLine.FINDSET(FALSE, FALSE) THEN
            REPEAT
                TotalPrice += JobPlanningLine."Line Amount (LCY)";
            UNTIL (JobPlanningLine.NEXT = 0);

        // Total invoiced:
        // Find først evt. overført startsaldo (pr. 30-09-2015):
        JobPlanningLine.SETRANGE("Job No.", JobNo);
        //  Tjek optionvalue
        JobPlanningLine.SETRANGE("Line Type", JobPlanningLine."Line Type"::Billable);
        JobPlanningLine.SETRANGE(Type, JobPlanningLine.Type::"G/L Account");
        JobPlanningLine.SETRANGE("Planning Date", 20150930D);
        IF JobPlanningLine.FindFirst() THEN
            InvoicedTotal += JobPlanningLine."Line Amount";

        JobPlanningLineInvoice.SETRANGE("Job No.", JobNo);
        JobDataItem.CopyFilter("Posting Date Filter", JobPlanningLineInvoice."Invoiced Date");
        IF JobPlanningLineInvoice.FindSet(FALSE, FALSE) THEN
            REPEAT
                InvoicedTotal += JobPlanningLineInvoice."Invoiced Amount (LCY)";
            UNTIL (JobPlanningLineInvoice.Next() = 0);

        // Find højeste Task nummer og beregn derefter total cost og dækningsbidrag:
        JobTask.SETRANGE("Job No.", JobNo);
        IF JobTask.FINDLAST THEN BEGIN
            JobCalcStatistics.ReportAnalysis(JobDataItem, JobTask, Amt, AmountField, CurrencyField, FALSE);
            TotalCost := Amt[2];
            //DB/DG:
            DB := TotalPrice - TotalCost;
            IF TotalPrice <> 0 THEN
                DG := DB / TotalPrice * 100;
        END;
    end;

    local procedure CalcUsedHours(JobNo: Code[20]; TaskNo: Code[20])
    var
        JobLedgerEntry: Record "Job Ledger Entry";
        FilterPos: Integer;
    begin
        UsedHours := 0;
        FilterPos := 0;

        JobLedgerEntry.SETRANGE("Job No.", JobNo);
        JobLedgerEntry.SETRANGE("Job Task No.", TaskNo);
        JobLedgerEntry.SETRANGE("Entry Type", JobLedgerEntry."Entry Type"::Usage);
        JobLedgerEntry.SETRANGE("Unit of Measure Code", 'TIME');
        JobDataItem.COPYFILTER("Posting Date Filter", JobLedgerEntry."Posting Date");

        IF JobLedgerEntry.FINDSET(FALSE, FALSE) THEN
            REPEAT
                UsedHours += JobLedgerEntry.Quantity;
            UNTIL (JobLedgerEntry.NEXT = 0);
    end;

    local procedure GetUsedTotal(Totalfilter: Text[250])
    var
        FromTask: Code[20];
        ToTask: Code[20];
        i: Integer;
    begin
        UsedHours := 0;
        ToTask := '';
        i := STRPOS(Totalfilter, '..');
        IF i > 0 THEN BEGIN
            FromTask := COPYSTR(Totalfilter, 1, i - 1);
            IF STRLEN(Totalfilter) > i + 2 THEN
                ToTask := COPYSTR(Totalfilter, i + 2);
        END ELSE
            FromTask := Totalfilter;

        IF ToTask = '' THEN
            ToTask := FromTask;

        i := 0;
        WHILE i < UsedIndex DO BEGIN
            i += 1;
            IF (UsedTaskNo[i] >= FromTask) AND (UsedTaskNo[i] <= ToTask) THEN
                UsedHours += UsedQty[i];
        END;
    end;
}
