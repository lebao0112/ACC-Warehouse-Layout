page 50101 "Bins Coordinates"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Documents;
    SourceTable = "Bin Content";

    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
                field("Bin Code"; Rec."Bin Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Enter the Bin Code';
                }

                field("Item No."; Rec."Item No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Enter the Item No.';
                }
                field(Quantity; Rec.Quantity)
                {
                    ApplicationArea = All;
                    ToolTip = 'Enter the Quantity';
                }
                field(X1; Rec.X1)
                {
                    ApplicationArea = All;
                    ToolTip = 'Enter the X1';

                }
                field(Y1; Rec.Y1)
                {
                    ApplicationArea = All;
                    ToolTip = 'Enter the Y1';

                }
                field(X2; Rec.X2)
                {
                    ApplicationArea = All;
                    ToolTip = 'Enter the X2';

                }
                field(Y2; Rec.Y2)
                {
                    ApplicationArea = All;
                    ToolTip = 'Enter the Y2';
                }
            }
        }
        area(FactBoxes)
        {
            part(BinInfo; "ACC Bins Content FactB")
            {
                ApplicationArea = All;
                SubPageLink = "Bin Code" = field("Bin Code");
            }
            part(WarehouseInfo; "ACC Warehouse Entries FactB")
            {
                ApplicationArea = Warehouse;
                Caption = 'Warehouse Entries';
                SubPageLink = "Item No." = field("Item No."),
                      "Location Code" = field("Location Code"),
                      "Bin Code" = field("Bin Code");
            }

            part(SetupInfo; "ACC Set Up FactB")
            {
                ApplicationArea = Setup;
                Caption = 'Set up Info';

            }
            systempart(Links; Links)
            {
                ApplicationArea = RecordLinks;
                Visible = false;
            }
            systempart(Notes; Notes)
            {
                ApplicationArea = RecordLinks;
                Visible = false;
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(ImportImage)
            {
                Caption = 'Upload Layout Image';
                Image = Import;

                trigger OnAction()
                var
                    ACCSetup: Record "ACC Setup";
                    CodeBinCoorMag: Codeunit "Cod Bin Coordinate Management";
                begin
                    CodeBinCoorMag.UploadLayoutImage();
                end;
            }
        }
    }

    var
        myInt: Integer;
}
