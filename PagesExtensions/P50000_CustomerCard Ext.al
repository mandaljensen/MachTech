pageextension 50000 Top_CustomerCardExt extends "Customer Card"
{
    layout
    {
        // Add changes to page layout here
        addlast(FactBoxes)
        {

            part(Machines; Top_MachineCustomerFactBox)
            {
                ApplicationArea = All;
                SubPageLink = CustomerNo = field("No.");
                CaptionML = ENU = 'Machines', DAN = 'Maskiner';
            }

        }
    }
}