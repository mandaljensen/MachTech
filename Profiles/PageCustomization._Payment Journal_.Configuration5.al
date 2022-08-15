pagecustomization Configuration5 customizes "Payment Journal"
{
  layout
  {
    moveafter("Message to Recipient";"External Document No.")
    moveafter("Incoming Document Entry No.";Description)
    moveafter("Message to Recipient";"Payment Method Code")
    moveafter("Payment Method Code";"Payment Reference")
    moveafter("Document No.";Amount)
    moveafter("Payment Reference";"Account Type")
    moveafter(Amount;AppliesToDocNo)
    moveafter("Payment Reference";"Creditor No.")
    modify("Applies-to Ext. Doc. No.")
    {
    Visible = true;
    }
    moveafter(AppliesToDocNo;"Applies-to Ext. Doc. No.")
  }
  actions
  {
  }
}
