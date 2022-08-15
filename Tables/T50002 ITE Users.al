table 50002 IteUsers
{

    fields
    {
        field(10; UserSecurityId; Guid)
        {
            TableRelation = User;
        }
        field(20; Employee; Code[100])
        {
            TableRelation = Employee;
        }
    }

    keys
    {
        key(Key1; UserSecurityId)
        {
        }
    }

    fieldgroups
    {
        fieldgroup(DropDown; Employee)
        {
        }
    }
}

