pageextension 50012 Top_Manufacturers extends Manufacturers
{
    layout
    {
        // Add changes to page layout here
        addafter(Name)
        {
            field(TopManufactureCode; Rec.TopManufactureCode)
            {
                ApplicationArea = All;
            }
        }
    }
}