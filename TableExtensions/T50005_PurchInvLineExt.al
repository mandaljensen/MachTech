tableextension 50005 TopPurchInvLineExt extends "Purch. Inv. Line"
{
    fields
    {
        field(50000; TopDateReceived; Date)
        {
            CaptionML = ENU = 'Received Date', DAN = 'Modtaget d.';
        }
        field(50001; TopCreatedBy; Code[20])
        {
            // TableRelation = Employee WHERE (Initials=CONST())
            // TableRelation = Employee;
            CaptionML = ENU = 'Created By', DAN = 'Oprettet af';
        }
        field(50002; TopReceivedBy; Code[20])
        {
            CaptionML = ENU = 'Received By', DAN = 'Modtaget af';
        }


    }

    var
        myInt: Integer;

}
