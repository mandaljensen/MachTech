pageextension 50003 Top_ItemCardExt extends "Item Card"
{
    layout
    {
        // Add changes to page layout here
        addafter("PreventNegInventoryDefaultNo")
        {
            field("ITE CT swCat"; Rec.TopCtSwCat)
            {
                ApplicationArea = All;
                ToolTip = 'ITE CT swCat';
            }
            field("ITE CT Int"; Rec.TopCtInt)
            {
                ApplicationArea = All;
                ToolTip = 'ITE CT Int';
            }
            field("CT Subsupplier"; Rec.TopCtSubsupplier)
            {
                ApplicationArea = All;
                ToolTip = 'CT Subsupplier';
            }
            field("CT MachineNo"; Rec.TopCtMachineNo)
            {
                ApplicationArea = All;
                ToolTip = 'CT MachineNo';
            }
            field("CT Ord 1"; Rec.TopCtOrdOne)
            {
                ApplicationArea = All;
                ToolTip = 'CT Ord_1';
            }
            field("CT Ord 2"; Rec.TopCtOrdTwo)
            {
                ApplicationArea = All;
                ToolTip = 'CT Ord_2';
            }
            field("CT Category 1"; Rec.TopCtCategoryOne)
            {
                ApplicationArea = All;
                ToolTip = 'CT Category_1';
            }
            field("CT Category 2"; Rec.TopCtCategoryTwo)
            {
                ApplicationArea = All;
                ToolTip = 'CT Category_2';
            }
            field("CT Material"; Rec.TopCtMaterial)
            {
                ApplicationArea = All;
                ToolTip = 'CT Material';
            }
            field("CT Revision"; Rec.TopCtRevision)
            {
                ApplicationArea = All;
                ToolTip = 'CT Revision';
            }
            field(TopJobTaskNo; Rec.TopJobTaskNo)
            {
                ApplicationArea = All;
                ToolTip = 'Job Task No';
            }
            field(TopStock; Rec.TopStock)
            {
                ApplicationArea = All;
                ToolTip = 'Stock';
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
        addafter("Vendor No.")
        {
            field(TopVendorName; Rec.TopVendorName)
            {
                ApplicationArea = All;
            }
        }
        addafter("Vendor Item No.")
        {
            field("Manufacturer Code"; Rec."Manufacturer Code")
            {
                ApplicationArea = All;
            }
            field(TOP_ManufacturerName; TOP_ManufacturerName)
            {
                ApplicationArea = All;
                ToolTip = 'Manufacturer Name';
            }

        }
    }

}