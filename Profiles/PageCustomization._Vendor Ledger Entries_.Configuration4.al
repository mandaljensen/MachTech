pagecustomization Configuration4 customizes "Vendor Ledger Entries"
{
  layout
  {
    moveafter(Description;"Original Amount")
    moveafter("Vendor No.";"Currency Code")
    moveafter("Payment Method Code";"Vendor No.")
    moveafter("Original Amount";Amount)
    moveafter(Amount;"Amount (LCY)")
    moveafter("Original Amount";"Remaining Amount")
    moveafter("Payment Method Code";"External Document No.")
    modify("Reason Code")
    {
    Visible = true;
    }
    moveafter("Pmt. Discount Date";"Reason Code")
    moveafter("Amount (LCY)";"Remaining Amt. (LCY)")
  }
  actions
  {
  }
}
