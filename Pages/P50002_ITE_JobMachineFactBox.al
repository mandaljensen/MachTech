page 50002 Top_JobMachineFactBox
{
    PageType = ListPart;
    SourceTable = IteMachineJob;
    CaptionML = DAN = 'Sag - Maskiner', ENU = 'Job - Machines';

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Machine No."; Rec.MachineNo)
                {
                    DrillDown = true;

                    trigger OnDrillDown();
                    begin
                        CLEAR(MachineRec);
                        CLEAR(MachinePage);

                        MachineRec.SETRANGE(No, Rec.MachineNo);
                        MachinePage.SETTABLEVIEW(MachineRec);
                        MachinePage.RUNMODAL
                    end;
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

    var
        MachinePage: Page Top_MachineCard;
        MachineRec: Record IteMachine;
}

