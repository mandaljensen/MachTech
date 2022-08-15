pageextension 50001 Toop_CustomerListExt extends "Customer List"
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