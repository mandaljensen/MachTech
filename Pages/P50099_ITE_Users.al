page 50099 IteUserList
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = IteUsers;

    layout
    {
        area(Content)
        {
            group(GroupName)
            {
                field(Employee; Rec.Employee)
                {
                    ApplicationArea = All;

                }
                field(UserSecurityId; Rec.UserSecurityId)
                {
                    ApplicationArea = All;
                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(ActionName)
            {
                ApplicationArea = All;

                trigger OnAction()
                begin

                end;
            }
        }
    }

    var
        myInt: Integer;
}