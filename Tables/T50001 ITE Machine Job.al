table 50001 IteMachineJob
{

    fields
    {
        field(5; MachineNo; Code[20])
        {
            TableRelation = IteMachine;
            CaptionML = ENU = 'Machine No.', DAN = 'Maskinnr.';
        }
        field(10; JobNo; Code[20])
        {
            TableRelation = Job;
            CaptionML = ENU = 'Job No.', DAN = 'Sagsnr.';
        }
        field(15; Description; Text[50])
        {
            CalcFormula = Lookup (IteMachine.Description WHERE(No = FIELD(MachineNo)));
            Editable = false;
            FieldClass = FlowField;
            CaptionML = ENU = 'Description', DAN = 'Beskrivelse';
        }
        field(20; CustomerNo; Code[30])
        {
            CalcFormula = Lookup (IteMachine.CustomerNo WHERE(No = FIELD(MachineNo)));
            FieldClass = FlowField;
            CaptionML = ENU = 'Customer No.', DAN = 'Kundenr.';
        }
        field(25; JobDescription; Text[50])
        {
            CalcFormula = Lookup (Job.Description WHERE("No." = FIELD(JobNo)));
            FieldClass = FlowField;
            CaptionML = ENU = 'Job Description', DAN = 'Sagsbeskrivelse';
        }
    }

    keys
    {
        key(Key1; MachineNo, JobNo)
        {
        }
    }

    fieldgroups
    {
    }
}

