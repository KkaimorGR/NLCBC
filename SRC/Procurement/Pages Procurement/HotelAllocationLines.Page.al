
Page 52193498 "Hotel Allocation Lines"
{
    PageType = ListPart;
    SourceTable = "Store Requisition TT Line";

    layout
    {
        area(content)
        {
            repeater(Control1102755000)
            {
                field("Requistion No"; "Requistion No")
                {
                    ApplicationArea = Basic;
                }
                field("Line No."; "Line No.")
                {
                    ApplicationArea = Basic;
                }
                field(Type; Type)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    OptionCaption = 'Service';
                }
                field(Hotel; Hotel)
                {
                    ApplicationArea = Basic;
                }
                field("Hotel Name"; "Hotel Name")
                {
                    ApplicationArea = Basic;
                }
                field("Booking Type"; "Booking Type")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Purpose of Travel"; "Purpose of Travel")
                {
                    ApplicationArea = Basic;
                    Visible = "Booking Type" = "Booking Type"::Ticket;
                }
                field("From Date"; "From Date")
                {
                    ApplicationArea = Basic;
                }
                field("To Date"; "To Date")
                {
                    ApplicationArea = Basic;
                }
            }
        }
    }

    actions
    {
        area(processing)
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
                    ShortCutKey = 'Shift+Ctrl+I';

                    trigger OnAction()
                    begin
                        OpenItemTrackingLines;
                    end;
                }
            }
        }
    }

    trigger OnAfterGetRecord()
    begin
        ShowShortcutDimCode(ShortcutDimCode);
    end;

    trigger OnInsertRecord(BelowxRec: Boolean): Boolean
    begin
        ShowShortcutDimCode(ShortcutDimCode);
    end;

    var
        ShortcutDimCode: array[8] of Code[20];
}

