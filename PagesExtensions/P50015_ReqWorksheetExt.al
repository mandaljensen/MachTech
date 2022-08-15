pageextension 50015 Top_ReqWorkSheetExt extends "Req. Worksheet"
{
    layout
    {
        addafter(Description)
        {
            field(TopJobNo; Rec.TopJobNo)
            {
                ApplicationArea = All;
                ToolTip = 'Job No. for line';
            }
            field(TopJobTaskNo; TopJobTaskNo)
            {
                ApplicationArea = All;
                ToolTip = 'Job Task No. for line';
            }
            field(ProdBomNo; Rec.TopProdBomNoMachTech)
            {
                ApplicationArea = All;
                ToolTip = 'Prod. BOM No. for line';
            }
        }
        addlast(Control1)
        {
            field(TopSwCat; TopSwCat)
            {
                ApplicationArea = All;
                ToolTip = 'SwCat';
            }
            field(TopSubsupplier; TopSubsupplier)
            {
                ApplicationArea = All;
                ToolTip = 'SubSupplier';
            }
            field(Stock; Item.TopStock)
            {
                ApplicationArea = All;
                ToolTip = 'Stock from Item';
                Editable = false;
            }
        }
        /*         addafter("Vendor No.")
                {
                    field("Vendor Name"; "Vendor Name")
                    {
                        ApplicationArea = All;
                        ToolTip = 'Specifies the value of the Vendor Name field.';
                    }
                }
         */
    }

    trigger OnAfterGetRecord()
    begin
        if type = type::Item then
            if not Item.Get("No.") then
                Clear(Item);
    end;

    var
        Item: Record Item;
}