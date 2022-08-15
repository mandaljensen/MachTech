pageextension 50017 "Job Task Line Subform Ext" extends "Job Task Lines Subform"
{
    layout
    {
        addlast(Control1)
        {
            field(TopScheduleHours; TopScheduleHours)
            {
                Caption = 'Schedule (Hours)';
                ToolTip = 'Schedule (Hours)';
            }
            field(TopUsageHours; TopUsageHours)
            {
                Caption = 'Usage (Hours)';
                ToolTip = 'Usage (Hours)';
            }
            field(TopContractHours; TopContractHours)
            {
                Caption = 'Contract (Hours)';
                ToolTip = 'Contract (Hours)';
            }
        }
    }
}
