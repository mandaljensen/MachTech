pageextension 50016 "Purch.Return Ord. SubForm Ext." extends "Purchase Return Order Subform"
{
    layout
    {
        addafter(Description)
        {
            field("Description 2"; "Description 2")
            {
                ApplicationArea = All;
                Caption = 'Type Number';
                ToolTip = 'Type Number';
            }
        }
    }
}
