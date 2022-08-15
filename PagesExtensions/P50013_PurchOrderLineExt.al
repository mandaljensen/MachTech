pageextension 50013 Top_PurchaseOrderLineExt extends "Purchase Order Subform"
{
    layout
    {
        // Add changes to page layout here
        addafter("Location Code")
        {
            field(TopCreatedBy; Rec.TopCreatedBy)
            {
                ApplicationArea = All;
            }
            field(TopDateReceived; Rec.TopDateReceived)
            {
                ApplicationArea = All;
            }
            field(TopReceivedBy; Rec.TopReceivedBy)
            {
                ApplicationArea = All;
            }
            field(TopProdBomNoMachTech; Rec.TopProdBomNoMachTech)
            {
                ApplicationArea = All;
            }

        }
        addafter(Description)
        {
            field("Description 2"; Rec."Description 2")
            {
                ApplicationArea = All;
                ToolTip = 'Type Number';
                Caption = 'Type Number';
            }
        }


    }
}


