tableextension 50009 Top_PurchaseHeaderArchiveExt extends "Purchase Header Archive"
{
    fields
    {
        // Add changes to table fields here
        field(50000; TopMax; Integer)
        {
            FieldClass = FlowField;
            Editable = false;
            // CalcFormula = Max("Purchase Header Archive"."Version No." WHERE (Document Type=FIELD(Document Type),No.=FIELD(No.)))
            CalcFormula = Max ("Purchase Header Archive"."Version No." WHERE("Document Type" = FIELD("Document Type"), "No." = FIELD("No.")));
            CaptionML = ENU = 'Max', DAN = 'Max';

        }
        field(50001; TopShow; Boolean)
        {
            FieldClass = FlowField;
            Editable = false;
            // Exist("Purchase Header Archive" WHERE (Version No.=FIELD(ITEmax),Time Archived=FIELD(Time Archived),No.=FIELD(No.)))
            Calcformula = Exist ("Purchase Header Archive" WHERE("Version No." = FIELD(TopMax), "Time Archived" = FIELD("Time Archived"), "No." = FIELD("No.")));
            CaptionML = ENU = 'Show', DAN = 'Show';
        }


    }

    var
        myInt: Integer;

}
