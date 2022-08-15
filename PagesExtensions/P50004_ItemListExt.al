pageextension 50004 Top_ItemListExt extends "Item List"
{
    layout
    {
        addafter(Description)
        {
            field("Description 2"; "Description 2")
            {
                ApplicationArea = All;
                ToolTip = 'Type Number from Item';
            }
        }
        addafter("Gen. Prod. Posting Group")
        {
            field(TopStock; Rec.TopStock)
            {
                ApplicationArea = All;
                ToolTip = 'Stock';
            }
            field(TopVendorName; Rec.TopVendorName)
            {
                ApplicationArea = All;
                ToolTip = 'Vendor Name';
            }

        }

    }
}