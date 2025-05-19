page 50103 "ACC Bins Content FactB"
{
    PageType = ListPart;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "Bin Content";
    Caption = 'Bins Content Info';
    layout
    {
        area(Content)
        {
            group(GroupName)
            {
                field("Location Code"; Rec."Location Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the location code for the bin content.';
                }
                field("Zone Code"; Rec."Zone Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the zone code for the bin content.';
                }
                field("Bin Code"; Rec."Bin Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the bin code for the bin content.';
                }
                field("Item No."; Rec."Item No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the item number for the bin content.';
                }
                field("Bin Type Code"; Rec."Bin Type Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the bin type code for the bin content.';
                }
                field("Warehouse Class Code"; Rec."Warehouse Class Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the warehouse class code for the bin content.';
                }
                field("Block Movement"; Rec."Block Movement")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the block movement setting for the bin content.';
                }
                field("Min. Qty."; Rec."Min. Qty.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the minimum quantity for the bin content.';
                }
                field("Max. Qty."; Rec."Max. Qty.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the maximum quantity for the bin content.';
                }
                field("Bin Ranking"; Rec."Bin Ranking")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the bin ranking for the bin content.';
                }
                field(Quantity; Rec.Quantity)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the total quantity in the bin.';
                }
                field("Pick Qty."; Rec."Pick Qty.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the quantity to be picked from the bin.';
                }
                field("Neg. Adjmt. Qty."; Rec."Neg. Adjmt. Qty.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the negative adjustment quantity for the bin content.';
                }
                field("Put-away Qty."; Rec."Put-away Qty.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the quantity to be put away in the bin.';
                }
                field("Pos. Adjmt. Qty."; Rec."Pos. Adjmt. Qty.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the positive adjustment quantity for the bin content.';
                }
                field(Fixed; Rec.Fixed)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies if the bin content is fixed.';
                }
                field("Cross-Dock Bin"; Rec."Cross-Dock Bin")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies if the bin is used for cross-docking.';
                }
                field(Default; Rec.Default)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies if this is the default bin for the item.';
                }
                field("Quantity (Base)"; Rec."Quantity (Base)")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the total quantity in base unit of measure.';
                }
                field("Pick Quantity (Base)"; Rec."Pick Quantity (Base)")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the pick quantity in base unit of measure.';
                }
                field("Negative Adjmt. Qty. (Base)"; Rec."Negative Adjmt. Qty. (Base)")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the negative adjustment quantity in base unit of measure.';
                }
                field("Put-away Quantity (Base)"; Rec."Put-away Quantity (Base)")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the put-away quantity in base unit of measure.';
                }
                field("Positive Adjmt. Qty. (Base)"; Rec."Positive Adjmt. Qty. (Base)")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the positive adjustment quantity in base unit of measure.';
                }
                field("ATO Components Pick Qty."; Rec."ATO Components Pick Qty.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the assemble-to-order components pick quantity.';
                }
                field("ATO Components Pick Qty (Base)"; Rec."ATO Components Pick Qty (Base)")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the assemble-to-order components pick quantity in base unit of measure.';
                }
                field("Variant Code"; Rec."Variant Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the variant code for the item.';
                }
                field("Qty. per Unit of Measure"; Rec."Qty. per Unit of Measure")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the quantity per unit of measure.';
                }
                field("Unit of Measure Code"; Rec."Unit of Measure Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the unit of measure code for the bin content.';
                }
                field("Lot No. Filter"; Rec."Lot No. Filter")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the lot number filter for the bin content.';
                }
                field("Serial No. Filter"; Rec."Serial No. Filter")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the serial number filter for the bin content.';
                }
                field("Package No. Filter"; Rec."Package No. Filter")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the package number filter for the bin content.';
                }
                field(Dedicated; Rec.Dedicated)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies if the bin is dedicated.';
                }
                field("Unit of Measure Filter"; Rec."Unit of Measure Filter")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the unit of measure filter for the bin content.';
                }

            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(ActionName)
            {

                trigger OnAction()
                begin

                end;
            }
        }
    }

    var
        myInt: Integer;
}