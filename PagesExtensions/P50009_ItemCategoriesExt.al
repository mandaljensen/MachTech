pageextension 50009 Top_ItemCategoriesExt extends "Item Categories"
{
    layout
    {
        addafter(Description)
        {
            field(TopJobTaskNo; Rec.TopJobTaskNo)
            {
                ApplicationArea = All;
            }

        }
    }
}