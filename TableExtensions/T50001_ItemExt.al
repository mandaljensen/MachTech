tableextension 50001 TopItemExt extends Item
{
    fields
    {
        modify("Description 2")
        {
            Caption = 'Type Number';
        }
        field(50000; TopVendorName; Text[50])
        {
            FieldClass = FlowField;
            CalcFormula = Lookup(Vendor.Name WHERE("No." = FIELD("Vendor No.")));
            Editable = false;
            CaptionML = ENU = 'Vendor Name', DAN = 'Leverandørnavn';
        }
        field(50001; TopJobTaskNo; Code[20])
        {
            CaptionML = ENU = 'Job Task No.', DAN = 'Sagsopgavenr.';
        }
        field(50002; TopStock; boolean)
        {
            CaptionML = ENU = 'Stock', DAN = 'Stock';

        }
        field(50003; TopCtSwCat; Text[30])
        {
            CaptionML = ENU = 'Swcat', DAN = 'SwCat';
        }
        field(50004; TopCtInt; Text[10])
        {
            CaptionML = ENU = 'Int', DAN = 'Int';
        }
        field(50005; TopCtOrdOne; Text[30])
        {
            Caption = 'Ord-1';
        }
        field(50006; TopCtOrdTwo; Text[30])
        {
            Caption = 'Ord-2';
        }
        field(50007; TopCtCategoryOne; Text[30])
        {
            Caption = 'Category-1';
        }
        field(50008; TopCtCategoryTwo; Text[30])
        {
            Caption = 'Category-2';
        }
        field(50009; TopCtMachineNo; Text[30])
        {
            CaptionML = ENU = 'MachineNo', DAN = 'MachineNo';
        }
        field(50010; TopCtSubsupplier; Text[30])
        {
            CaptionML = ENU = 'Subsupplier', DAN = 'Subsupplier';
        }
        field(50011; TopCtRevision; Text[30])
        {
            CaptionML = ENU = 'Revision', DAN = 'Revision';
        }
        field(50012; TopCtMaterial; Text[30])
        {
            CaptionML = ENU = 'Material', DAN = 'Material';
        }
        field(50013; "TOP_ManufacturerName"; Text[50])
        {
            Caption = 'Manufacturer Name';
            FieldClass = FlowField;
            CalcFormula = lookup(Manufacturer.Name where(Code = field("Manufacturer Code")));
            Editable = false;
        }
    }

    fieldgroups
    {
        addlast(DropDown; "Description 2")
        {

        }
    }

    var
        myInt: Integer;

}
