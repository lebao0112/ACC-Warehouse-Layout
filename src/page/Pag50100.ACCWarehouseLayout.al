page 50100 "ACC Warehouse Layout"
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Documents;
    SourceTable = "Bin Content";
    Caption = 'ACC Warehouse Layout';
    layout
    {
        area(Content)
        {
            usercontrol(CheckingStatusBins; "Checking Status Bins")
            {
                ApplicationArea = All;
                trigger OnStartup()
                begin
                    OnAddinReady();
                end;
            }
        }
    }

    actions
    {
        area(Processing)
        {
            // action(ActionName)
            // {

            //     trigger OnAction()
            //     begin

            //     end;
            // }
        }
    }

    local procedure OnAddinReady()
    var
        ACCSetup: Record "ACC Setup";
        jsonTextBin: Text;
        Bins: JsonArray;
        singleBin: JsonObject;
        base64: Text;
    begin
        // Gửi dữ liệu bins
        if Rec.FindSet() then begin
            repeat
                Rec.CalcFields(Quantity); // Tính toán các FlowFields trước
                singleBin.Add('binCode', Rec."Bin Code");
                singleBin.Add('x1', Rec.X1);
                singleBin.Add('y1', Rec.Y1);
                singleBin.Add('x2', Rec.X2);
                singleBin.Add('y2', Rec.Y2);
                singleBin.Add('quantity', Rec.Quantity);

                singleBin.Add('itemNo', Rec."Item No.");

                Rec.GetItemDescr(Rec."Item No.", Rec."Variant Code", ItemDescription);
                singleBin.Add('itemDescription', ItemDescription);
                singleBin.Add('blockMovement', Rec."Block Movement");
                Bins.Add(singleBin);
                Clear(singleBin);
            until Rec.Next() = 0;
        end;

        Bins.WriteTo(jsonTextBin);
        CurrPage.CheckingStatusBins.setBinsData(jsonTextBin);

        // Gửi ảnh
        if ACCSetup.Get() then begin
            if ACCSetup."ACC Ware House Layout".HasValue then begin
                Clear(base64);
                base64 := GetAccSetupBlobBase64();
                CurrPage.CheckingStatusBins.setImage(base64);
            end;
        end;
    end;

    procedure GetAccSetupBlobBase64(): Text
    var
        AccSetup: Record "ACC Setup";
        TempBlob: Codeunit "Temp Blob";
        Base64Convert: Codeunit "Base64 Convert";
        InStr: InStream;
        Base64Text: Text;
    begin

        if not AccSetup.FindFirst() then
            Error('Không tìm thấy bản ghi ACC Setup.');

        AccSetup.CalcFields("ACC Ware House Layout");
        TempBlob.FromRecord(AccSetup, AccSetup.FieldNo("ACC Ware House Layout"));
        TempBlob.CreateInStream(InStr);
        Base64Text := Base64Convert.ToBase64(InStr);
        exit(Base64Text);
    end;

    var
        ItemDescription: Text[100];
}