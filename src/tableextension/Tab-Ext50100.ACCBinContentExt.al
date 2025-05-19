tableextension 50100 "Bin Content Ext" extends "Bin Content"

{
    fields
    {
        field(5; X1; Integer)
        {
            Caption = 'X1';
            MinValue = 0;
        }
        field(6; Y1; Integer)
        {
            Caption = 'Y1';
            MinValue = 0;
        }
        field(7; X2; Integer)
        {
            Caption = 'X2';
            MinValue = 0;
        }
        field(8; Y2; Integer)
        {
            Caption = 'Y2';
            MinValue = 0;
        }
    }

    keys
    {

    }

    var
        myInt: Integer;
}