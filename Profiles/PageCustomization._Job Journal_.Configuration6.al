pagecustomization Configuration6 customizes "Job Journal"
{
  layout
  {
    moveafter("Job Task No.";"No.")
    moveafter("No.";Description)
    moveafter(Description;Quantity)
    moveafter("Document No.";"Job No.")
    moveafter(Quantity;"Unit Cost")
    moveafter("Unit Cost";"Unit Cost (LCY)")
    moveafter("Unit Cost (LCY)";"Total Cost")
    moveafter("Unit Cost";"Unit Price")
    moveafter(Quantity;"Shortcut Dimension 1 Code")
  }
  actions
  {
  }
}
