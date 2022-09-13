tableextension 50006 TopJobExt extends Job
{
    fields
    {
        field(50000; TopExternalDocNo; Code[35])
        {
            Caption = 'External Document No.';
        }

        field(50001; TopPersonResponsible; Code[20])
        {
            TableRelation = Employee;
            Caption = 'Person Responsible';
        }
        field(50002; "PO. Outs. Amt. Ex.VAT (LCY)"; Decimal)
        {
            Caption = 'PO Outs. Amt. Ex. VAT (LCY)';
            FieldClass = FlowField;
            CalcFormula = sum("Purchase Line"."Outstanding Amt. Ex. VAT (LCY)" where("Job No." = field("No.")));
        }
        field(50003; "PO.A.Rcd. Not Inv.Ex.VAT (LCY)"; Decimal)
        {
            Caption = 'PO Amt. Rcd. Not Inv. Ex. VAT (LCY)';
            FieldClass = FlowField;
            CalcFormula = sum("Purchase Line"."A. Rcd. Not Inv. Ex. VAT (LCY)" where("Job No." = field("No.")));
        }
    }
}
