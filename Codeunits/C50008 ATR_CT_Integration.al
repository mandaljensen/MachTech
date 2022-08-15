codeunit 50008 ATR_CT_Integration
{

    trigger OnRun();
    begin
    end;

    procedure SetBOMStatusToCertified(BomNo: Code[20]; BomVersionNo: Code[20]);
    var
        Bom: Record "Production BOM Header";
        BomVersion: Record "Production BOM Version";
    begin
        IF BomVersion.GET(BomNo, BomVersionNo) THEN BEGIN
            BomVersion.Status := BomVersion.Status::Certified;
            BomVersion.MODIFY;
        END;

        IF Bom.GET(BomNo) THEN BEGIN
            Bom.Status := Bom.Status::Certified;
            Bom.MODIFY;
        END;
    end;
}

