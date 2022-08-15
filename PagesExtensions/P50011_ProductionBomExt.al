pageextension 50011 Top_ProductionBomExt extends "Production BOM"
{

    layout
    {
        // Add changes to page layout here
    }

    actions
    {
        // Add changes to page actions here
        addlast("F&unctions")
        {
            action("Transfer To Req. Sheet")
            {
                ApplicationArea = All;
                CaptionML = DAN = 'Overfør til indkøbskladde', ENU = 'Transfer To Req. Sheet';
                // Image = PostDocument;
                Promoted = true;
                PromotedIsBig = true;
                // PromotedCategory = Process;
                trigger OnAction()
                begin
                    TransferToReqJnl();
                end;
            }
        }
    }

    var
        SalesPost: Codeunit "Sales-Post";
        TOP000: TextConst DAN = 'Ingen kladdelinjer at oprette', ENU = 'No Journal Lines to create';
        RepTransToReqJnl: Report Top_TransferBomToReqJnl;
        WorksheetTemplateName: Code[20];
        JournalBatchName: Code[20];
        ReqJnlLine: record "Requisition Line";
        PageReqWksh: page "Req. Worksheet";

    procedure TransferToReqJnl()

    begin
        CLEAR(RepTransToReqJnl);
        RepTransToReqJnl.SetProdBomNo(Rec."No.");
        RepTransToReqJnl.RUNMODAL;

        IF RepTransToReqJnl.GetLinesCreated() THEN BEGIN
            RepTransToReqJnl.GetJnlVars(WorksheetTemplateName, JournalBatchName);
            ReqJnlLine.RESET;
            ReqJnlLine.FILTERGROUP(2);
            ReqJnlLine.SETRANGE("Worksheet Template Name", WorksheetTemplateName);
            ReqJnlLine.SETRANGE("Journal Batch Name", JournalBatchName);
            ReqJnlLine.FILTERGROUP(0);
            CLEAR(PageReqWksh);
            PageReqWksh.EDITABLE(TRUE);
            PageReqWksh.SETTABLEVIEW(ReqJnlLine);
            PageReqWksh.RUNMODAL;
        END ELSE
            MESSAGE(TOP000);
    end;

}
