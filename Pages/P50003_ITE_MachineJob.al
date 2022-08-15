page 50003 Top_MachineJob
{
    PageType = ListPart;
    SourceTable = IteMachineJob;
    CaptionML = DAN = 'Maskine - Sager', ENU = 'Machine - Jobs';

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(MachineNo; Rec.MachineNo)
                {
                }
                field(JobNo; Rec.JobNo)
                {
                }
                field(Description; Rec.Description)
                {
                }
            }
        }
    }

    actions
    {
    }

    trigger OnNewRecord(BelowxRec: Boolean);
    begin
        Rec.JobNo := Rec.Jobno;
    end;

    var
        Jobno: Code[30];

    procedure setjob(Injobno: Code[30]);
    begin
        Rec.Jobno := Injobno;
    end;
}

