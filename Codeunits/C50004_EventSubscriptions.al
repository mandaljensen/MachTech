codeunit 50004 TopEventSubscripments
{
    [EventSubscriber(ObjectType::Page, 50, 'OnAfterActionEvent', 'SendCustom', TRUE, TRUE)]
    local procedure MarkStatusOnPurchase(var Rec: Record "Purchase Header")
    var
    /*PurchaseHeader: Record "Purchase Header";
    mailman: Codeunit "Mail Management";*/
    begin
        Rec.Validate(TopPurchaseStatus, Rec.TopPurchaseStatus::"Purchase sent");
        /*PurchaseHeader.get(Rec."Document Type", rec."No.");
        PurchaseHeader.TopPurchaseStatus := Rec.TopPurchaseStatus::"Purchase sent";
        PurchaseHeader.Modify();*/
    end;

    [EventSubscriber(ObjectType::Table, 38, 'OnAfterValidateEvent', 'Buy-from Vendor No.', TRUE, TRUE)]
    local procedure SetDueDateToBlank(var Rec: Record "Purchase Header")
    var
        Vendor: Record Vendor;
        mailman: Codeunit "Mail Management";
    begin
        //Rec.validate("Due Date", 0D);

        if Vendor.get(Rec."Buy-from Vendor No.") then
            Rec.validate(TopPurchaseInformation, Vendor.TopPurchaceInformation);

    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Purch.-Post", 'OnBeforePurchRcptLineInsert', '', TRUE, TRUE)]
    local procedure UpdateReceivedByAndDate(var PurchRcptLine: Record "Purch. Rcpt. Line")
    var
        IteUser: Codeunit "ITE Users";
    begin
        if (PurchRcptLine.Quantity <> 0) then begin
            PurchRcptLine.TopDateReceived := TODAY;
            PurchRcptLine.TopReceivedBy := ITEuser.GetUser();
            //Rec.Modify();
        end;
    end;

    [EventSubscriber(ObjectType::Table, 38, 'OnAfterValidateEvent', 'Payment Terms Code', TRUE, TRUE)]
    local procedure SetDueDateToBlankOnCreditMemo(var Rec: Record "Purchase Header")
    var
        Vendor: Record Vendor;
    begin
        if (Rec."Payment Terms Code" <> '') then
            if (Rec."Document Type" = Rec."Document Type"::"Credit Memo") or
                (Rec."Document Type" = Rec."Document Type"::"Return Order") then
                Rec.validate("Due Date", 0D);
        // Rec.modify;
    end;

    [EventSubscriber(ObjectType::Table, 39, 'OnAfterInsertEvent', '', TRUE, TRUE)]
    local procedure SetCreatedByUser(var Rec: Record "Purchase Line")
    var
        IteUser: Codeunit "ITE Users";
    begin
        if (Rec.TopCreatedBy = '') then begin
            Rec.TopCreatedBy := ITEuser.GetUser();
            Rec.modify;
        end;
    end;

    [EventSubscriber(ObjectType::Table, 39, 'OnAfterValidateEvent', 'Job No.', TRUE, TRUE)]
    local procedure SetJobTaskNo(var Rec: Record "Purchase Line"; CurrFieldNo: Integer)
    var
        Item: Record Item;
    begin
        if CurrFieldNo <> Rec.FieldNo("Job No.") then
            exit;

        if (Rec.Type = Rec.Type::Item) then
            if (Rec."Job No." <> '') then begin
                Item.get(Rec."No.");
                IF (Item.TopJobTaskNo <> '') THEN begin
                    Rec.Validate("Job Task No.", Item.TopJobTaskNo);
                    Rec.Modify();
                end;
            end;
    end;

    [EventSubscriber(ObjectType::Table, 27, 'OnAfterValidateEvent', 'Item Category Code', TRUE, TRUE)]
    local procedure InsertJobTaskNo(var Rec: Record Item)
    var
        Item: Record Item;
        ItemCategory: Record "Item Category";
    begin
        if (Rec."Item Category Code" <> '') then begin
            ItemCategory.get(Rec."Item Category Code");
            if (Rec.TopJobTaskNo = '') then begin
                Rec.Validate(TopJobTaskNo, ItemCategory.Code);
                Rec.modify;
            end;
        end;
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::LogInManagement, 'OnBeforeLogInStart', '', TRUE, TRUE)]
    local procedure MyProcedureTwo()
    var
        ActiveSession: Record "Active Session";
        IteUsers: Codeunit "ITE Users";
    begin
        IF ActiveSession.GET(SERVICEINSTANCEID, SESSIONID) THEN begin
            if (ActiveSession."Client Type" = ActiveSession."Client Type"::"Web Client") then
                IteUsers.SetUser();
        end;

    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Purch.-Post", 'OnAfterFinalizePosting', '', true, true)]
    local procedure ShowPostedPurchaseDocumentNoMessage(var PurchHeader: Record "Purchase Header"; var PurchInvHeader: Record "Purch. Inv. Header"; var PurchCrMemoHdr: Record "Purch. Cr. Memo Hdr."; PreviewMode: Boolean)
    var
        NewInvoiceNoLbl: label 'Order %1 ==> Invoice %2', Comment = '%1 = Order No., %2 = Invoice No.', Locked = false;
        NewCrMemoNoLbl: label '%1 %2 ==> Credit Memo %3', Comment = '%1 = Document Type, %2 = Document No., %3 = Credit Memo No.', Locked = false;

    begin
        if PreviewMode then
            exit;

        if PurchHeader."Document Type" = PurchHeader."Document Type"::Order then
            if PurchInvHeader."No." <> '' then
                Message(NewInvoiceNoLbl, PurchHeader."No.", PurchInvHeader."No.");

        if (PurchHeader."Document Type" = PurchHeader."Document Type"::"Credit Memo") or (PurchHeader."Document Type" = PurchHeader."Document Type"::"Return Order") then
            if PurchCrMemoHdr."No." <> '' then
                Message(NewCrMemoNoLbl, PurchHeader."Document Type", PurchHeader."No.", PurchCrMemoHdr."No.");

        if PurchHeader."Document Type" = PurchHeader."Document Type"::Order then begin
            PurchHeader.CalcFields("Completely Received");
            if PurchHeader."Completely Received" then begin
                PurchHeader.Validate(TopPurchaseStatus, PurchHeader.TopPurchaseStatus::"Ready for posting");
                PurchHeader.Modify(true);
            end;
        end;
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Job Create-Invoice", 'OnBeforeModifySalesHeader', '', true, true)]
    local procedure TransferExternalDocumentNoFromJob(Job: Record Job; var SalesHeader: Record "Sales Header")
    begin
        if Job.TopExternalDocNo <> '' then
            SalesHeader.Validate("External Document No.", Job.TopExternalDocNo);
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Req. Wksh.-Make Order", 'OnBeforePurchOrderLineInsert', '', true, false)]
    local procedure TransferTOPFieldValues(var PurchOrderLine: Record "Purchase Line"; var ReqLine: Record "Requisition Line")
    begin
        PurchOrderLine.Validate(TopProdBomNoMachTech, ReqLine.TopProdBomNoMachTech);
        PurchOrderLine.Validate("Job No.", ReqLine.TopJobNo);
        PurchOrderLine.Validate("Job Task No.", ReqLine.TopJobTaskNo);
    end;
}
