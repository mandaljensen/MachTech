pageextension 50020 "Small Buss. Owner RC Ext." extends "Small Business Owner RC"
{
    layout
    {
        addafter(Control70)
        {
            part(MyCustomers; "My Customers")
            {
                ApplicationArea = All;
                Caption = 'My Customers';
            }
        }
    }
}
