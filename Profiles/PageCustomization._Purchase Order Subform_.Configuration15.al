pagecustomization Configuration15 customizes "Purchase Order Subform"
{
  layout
  {
    moveafter(Description;Quantity)
    moveafter(Quantity;"Unit of Measure Code")
    moveafter("Unit of Measure Code";"Direct Unit Cost")
    moveafter("Direct Unit Cost";"Line Amount")
    moveafter("Line Amount";"Qty. to Receive")
    moveafter("Qty. to Receive";"Qty. to Invoice")
    moveafter("Qty. to Invoice";"Quantity Invoiced")
    moveafter("Quantity Invoiced";TopProdBomNoMachTech)
    moveafter("Qty. to Receive";TopDateReceived)
    moveafter(TopDateReceived;"Quantity Received")
    modify("Job Task No.")
    {
    Visible = true;
    }
    moveafter(TopProdBomNoMachTech;TopCreatedBy)
    moveafter(TopCreatedBy;"Job Task No.")
    moveafter("Job Task No.";TopReceivedBy)
    modify("Job No.")
    {
    Visible = true;
    }
    moveafter(Description;"Description 2")
    moveafter("Unit of Measure Code";"Job No.")
  }
  actions
  {
  }
}
