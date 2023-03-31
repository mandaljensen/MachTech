report 50002 "Job - Outstanding Purchase"
{
    ApplicationArea = All;
    Caption = 'Job - Outstanding Purchase';
    UsageCategory = ReportsAndAnalysis;
    DefaultLayout = RDLC;
    RDLCLayout = './Reports/JobOutstandingPurchase.rdlc';

    dataset
    {
        dataitem(Job; Job)
        {
            DataItemTableView = sorting("No.") where(Blocked = const(" "));
            RequestFilterFields = "No.", "Bill-to Customer No.";

            column(ReportTitleCaptionLbl; ReportTitleCaptionLbl)
            { }
            column(PageCaptionLbl; PageCaptionLbl)
            { }
            column(TotalCaptionLbl; TotalCaptionLbl)
            { }
            column(JobNoCaptionLbl; JobNoCaptionLbl)
            { }
            column(No; "No.")
            { }
            column(JobDescCaptionLbl; JobDescCaptionLbl)
            { }
            column(Description; Description)
            { }
            column(JobBillToNameCaptionLbl; JobBillToNameCaptionLbl)
            { }
            column(BilltoName; "Bill-to Name")
            { }
            column(AmountCaptionLbl; AmountCaptionLbl)
            { }
            column(OutstandingPO; "PO. Outs. Amt. Ex.VAT (LCY)" + "PO.A.Rcd. Not Inv.Ex.VAT (LCY)")
            { }
            column(ShowDetails; ShowDetails)
            { }

            dataitem("Purchase Line"; "Purchase Line")
            {
                DataItemTableView = sorting("Document Type", "Job No.", "Job Task No.", "Document No.") where("Document Type" = const(Order));
                DataItemLink = "Job No." = field("No.");

                column(Line_No_; "Line No.")
                { }
                column(DocNoCaptionLbl; DocNoCaptionLbl)
                { }
                column(Document_No_; "Document No.")
                { }
                column(BuyFromVendorNameCaptionLbl; BuyFromVendorNameCaptionLbl)
                { }
                column(VendorName; PurchaseHeader."Buy-from Vendor Name")
                { }
                column(ItemNoCaptionLbl; ItemNoCaptionLbl)
                { }
                column(No_; "No.")
                { }
                column(ItemDescCaptionLbl; ItemDescCaptionLbl)
                { }
                column(ItemDescription; Description)
                { }
                column(PromisedReceiptDateLbl; PromisedReceiptDateLbl)
                { }
                column(Promised_Receipt_Date; "Promised Receipt Date")
                { }
                column(QuantityCaptionLbl; QuantityCaptionLbl)
                { }
                column(Quantity; Quantity)
                { }
                column(Quantity_InvoicedCaption; InvQuantityCaptionLbl)
                { }
                column(Quantity_Invoiced; "Quantity Invoiced")
                { }
                column(LineAmountCaptionLbl; LineAmountCaptionLbl)
                { }
                column(OutstandingAmt; "Outstanding Amt. Ex. VAT (LCY)" + "A. Rcd. Not Inv. Ex. VAT (LCY)")
                { }

                trigger OnAfterGetRecord()
                begin
                    if not PurchaseHeader.Get("Document Type", "Document No.") then
                        Clear(PurchaseHeader);
                end;
            }

            trigger OnAfterGetRecord()
            begin
                CalcFields("PO. Outs. Amt. Ex.VAT (LCY)", "PO.A.Rcd. Not Inv.Ex.VAT (LCY)");
                if "PO. Outs. Amt. Ex.VAT (LCY)" + "PO.A.Rcd. Not Inv.Ex.VAT (LCY)" = 0 then
                    CurrReport.Skip();
            end;
        }
    }
    requestpage
    {
        SaveValues = true;

        layout
        {
            area(content)
            {
                group(Settings)
                {
                    Caption = 'Settings';
                    field(ShowDetails; ShowDetails)
                    {
                        Caption = 'Show details';
                        ToolTip = 'Activate to show Purchase Order Lines.';
                    }
                }
            }
        }

    }

    var
        PurchaseHeader: Record "Purchase Header";
        ShowDetails: Boolean;
        ReportTitleCaptionLbl: Label 'Outstanding Purchase per Job';
        PageCaptionLbl: Label 'Page';
        TotalCaptionLbl: Label 'Total';
        JobNoCaptionLbl: Label 'Job No.';
        JobDescCaptionLbl: Label 'Description';
        JobBillToNameCaptionLbl: Label 'Bill-to Name';
        AmountCaptionLbl: Label 'Outstanding Amount';
        DocNoCaptionLbl: label 'Document No.';
        ItemNoCaptionLbl: label 'Item No.';
        ItemDescCaptionLbl: Label 'Description';
        PromisedReceiptDateLbl: Label 'Rec. Date';
        QuantityCaptionLbl: Label 'Quantity';
        InvQuantityCaptionLbl: Label 'Inv. Quantity';
        LineAmountCaptionLbl: Label 'Amount';
        BuyFromVendorNameCaptionLbl: Label 'Vendor Name';
}
