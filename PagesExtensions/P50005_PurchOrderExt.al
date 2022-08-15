pageextension 50005 Top_PurchaseOrderExt extends "Purchase Order"
{
    layout
    {

        addafter(Status)
        {
            field(TopPurchaseStatus; Rec.TopPurchaseStatus)
            {
                ApplicationArea = All;
            }
            field(TopPurchaseInformation; Rec.TopPurchaseInformation)
            {
                ApplicationArea = All;
            }
            field(TopOrderDate; Rec.TopOrderDate)
            {
                ApplicationArea = All;
            }

        }
    }
    actions
    {
        addlast("P&osting")
        {
            action("Receive Only")
            {
                CaptionML = ENU = 'Receive Only', DAN = 'Kun Modtag';
                trigger OnAction();
                var
                    ItePurchPostOnlyReceive: Codeunit ITEPurch_Receive;
                begin
                    ItePurchPostOnlyReceive.Run(Rec);
                end;
            }

        }

    }

    var
        myInt: Integer;

}