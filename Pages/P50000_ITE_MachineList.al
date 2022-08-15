page 50000 Top_MachineList
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = IteMachine;
    CaptionML = DAN = 'Maskiner', ENU = 'Machines';

    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
                field(CustomerID; Rec.CustomerNo)
                {
                    ApplicationArea = All;

                }
                field("Customer Name"; Rec.CustomerName)
                {
                    ApplicationArea = All;

                }
                field("No."; Rec.No)
                {
                    ApplicationArea = All;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = All;
                }

            }
        }
        area(Factboxes)
        {
            part(Jobs; Top_MachineJobFactBox)
            {
                SubPageLink = MachineNo = FIELD(No);
            }

        }
    }

    actions
    {
        area(Processing)
        {
            action(TempShowIteUsers)
            {
                ApplicationArea = All;

                trigger OnAction();
                begin
                    IteuserListTemp.Run();

                end;
            }

        }

        area(Reporting)
        {
            action(MachineList)
            {
                Caption = 'Machine List';
                ApplicationArea = All;

                trigger OnAction();
                begin
                    Report.Run(50000);

                end;
            }

        }
    }
    var
        IteuserListTemp: Page IteUserList;

}