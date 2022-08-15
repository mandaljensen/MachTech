pagecustomization Configuration13 customizes "Purchase Return Order Subform"
{
  layout
  {
    moveafter("Direct Unit Cost";"Return Qty. Shipped")
    moveafter("Tax Group Code";"Location Code")
    moveafter("Direct Unit Cost";"Line Amount")
    moveafter("Line Amount";"Return Qty. to Ship")
    moveafter("Return Qty. Shipped";"Quantity Invoiced")
    modify("VAT Prod. Posting Group")
    {
    Visible = true;
    }
    moveafter("Quantity Invoiced";"VAT Prod. Posting Group")
    moveafter("Return Qty. Shipped";"Qty. to Invoice")
    modify("Job Task No.")
    {
    Visible = true;
    Width = 6;
    }
    moveafter("Quantity Invoiced";"Job Task No.")
    modify("Job No.")
    {
    Visible = true;
    Width = 6;
    }
    moveafter(Quantity;"Job No.")
    modify("Unit of Measure Code")
    {
    Visible = true;
    Width = 2;
    }
    moveafter(Quantity;"Unit of Measure Code")
    modify(Quantity)
    {
    Width = 4;
    }
  }
  actions
  {
  }
}
