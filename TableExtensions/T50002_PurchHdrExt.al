tableextension 50002 TopPurchaceHeaderExt extends "Purchase Header"
{
    fields
    {
        // Add changes to table fields here
        field(50000; TopPurchaseStatus; Option)
        {
            CaptionML = ENU = 'Purchase Status', DAN = 'Indkøb Status';
            OptionMembers = Open,"Purchase sent","Ready for posting";
            OptionCaptionML = ENU = 'Open,Purchase Sent,Ready for posting',
                              DAN = 'Åben,Indkøb sendt,Klar til bogføring';
        }
        field(50001; TopOrderDate; Date)
        {
            CaptionML = ENU = 'Order Date (MT)', DAN = 'Ordre Dato (MT)';
        }
        field(50002; TopPurchaseInformation; Text[50])
        {
            CaptionML = ENU = 'Purchase Information', DAN = 'Købsinformation';
        }
    }

    var
        Vendor: Record Vendor;

}
