pageextension 50006 Top_JobCardExt extends "Job Card"
{
    layout
    {
        addlast(General)
        {
            field(TopPersonResponsible; TopPersonResponsible)
            {
                ApplicationArea = All;
            }
            field(TopExternalDocNo; TopExternalDocNo)
            {
                ApplicationArea = All;
            }
        }
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
        addlast(reporting)
        {
            action("MachTech Job Analysis")
            {
                CaptionML = ENU = 'MachTech Job Analysis', DAN = 'MachTech Sagsanalyse';
                trigger OnAction();
                var
                    IteJobAnalysisReport: Report TopMachTechJobAnalysis;
                begin
                    IteJobAnalysisReport.Run;
                end;
            }

        }
        addlast(processing)
        {
            action(AttachMachine)
            {
                Caption = 'Attach Machine';
                Image = AddAction;
                RunObject = page Top_MachineJob;
                RunPageLink = JobNo = field("No.");
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                ToolTip = 'Attach Machines to Job';
            }
        }
    }

}