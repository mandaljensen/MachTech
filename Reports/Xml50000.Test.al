xmlport 50000 Test
{
    Caption = 'Test';
    schema
    {
        textelement(RootNodeName)
        {
            tableelement(SalesHeader; "Sales Header")
            {
                fieldelement(DocumentType; SalesHeader."Document Type")
                {
                }
                fieldelement(No; SalesHeader."No.")
                {
                }
            }
        }
    }
    requestpage
    {
        layout
        {
            area(content)
            {
                group(GroupName)
                {
                }
            }
        }
        actions
        {
            area(processing)
            {
            }
        }
    }
}
