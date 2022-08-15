pageextension 50002 Top_VendorCardExt extends "Vendor Card"
{
    layout
    {
        addafter("Purchaser Code")
        {
            field("ITE Information"; Rec.TopPurchaceInformation)
            {
                ApplicationArea = All;
            }
        }
    }
}