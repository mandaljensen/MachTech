codeunit 50001 "Item Data Web Service"
{
    trigger OnRun();
    begin
        // Temp blocked is marked with // **
    end;

    procedure Capitalize(inputstring: Text[250]) outputstring: Text[250];
    begin
        outputstring := UPPERCASE(inputstring);
    end;

    procedure SetItemPicture(ItemNo: Code[20]; Picture: BigText);
    var
        Item: Record Item;
        // ** Bytes: DotNet "'mscorlib, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089'.System.Array";
        // ** Convert: DotNet "'mscorlib, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089'.System.Convert";
        // ** MemoryStream: DotNet "'mscorlib, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089'.System.IO.MemoryStream";
        OStream: OutStream;
    begin
        Item.GET(ItemNo);

        // ** Bytes := Convert.FromBase64String(Picture);
        // ** MemoryStream := MemoryStream.MemoryStream(Bytes);
        // ** Item.Picture.CREATEOUTSTREAM(OStream);
        // ** MemoryStream.WriteTo(OStream);

        Item.MODIFY;
    end;

    procedure GetItemPicture(ItemNo: Code[20]; var Picture: BigText);
    var
        Item: Record Item;
        IStream: InStream;
    // ** MemoryStream: DotNet "'mscorlib, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089'.System.IO.MemoryStream";
    // ** Bytes: DotNet "'mscorlib, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089'.System.Array";
    // ** Convert: DotNet "'mscorlib, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089'.System.Convert";
    begin
        Item.GET(ItemNo);

        Item.CALCFIELDS(Picture);
        // ** IF NOT Item.Picture.HASVALUE THEN
        // **     EXIT;

        // ** Item.Picture.CREATEINSTREAM(IStream);
        // ** MemoryStream := MemoryStream.MemoryStream();
        // ** COPYSTREAM(MemoryStream, IStream);
        // ** Bytes := MemoryStream.GetBuffer();
        // ** Picture.ADDTEXT(Convert.ToBase64String(Bytes));
    end;
}

