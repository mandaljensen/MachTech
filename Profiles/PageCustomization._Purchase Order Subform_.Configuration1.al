pagecustomization Configuration1 customizes "Purchase Order Subform"
{
  layout
  {
    moveafter("Description 2";Quantity)
    moveafter(Quantity;"Unit of Measure Code")
    modify("Job No.")
    {
    Visible = true;
    }
    moveafter("Unit of Measure Code";"Job No.")
    moveafter("Job No.";"Direct Unit Cost")
    moveafter("Direct Unit Cost";"Line Amount")
    moveafter("Line Amount";"Qty. to Receive")
    moveafter("Qty. to Receive";TopDateReceived)
    moveafter("Qty. to Receive";"Quantity Received")
    moveafter(TopDateReceived;"Qty. to Invoice")
    moveafter("Qty. to Invoice";"Quantity Invoiced")
    moveafter("Quantity Invoiced";TopProdBomNoMachTech)
    modify("Job Task No.")
    {
    Visible = true;
    }
    moveafter("Quantity Invoiced";"Job Task No.")
    modify("VAT Prod. Posting Group")
    {
    Visible = true;
    }
    moveafter(TopProdBomNoMachTech;"VAT Prod. Posting Group")
    moveafter("Bin Code";"Location Code")
  }
  actions
  {
  }
}
