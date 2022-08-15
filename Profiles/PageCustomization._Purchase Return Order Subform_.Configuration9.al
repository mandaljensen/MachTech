pagecustomization Configuration9 customizes "Purchase Return Order Subform"
{
  layout
  {
    moveafter("Qty. to Assign";"Location Code")
    moveafter("Location Code";"Tax Group Code")
    moveafter("Location Code";"Line Discount %")
    modify("Job No.")
    {
    Visible = true;
    }
    modify("Job Task No.")
    {
    Visible = true;
    }
    moveafter(Quantity;"Job No.")
    modify("VAT Prod. Posting Group")
    {
    Visible = true;
    }
    moveafter("Quantity Invoiced";"VAT Prod. Posting Group")
    moveafter("Quantity Invoiced";"Job Task No.")
    modify("Unit of Measure Code")
    {
    Visible = true;
    Width = 2;
    }
    moveafter(Quantity;"Unit of Measure Code")
    modify("Return Reason Code")
    {
    Width = 2;
    }
    modify(Quantity)
    {
    Width = 4;
    }
  }
  actions
  {
  }
}
