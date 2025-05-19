page 50105 "ACC Set Up FactB"
{
    PageType = CardPart;
    ApplicationArea = All;
    UsageCategory = Documents;
    SourceTable = "ACC Setup";

    layout
    {
        area(Content)
        {
            group(GroupName)
            {
                Caption = 'Warehouse Layout Image';
                field(ACCWarehouseLayout; Rec."ACC Ware House Layout")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the warehouse layout for the ACC setup.';
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