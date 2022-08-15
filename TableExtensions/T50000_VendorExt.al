tableextension 50000 Top_VendorExt extends Vendor
{
    fields
    {
        // Add changes to table fields here
        field(50000; TopPurchaceInformation; Text[50])
        {
            CaptionML = ENU = 'Purchase Information', DAN = 'Købsinformation';
        }

    }

    var
        myInt: Integer;

}
