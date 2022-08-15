page 50001 Top_MachineCard
{
    CaptionML = DAN = 'Maskine', ENU = 'Machine';
    SourceTable = IteMachine;

    layout
    {
        area(content)
        {
            field(No; Rec.No)
            {
                Importance = Promoted;

                trigger OnAssistEdit();
                begin
                    IF Rec.No = '' THEN BEGIN
                        Rec.No := NoSeriesMgt.GetNextNo('MASKINE', WORKDATE, TRUE);
                        CurrPage.UPDATE;
                    END;
                end;
            }
            field(Description; Rec.Description)
            {

            }
            field(CustomerID; Rec.CustomerNo)
            {
            }
        }
    }

    actions
    {
    }

    trigger OnClosePage();
    begin
        IF Rec.No = '' THEN
            Rec.DELETE;

        IF Jobno <> '' THEN BEGIN
            JobLink.INIT;
            JobLink.MachineNo := Rec.No;
            JobLink.JobNo := Jobno;
            JobLink.INSERT;
        END
    end;

    trigger OnNewRecord(BelowxRec: Boolean);
    begin
        IF Rec.No = '' THEN BEGIN
            Rec.No := NoSeriesMgt.GetNextNo('MASKINE', WORKDATE, TRUE);
        END;
    end;

    var
        NoSeriesMgt: Codeunit NoSeriesManagement;
        Jobno: Code[20];
        JobLink: Record IteMachineJob;

    local procedure AssistEdit() AssistEdit: Boolean;
    begin

        AssistEdit := TRUE;
    end;

    procedure setJob(inJob: Code[20]);
    begin
        Jobno := inJob;
    end;

}

