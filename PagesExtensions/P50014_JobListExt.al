pageextension 50014 Top_JobListExt extends "Job List"
{
    layout
    {
        addlast(FactBoxes)
        {

            part(Machines; Top_JobMachineFactBox)
            {
                ApplicationArea = All;
                SubPageLink = JobNo = field("No.");
                CaptionML = DAN = 'Maskiner', ENU = 'Machines';
            }

        }

    }
    actions
    {
        addlast(Reporting)
        {
            action("MachTech Job Analysis")
            {
                ApplicationArea = All;
                CaptionML = ENU = 'MachTech Job Analysis', DAN = 'MachTech Sagsanalyse';
                trigger OnAction();
                var
                    IteJobAnalysisReport: Report TopMachTechJobAnalysis;
                begin
                    IteJobAnalysisReport.Run;
                end;
            }

        }
    }

}