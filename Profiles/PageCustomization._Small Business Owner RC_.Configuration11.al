pagecustomization Configuration11 customizes "Small Business Owner RC"
{
  layout
  {
  }
  actions
  {
    addafter(Items)
    {
      action("General Journal51186")
      {
        ApplicationArea = All;
        CaptionML = DAN='Finanskladder', ENU='General Journals';
        RunObject = page "General Journal";
      }
      action("Detail Trial Balance23091")
      {
        ApplicationArea = All;
        CaptionML = ENU='Detail Trial Balance';
        RunObject = report "Detail Trial Balance";
      }
    }
  }
}
