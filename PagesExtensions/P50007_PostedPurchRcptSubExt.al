pageextension 50007 Top_PostedPurchRcptSubformExt extends "Posted Purchase Rcpt. Subform"
{

    layout
    {
        addafter(Correction)
        {
            field(TopDateReceived; Rec.TopDateReceived)
            {
                ApplicationArea = All;
            }
            field(TopCreatedBy; Rec.TopCreatedBy)
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