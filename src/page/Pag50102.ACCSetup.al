page 50102 "ACC Setup"
{
    AdditionalSearchTerms = 'ACC,set up';
    ApplicationArea = Basic, Suite;
    Caption = 'ACC - Set up';
    DeleteAllowed = false;
    InsertAllowed = false;
    PageType = Card;
    SourceTable = "ACC Setup";
    UsageCategory = Administration;

    layout
    {
        area(Content)
        {
            group("ACC Setup")
            {
                Caption = 'ACC - Set up';
                field("Primary Key"; Rec."ACC Primary Key")
                {
                    ApplicationArea = All;
                    Editable = false;
                    ToolTip = 'Primary Key';
                }
                field("Ware House Layout"; Rec."ACC Ware House Layout")
                {
                    ApplicationArea = All;
                    ToolTip = 'Ware House Layout';
                }
            }
        }
        area(FactBoxes)
        {
            systempart(Control1900383207; Links)
            {
                ApplicationArea = RecordLinks;
                Visible = false;
            }
            systempart(Control1905767507; Notes)
            {
                ApplicationArea = Notes;
                Visible = false;
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action("Upload Layout Image")
            {
                ApplicationArea = All;
                Caption = 'Upload Layout Image';
                Image = Import;
                trigger OnAction()

                begin
                    UploadLayoutImage();
                end;
            }
        }
    }

    local procedure UploadLayoutImage()
    var
        InStr: InStream;
        OutStr: OutStream;
        FileName: Text;
        CodeBinCoorMag: Codeunit "Cod Bin Coordinate Management";

    begin
        CodeBinCoorMag.UploadLayoutImage();
    end;

    trigger OnOpenPage()
    begin
        Rec.Reset();
        if not Rec.Get() then begin
            Rec.Init();
            Rec.Insert();
        end;
    end;
}