pagecustomization Configuration10 customizes "Purchase Order List"
{
  layout
  {
    moveafter("Buy-from Vendor Name";Amount)
    moveafter(Amount;"Amount Including VAT")
    moveafter("Amount Including VAT";"Document Date")
    modify("Shortcut Dimension 1 Code")
    {
    Visible = true;
    }
    moveafter("Document Date";"Shortcut Dimension 1 Code")
    modify("Purchaser Code")
    {
    Visible = true;
    }
    modify("Payment Terms Code")
    {
    Visible = true;
    }
    moveafter("Document Date";"Payment Terms Code")
    moveafter("Document Date";"Purchaser Code")
    moveafter("Purchaser Code";Status)
  }
  actions
  {
  }
}
