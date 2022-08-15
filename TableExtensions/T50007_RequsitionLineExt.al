tableextension 50007 TopRequisitionLineExt extends "Requisition Line"
{
    fields
    {
        field(50000; TopJobNo; Code[20])
        {
            CaptionML = ENU = 'Job No.', DAN = 'Sagsnr.';
        }
        field(50001; TopJobTaskNo; Code[20])
        {
            CaptionML = ENU = 'Job Task No.', DAN = 'Sagsopgavenr.';
        }
        field(50002; TopRevision; Text[30])
        {
            CaptionML = ENU = 'Revision', DAN = 'Revision';
        }
        field(50003; TopSwCat; Text[30])
        {
            CaptionML = ENU = 'SwCat', DAN = 'SwCat';
        }
        field(50004; TopSubsupplier; Text[30])
        {
            CaptionML = ENU = 'Subsupplier', DAN = 'Subsupplier';
        }
        field(50005; TopVendorNoMachTech; Code[20])
        {
            TableRelation = Vendor;
            CaptionML = ENU = 'Supplier (MT)', DAN = 'Leverandør (MT)';

        }
        field(50006; TopProdBomNoMachTech; Code[20])
        {
            TableRelation = "Production BOM Header";
            CaptionML = ENU = 'Prod. BOM (MT)', DAN = 'Prod. Stykliste (MT)';
        }
        /* field(50007; "Vendor Name"; Text[100])
        {
            FieldClass = FlowField;
            CalcFormula = lookup(Vendor.Name where("No." = field("Vendor No.")));
            Editable = false;
        } */
    }

    var
        myInt: Integer;

}
