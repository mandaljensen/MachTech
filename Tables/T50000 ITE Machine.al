table 50000 IteMachine
{

    fields
    {
        field(5; No; Code[20])
        {
            CaptionML = ENU = 'No.', DAN = 'Nummer';
        }
        field(10; CustomerNo; Code[20])
        {
            TableRelation = Customer;
            CaptionML = ENU = 'Customer No.', DAN = 'Kundenr.';
        }
        field(15; Description; Text[50])
        {
            CaptionML = ENU = 'Description', DAN = 'Beskrivelse';
        }
        field(20; CustomerName; Text[50])
        {
            CalcFormula = Lookup(Customer.Name WHERE("No." = FIELD(CustomerNo)));
            FieldClass = FlowField;
            CaptionML = ENU = 'Customer Name', DAN = 'Kundenavn';
        }
    }

    keys
    {
        key(Key1; No)
        {
        }
    }

    fieldgroups
    {
    }

    trigger OnDelete();
    begin
        JobLink.SETFILTER(JobLink.MachineNo, No);

        IF JobLink.FINDSET(TRUE, TRUE) THEN
            REPEAT
                JobLink.DELETE;
            UNTIL JobLink.NEXT = 0
    end;

    var
        NoSeriesMgt: codeunit NoSeriesManagement;
        JobLink: Record IteMachineJob;


}
