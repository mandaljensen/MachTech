tableextension 50003 TopPurchaseLineExt extends "Purchase Line"
{
    fields
    {
        field(50000; TopDateReceived; Date)
        {
            CaptionML = ENU = 'Date Received', DAN = 'Modtaget d.';
        }
        field(50001; TopCreatedBy; Code[20])
        {
            // Employee WHERE (Initials=CONST())
            Editable = false;
            CaptionML = ENU = 'Created By', DAN = 'Oprettet af';
        }
        field(50002; TopReceivedBy; Code[20])
        {
            // Employee WHERE (Initials=CONST())
            Editable = false;
            CaptionML = ENU = 'Received By', DAN = 'Modtaget af';
        }
        field(50003; TopReceivedByTemp; Code[20])
        {
            // Dette felt skal fjernes igen
            //

            FieldClass = FlowField;
            CalcFormula = lookup("Purch. Rcpt. Line".TopReceivedBy where("Order No." = field("Document No."), "Order Line No." = field("Line No.")));

            Editable = false;
            CaptionML = ENU = 'Received By', DAN = 'Modtaget af';
        }

        field(50006; TopProdBomNoMachTech; Code[20])
        {
            TableRelation = "Production BOM Header";
            CaptionML = ENU = 'Prod. BOM (MT)', DAN = 'Prod. Stykliste (MT)';
        }
    }

    var
        myInt: Integer;


}
