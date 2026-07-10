
Page 52193492 "Asset Receiving Line View"
{
    DeleteAllowed = false;
    Editable = true;
    InsertAllowed = false;
    ModifyAllowed = false;
    PageType = List;
    SourceTable = "Store Requisition TT Line";
    SourceTableView = where(Type = const(Asset),
                            "Request Status" = const(Released));

    layout
    {
        area(content)
        {
            repeater(Control1102755000)
            {
                field(Type; Type)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    OptionCaption = 'Item,Asset';
                }
                field("IFMIS Order No"; "IFMIS Order No")
                {
                    ApplicationArea = Basic;
                }
                field("Requistion No"; "Requistion No")
                {
                    ApplicationArea = Basic;
                }
                field("Asset Code"; "Asset Code")
                {
                    ApplicationArea = Basic;
                }
                field(Description; Description)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Unit of Measure"; "Unit of Measure")
                {
                    ApplicationArea = Basic;
                }
                field("Shortcut Dimension 1 Code"; "Shortcut Dimension 1 Code")
                {
                    ApplicationArea = Basic;
                }
                field("Shortcut Dimension 2 Code"; "Shortcut Dimension 2 Code")
                {
                    ApplicationArea = Basic;
                }
                field(Quantity; "Quantity Requested")
                {
                    ApplicationArea = Basic;
                    Caption = 'Quantity';
                }
                field("Unit Cost"; "Unit Cost")
                {
                    ApplicationArea = Basic;
                }
                field("Line Amount"; "Line Amount")
                {
                    ApplicationArea = Basic;
                }
                field("Purchasing Store"; "Purchasing Store")
                {
                    ApplicationArea = Basic;
                }
                field("Request Status"; "Request Status")
                {
                    ApplicationArea = Basic;
                }
                field("Received Status"; "Received Status")
                {
                    ApplicationArea = Basic;
                }
                field("Supplier Name"; "Supplier Name")
                {
                    ApplicationArea = Basic;
                }
                field("Approved IFMIS No."; "Approved IFMIS No.")
                {
                    ApplicationArea = Basic;
                }
            }
        }
    }

    actions
    {
    }

    trigger OnAfterGetRecord()
    begin
        ShowShortcutDimCode(ShortcutDimCode);
    end;

    trigger OnInsertRecord(BelowxRec: Boolean): Boolean
    begin
        Type := Type::Asset;

        ShowShortcutDimCode(ShortcutDimCode);
    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Type := Type::Asset
    end;

    trigger OnOpenPage()
    begin
        Type := Type::Asset
    end;

    var
        ShortcutDimCode: array[8] of Code[20];
}

