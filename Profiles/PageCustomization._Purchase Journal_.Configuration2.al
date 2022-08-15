pagecustomization Configuration2 customizes "Purchase Journal"
{
  layout
  {
    modify("VAT Amount")
    {
    Visible = true;
    }
    modify("Bal. VAT Amount")
    {
    Visible = true;
    }
    modify("Sales/Purch. (LCY)")
    {
    Visible = true;
    }
    modify("VAT Bus. Posting Group")
    {
    Visible = true;
    }
    moveafter("Applies-to Doc. No.";"VAT Bus. Posting Group")
    modify("VAT Prod. Posting Group")
    {
    Visible = true;
    }
    moveafter("VAT Bus. Posting Group";"VAT Prod. Posting Group")
    modify("Bal. VAT Bus. Posting Group")
    {
    Visible = true;
    }
    modify("Bal. VAT Prod. Posting Group")
    {
    Visible = true;
    }
    modify("Bill-to/Pay-to No.")
    {
    Visible = true;
    }
    moveafter("Applies-to Doc. No.";"Bill-to/Pay-to No.")
    moveafter("Bill-to/Pay-to No.";Description)
    moveafter("Document No.";"Bal. Account No.")
    moveafter(Description;"VAT Amount")
    moveafter("Bal. Account No.";DocumentAmount)
    moveafter(DocumentAmount;"Bal. VAT Amount")
    moveafter("<Vendor Name>";"External Document No.")
    moveafter("External Document No.";"Bal. Gen. Posting Type")
    moveafter("Bal. Gen. Posting Type";"Bal. Account Type")
    moveafter("Bal. Gen. Posting Type";"Bal. Gen. Bus. Posting Group")
    moveafter("Bal. Gen. Bus. Posting Group";"Bal. Gen. Prod. Posting Group")
    moveafter("Bal. Account Type";"Bal. VAT Bus. Posting Group")
    moveafter("Bal. Account Type";"Bal. VAT Prod. Posting Group")
    moveafter("Bal. VAT Bus. Posting Group";Amount)
    moveafter(Amount;"Amount (LCY)")
    moveafter("Amount (LCY)";"Sales/Purch. (LCY)")
    modify("Payment Terms Code")
    {
    Visible = true;
    }
    moveafter("Sales/Purch. (LCY)";"Payment Terms Code")
  }
  actions
  {
  }
}
