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

    }
}
