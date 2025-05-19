codeunit 50100 "Cod Bin Coordinate Management"
{
    trigger OnRun()
    begin

    end;

    procedure UploadLayoutImage()
    var
        InStr: InStream;
        OutStr: OutStream;
        FileName: Text;
        ACCSetup: Record "ACC Setup";

    begin
        if not ACCSetup.Get() then
            exit;

        if ACCSetup."ACC Ware House Layout".HasValue() then //Xác nhận người dùng cần ghi đè hay không
            if not Confirm('Do you want to upload the new layout image?', false) then exit;

        UploadIntoStream('Select an image to upload', '', 'Image File|*.png;*.jpg', FileName, InStr);
        ACCSetup."ACC Ware House Layout".CreateOutStream(OutStr);
        CopyStream(OutStr, InStr);
        ACCSetup.Modify();
    end;

    var
        myInt: Integer;
}