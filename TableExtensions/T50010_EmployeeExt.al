tableextension 50010 Top_EmployeeExt extends Employee
{
    fields
    {
        // Add changes to table fields here
        field(50000; TopUser; Guid)
        {
            // tablerelation = User."User Security ID"

        }

    }

    var
        myInt: Integer;

}
