page 50004 "TO-Plus Toolbox"
{

    Caption = 'TO-Plus Toolbox';
    PageType = Card;
    SourceTable = "integer";
    ApplicationArea = all;
    UsageCategory = Administration;

    layout
    {
        area(content)
        {
            group(General)
            {
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(ChangeUsers)
            {
                Caption = 'Ret brugere';
                ToolTip = 'Ret brugere';
                Image = ChangeTo;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;

                trigger OnAction()
                var
                    UserPersonalization: Record "User Personalization";

                begin
                    if UserPersonalization.FindSet(true, false) then
                        repeat
                            if UserPersonalization."Profile ID" <> '' then begin
                                UserPersonalization."Profile ID" := 'BOOKKEEPER';
                                UserPersonalization.Modify(false);
                            end;
                        until (UserPersonalization.Next() <= 0);
                end;
            }
        }
    }

}
