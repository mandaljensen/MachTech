pagecustomization Configuration8 customizes "Job Planning Lines"
{
  layout
  {
    moveafter("Job Task No.";Description)
    moveafter(Description;Quantity)
    moveafter(Quantity;"Unit Price")
    moveafter("Unit Price";"Unit Cost")
    moveafter("Unit Cost";"Total Cost")
    moveafter("Total Cost";"Line Amount")
    moveafter("Total Cost";"No.")
  }
  actions
  {
  }
}
