pagecustomization Configuration17 customizes "Purchase Order List"
{
  layout
  {
    modify("Purchaser Code")
    {
    Visible = true;
    Width = 8;
    }
    moveafter("Buy-from Vendor Name";Amount)
    moveafter(Amount;"Amount Including VAT")
    moveafter("Amount Including VAT";"Document Date")
    moveafter("Document Date";"Purchaser Code")
    moveafter("Purchaser Code";Status)
    modify(Amount)
    {
    Width = 17;
    }
    modify("Payment Terms Code")
    {
    Visible = true;
    }
    moveafter(Status;"Payment Terms Code")
    moveafter("Purchaser Code";TopPurchaseStatus)
  }
  actions
  {
  }
}
