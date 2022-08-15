codeunit 50003 ITEPurch_Receive
{
    TableNo = 38;


    /*
    Efter indæsttelse af købsfaktura i Codeunit 90 *************************

            ITETempPostingStr := STRSUBSTNO(Text010,"Document Type","No.",PurchInvHeader."No.");

    Text010 	%1 %2 -> Invoice %3
    Text011 	%1 %2 -> Credit Memo %3

    Efter indæsttelse af købskreditnot

            ITETempPostingStr := STRSUBSTNO(Text011,"Document Type","No.",PurchCrMemoHeader."No.");

    */


    trigger OnRun();
    begin
        IF NOT Rec.FIND THEN
            ERROR(NothingToPostErr);

        IF NOT CONFIRM(ReceiveOnlyQty, FALSE, Rec."Document Type") THEN
            EXIT;

        PurchHeader.COPY(Rec);
        Code;
        Rec := PurchHeader;
    end;

    var
        Text000: Label '&Receive,&Invoice,Receive & and Invoice';
        Text001: Label 'Do you want to post the %1?';
        Text002: Label '&Ship,&Invoice,Ship &and Invoice';
        NothingToPostErr: Label 'There is nothing to post.';
        ReceiveOnlyQty: Label 'Do you want to post receive?';

        PurchHeader: Record "Purchase Header";
        Selection: Integer;

    local procedure "Code"();
    var
        PurchSetup: Record "Purchases & Payables Setup";
        PurchPostViaJobQueue: Codeunit "Purchase Post via Job Queue";
    begin
        CASE PurchHeader."Document Type" OF
            PurchHeader."Document Type"::Order:
                BEGIN
                    PurchHeader.Receive := TRUE;
                    PurchHeader.Invoice := FALSE;
                END;
            PurchHeader."Document Type"::"Return Order":
                BEGIN
                    PurchHeader.Ship := TRUE;
                    PurchHeader.Invoice := FALSE;
                END
            ELSE
                IF NOT
                   CONFIRM(
                     Text001, FALSE,
                     PurchHeader."Document Type")
                THEN
                    EXIT;
        END;
        PurchHeader."Print Posted Documents" := FALSE;
        PurchHeader.VALIDATE("Posting Date", TODAY);
        PurchHeader.VALIDATE("Due Date", 0D);

        PurchSetup.GET;
        IF PurchSetup."Post with Job Queue" THEN
            PurchPostViaJobQueue.EnqueuePurchDoc(PurchHeader)
        ELSE
            CODEUNIT.RUN(CODEUNIT::"Purch.-Post", PurchHeader);

        IF PurchHeader.TopPurchaseStatus <> PurchHeader.TopPurchaseStatus::"Ready for posting" THEN BEGIN
            PurchHeader.CALCFIELDS("Completely Received");
            IF PurchHeader."Completely Received" THEN BEGIN
                PurchHeader.TopPurchaseStatus := PurchHeader.TopPurchaseStatus::"Ready for posting";
                PurchHeader.MODIFY;
            END;
        END;
    end;
}

