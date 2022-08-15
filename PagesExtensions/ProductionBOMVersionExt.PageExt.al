pageextension 50019 "Production BOM Version Ext." extends "Production BOM Version"
{
    layout
    {
        addfirst(General)
        {
            field("Production BOM No."; "Production BOM No.")
            {
                ApplicationArea = Service;
                ToolTip = 'Shows value of Production BOM No.';
            }
        }
    }
}
