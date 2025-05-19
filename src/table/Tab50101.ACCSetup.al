table 50101 "ACC Setup"
{
    Caption = 'ACC - Setup';

    fields
    {
        field(90000; "ACC Primary Key"; Code[20])
        {
            Caption = 'Primary Key';
        }
        field(90001; "ACC Ware House Layout"; Blob) // Field này để up ảnh lên BC
        {
            Caption = 'Ware House Layout';
            Subtype = Bitmap;
            trigger OnValidate()
            begin
                PictureUploaded := true;
            end;
        }
    }
    keys
    {
        key(BLKey1; "ACC Primary Key")
        {
            Clustered = true;
        }
    }

    var
        PictureUploaded: Boolean;
}