pageextension 50018 "Purchase Journal Ext." extends "Purchase Journal"
{
    layout
    {
        addlast(Control1)
        {
            field("Payment Reference"; "Payment Reference")
            {
                ApplicationArea = All;

            }
        }
    }
}
