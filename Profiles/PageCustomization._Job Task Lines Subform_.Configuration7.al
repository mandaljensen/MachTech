pagecustomization Configuration7 customizes "Job Task Lines Subform"
{
  layout
  {
    moveafter(Description;"Schedule (Total Cost)")
    moveafter("Schedule (Total Cost)";"Contract (Total Price)")
    modify("Schedule (Total Price)")
    {
    Visible = true;
    }
    moveafter("Schedule (Total Cost)";"Schedule (Total Price)")
  }
  actions
  {
  }
}
