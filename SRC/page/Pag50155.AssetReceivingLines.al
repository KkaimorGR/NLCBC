 
   
page 52193580 "Asset Receiving Lines1"
{
    ApplicationArea = Basic;
    PageType = ListPart;
    SourceTable = "Store Requisition TT Line";
    UsageCategory = Lists;
    Caption = 'Asset Receiving Lines';
    layout
    {
        area(Content)
        {
            repeater(Control1102755000)
            {
                field(Type; Rec.Type)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    OptionCaption = 'Item,Asset';
                    ToolTip = 'Specifies the value of the Type field.';
                }
                field("Requistion No"; Rec."Requistion No")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Requistion No field.';
                }
                field("No."; Rec."No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No. field.';
                }
                field(Description; Rec."Make/Model")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Description field.';
                }

                field("Unit of Measure"; Rec."Unit of Measure")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Unit of Measure field.';
                }
                field("Shortcut Dimension 1 Code"; Rec."Shortcut Dimension 1 Code")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Shortcut Dimension 1 Code field.';
                }
                field("Shortcut Dimension 2 Code"; Rec."Shortcut Dimension 2 Code")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Shortcut Dimension 2 Code field.';
                }
                field(Quantity; Rec."Quantity")
                {
                    ApplicationArea = Basic;
                    Caption = 'Quantity';
                    ToolTip = 'Specifies the value of the Quantity field.';
                }
                                field("Unit Cost"; Rec."Unit Cost")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Unit Cost field.';
                }
                field("Line Amount"; Rec."Line Amount")
                {
                    ApplicationArea = Basic;
            
                    ToolTip = 'Specifies the value of the Line Amount field.';
                }

                field("FA In Store"; "FA In Store")
                {
                    ApplicationArea = all;
                    Caption = 'FAQ in store';
                    Editable = false;
                }
                field("Tag No."; "Tag No.")
                {
                    ApplicationArea = all;
                }
                field("Serial No."; "Serial No.")
                {
                    ApplicationArea = all;
                }
                field("Certificate No."; "Certificate No.")
                {
                    ApplicationArea = all;
                }

                field("Purchasing Store"; Rec."Purchasing Store")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Purchasing Store field.';
                }
                field("Request Status"; Rec."Request Status")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Request Status field.';
                }
                field("Card No."; "Card No.")
                {
                    ApplicationArea = all;
                }
                field(Remarks; Rec."Description 2")
                {
                    ApplicationArea = Basic;
                    Caption = 'Remarks';
                    ToolTip = 'Specifies the value of the Purchase Remarks field.';
                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            group("&Line")
            {
                Caption = '&Line';
                Image = Line;
                group("Item Availability by")
                {
                    Caption = 'Item Availability by';
                    Image = ItemAvailability;
                }
                action("Item Tracking Lines")
                {
                    ApplicationArea = Basic;
                    Caption = 'Item &Tracking Lines';
                    Image = ItemTrackingLines;
                    ShortcutKey = 'Shift+Ctrl+I';
                    ToolTip = 'Executes the Item &Tracking Lines action.';
                    trigger OnAction()
                    begin
                        Rec.OpenItemTrackingLines();
                    end;
                }
            }
        }
    }

    trigger OnAfterGetRecord()
    begin
        Rec.ShowShortcutDimCode(ShortcutDimCode);
    end;

    trigger OnInsertRecord(BelowxRec: Boolean): Boolean
    begin
        Rec.Type := Rec.Type::Asset;

        Rec.ShowShortcutDimCode(ShortcutDimCode);
    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec.Type := Rec.Type::Asset
    end;

    trigger OnOpenPage()
    begin
        Rec.Type := Rec.Type::Asset
    end;

    var
        ShortcutDimCode: array[8] of Code[20];
}
