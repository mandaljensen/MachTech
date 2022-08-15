pageextension 50008 Top_PostedPurchInvSubExt extends "Posted Purch. Invoice Subform"
{
    layout
    {
        addafter("Depr. until FA Posting Date")
        {
            field(TopDateReceived; Rec.TopDateReceived)
            {
                ApplicationArea = All;
            }
            field(TopcreatedBy; Rec.TopCreatedBy)
            {
                ApplicationArea = All;
            }
            field(TopReceivedBy; Rec.TopReceivedBy)
            {
                ApplicationArea = All;
            }
        }
    }
}