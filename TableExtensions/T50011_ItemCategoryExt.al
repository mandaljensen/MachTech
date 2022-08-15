tableextension 50011 Top_ItemCategoryExt extends "Item Category"
{
    fields
    {
        // Add changes to table fields here
        field(50000; TopJobTaskNo; Code[20])
        {
            CaptionML = ENU = 'Job Task No.', DAN = 'Sagsopgavenr.';
        }

    }

    var
        myInt: Integer;

}
