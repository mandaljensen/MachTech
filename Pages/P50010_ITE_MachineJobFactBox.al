page 50010 Top_MachineJobFactBox
{
    CaptionML = DAN = 'Maskine - Sager', ENU = 'Machines - Jobs';
    DelayedInsert = false;
    DeleteAllowed = false;
    Editable = false;
    InsertAllowed = false;
    ModifyAllowed = false;
    PageType = ListPart;
    ShowFilter = false;
    SourceTable = IteMachineJob;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Job No."; Rec.JobNo)
                {
                    TableRelation = Job;

                    trigger OnDrillDown();
                    begin

                        // To be classified
                        IF Job.GET(Rec.JobNo) THEN
                            PAGE.RUNMODAL(88, Job);
                    end;
                }
                field("Job Description"; Rec.JobDescription)
                {
                }
            }
        }
    }

    var
        Job: Record Job;

}


