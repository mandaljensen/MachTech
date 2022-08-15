pageextension 50010 PurchaseOrderListExt extends "Purchase Order List"
{
    layout
    {
        addafter("Document Date")
        {
            field(TopPurchaseStatus; TopPurchaseStatus)
            {
                ApplicationArea = All;
            }
        }
    }
    actions
    {
        // Add changes to page actions here
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
}