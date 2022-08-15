page 50011 Top_MachineCustomerFactBox
{
    PageType = ListPart;
    SourceTable = IteMachine;
    CaptionML = DAN = 'Maskine - Kunder', ENU = 'Machines - Customers';

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(No; Rec.No)
                {
                    TableRelation = Job;

                    trigger OnDrillDown();
                    begin
                        CLEAR(JobRec);
                        CLEAR(JobPage);
                        JobRec.SETRANGE(JobRec.MachineNo, Rec.No);
                        JobPage.SETTABLEVIEW(JobRec);
                        JobPage.RUNMODAL;

                        //IF Job.GET("Job No.") THEN
                        //   PAGE.RUNMODAL(88, Job);

                        //JobPage.SETTABLEVIEW(Job);
                        //JobPage.RUNMODAL;
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
        JobRec: Record IteMachineJob;
        JobPage: Page Top_MachineJobFactBox;
}

