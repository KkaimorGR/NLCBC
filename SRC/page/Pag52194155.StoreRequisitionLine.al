
page 52194338 "Store RequisitionLine"
{
    PageType = ListPart;
    SourceTable = "Store Requisition TT Line";
    ApplicationArea = All;
    Caption = 'Store RequisitionLine';
    layout
    {
        area(Content)
        {
            repeater(Control1102755000)
            {
                field(Type; Rec.Type)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Type field.';
                }
                field("No."; Rec."No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No. field.';
                    trigger OnValidate()

                    begin
                        CheckStaff();
                        value := Dept = 'SUPPLY CHAIN PROCUREMENT';

                    end;
                }
                field(Description; Rec.Description)
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
                field("Qty in store"; Rec."Qty in store")
                {
                    ApplicationArea = Basic;
                    Visible = value;
                    ToolTip = 'Specifies the value of the Qty in store field.';
                }
                field("Quantity Requested"; "Quantity Requested")
                {

                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Qty Required in store field.';

                }
                field("Shortcut Dimension 1 Code"; Rec."Shortcut Dimension 1 Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Shortcut Dimension 1 Code field.';
                    Visible = false;
                }
                field("Shortcut Dimension 2 Code"; Rec."Shortcut Dimension 2 Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Shortcut Dimension 2 Code field.';
                    Visible = false;
                }
                field(Quantity; Rec.Quantity)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Quantity Requested field.';
                    Visible = value;
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

                // field(Quantity; Rec.Quantity)
                // {
                //     ApplicationArea = Basic;
                //     Caption = 'Quantity To Issue';
                //     ToolTip = 'Specifies the value of the Quantity To Issue field.';
                // }
                field("Card No."; "Card No.")
                {
                    ApplicationArea = all;
                    // Visible = false;
                }
                field("Issuing Store"; Rec."Issuing Store")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Issuing Store field.';
                }
                field(Issued; Issued)
                {
                    ApplicationArea = all;
                    Editable = false;
                }
                field("Description 2"; Rec."Description 2")
                {
                    ApplicationArea = Basic;
                    Caption = 'Remark';
                    ToolTip = 'Specifies the value of the Remark field.';
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
            action("Issue Item")
            {
                Enabled = value;
                trigger OnAction()

                var

                    LineNo: Integer;

                begin
                    Portweb.IssueGoods(rec."Line No.", rec."Requistion No");
                end;
            }
            action("Accept Items")
            {
                trigger OnAction()
                begin

                    Portweb.AcceptGoods(rec."Requistion No");

                end;
            }
        }
    }

    trigger OnOpenPage()

    begin
        CheckStaff();
        value := Dept = 'SUPPLY CHAIN PROCUREMENT';

    end;

    trigger OnAfterGetRecord()
    begin
        Rec.ShowShortcutDimCode(ShortcutDimCode);
        CheckStaff();
        value := Dept = 'SUPPLY CHAIN PROCUREMENT';
    end;

    trigger OnAfterGetCurrRecord()

    begin
        CheckStaff();
        value := Dept = 'SUPPLY CHAIN PROCUREMENT';
    end;

    trigger OnInsertRecord(BelowxRec: Boolean): Boolean
    begin
        Rec.ShowShortcutDimCode(ShortcutDimCode);
    end;

    var
        ShortcutDimCode: array[8] of Code[20];
        GenJnline: Record "Item Journal Line";
        ReqLine: Record "Store Requisition TT Line";
        InventorySetup: Record "Inventory Setup";
        LineNo: Integer;
        Storeheaders: Record "Store Requistion Headers";
        Portweb: Codeunit SupplyChainWebServices;

        Dept: Code[40];

        value: Boolean;

    procedure CheckStaff()
    var
        UserSetting: Record "User Personalization";
    begin

        UserSetting.SetRange("User ID", UserId);
        if UserSetting.FindFirst() then begin
            Dept := UserSetting."Profile ID";
        end;

    end;
}
