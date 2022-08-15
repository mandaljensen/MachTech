pagecustomization Configuration12 customizes "General Journal"
{
  layout
  {
    modify("<CurrentPostingDate>")
    {
    QuickEntry = false;
    Visible = true;
    }
    moveafter("Account Type";"<CurrentPostingDate>")
    modify("<Document No. Simple Page>")
    {
    QuickEntry = false;
    }
    modify("Payer Information")
    {
    Visible = true;
    }
    moveafter(Description;"Payer Information")
    modify("Bal. VAT Amount")
    {
    Visible = true;
    }
    moveafter("Debit Amount";"Bal. VAT Amount")
    modify("Applies-to Doc. Type")
    {
    Visible = true;
    }
    moveafter("Bal. VAT Amount";"Applies-to Doc. Type")
    modify("Bank Payment Type")
    {
    Visible = false;
    }
    moveafter("Applies-to Doc. Type";"Bank Payment Type")
  }
  actions
  {
  }
}
