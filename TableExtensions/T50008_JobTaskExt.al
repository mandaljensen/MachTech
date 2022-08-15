tableextension 50008 Top_JobTaskExt extends "Job Task"
{
    fields
    {
        // Add changes to table fields here
        field(50000; TopUsageHours; Decimal)
        {
            FieldClass = FlowField;
            Editable = false;
            BlankZero = true;
            // Sum("Job Ledger Entry".Quantity WHERE ("Job No."=FIELD("Job No."),"Job Task No."=FIELD("Job Task No."),"Job Task No."=FIELD(FILTER(Totaling)),Entry Type=CONST(Usage),Posting Date=FIELD(Posting Date Filter),Unit of Measure Code=CONST(TIME)))
            CalcFormula = Sum ("Job Ledger Entry".Quantity WHERE("Job No." = FIELD("Job No."), "Job Task No." = FIELD("Job Task No."), "Job Task No." = FIELD(FILTER(Totaling)), "Entry Type" = CONST(Usage), "Posting Date" = FIELD("Posting Date Filter"), "Unit of Measure Code" = CONST('TIME')));
            CaptionML = ENU = 'Usage (Hours)', DAN = 'Forbrug (Timer)';

        }
        field(50001; TopScheduleHours; Decimal)
        {
            FieldClass = FlowField;
            Editable = false;
            BlankZero = true;
            // Sum("Job Planning Line".Quantity WHERE (Job No.=FIELD(Job No.),Job Task No.=FIELD(Job Task No.),Job Task No.=FIELD(FILTER(Totaling)),Schedule Line=CONST(Yes),Planning Date=FIELD(Planning Date Filter),Unit of Measure Code=CONST(TIME)))
            CalcFormula = Sum ("Job Planning Line".Quantity WHERE("Job No." = FIELD("Job No."), "Job Task No." = FIELD("Job Task No."), "Job Task No." = FIELD(FILTER(Totaling)), "Schedule Line" = CONST(TRUE), "Planning Date" = FIELD("Planning Date Filter"), "Unit of Measure Code" = CONST('TIME')));
            CaptionML = ENU = 'Schedule (Hours)', DAN = 'Budget (Timer)';

        }
        field(50002; TopContractHours; Decimal)
        {
            FieldClass = FlowField;
            Editable = false;
            BlankZero = true;
            // Sum("Job Planning Line".Quantity WHERE (Job No.=FIELD(Job No.),Job Task No.=FIELD(Job Task No.),Job Task No.=FIELD(FILTER(Totaling)),Contract Line=CONST(Yes),Planning Date=FIELD(Planning Date Filter),Unit of Measure Code=CONST(TIME)))
            CalcFormula = Sum ("Job Planning Line".Quantity WHERE("Job No." = FIELD("Job No."), "Job Task No." = FIELD("Job Task No."), "Job Task No." = FIELD(FILTER(Totaling)), "Contract Line" = CONST(TRUE), "Planning Date" = FIELD("Planning Date Filter"), "Unit of Measure Code" = CONST('TIME')));
            CaptionML = ENU = 'Contract (Hours)', DAN = 'Kontrakt (Timer)';
        }
    }

    var
        myInt: Integer;

}

