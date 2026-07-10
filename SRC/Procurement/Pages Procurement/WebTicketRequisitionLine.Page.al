
Page 52194400 "Web Ticket Requisition Line"
{
    PageType = ListPart;
    SourceTable = "Store Requisition TT Line";
    //SourceTableView = where("Booking Type"=const(Ticket));

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
                field("Employee No"; "Employee No")
                {
                    ApplicationArea = Basic;
                }
                field("Employee Name"; "Employee Name")
                {
                    ApplicationArea = Basic;
                }
                field("No."; "No.")
                {
                    ApplicationArea = Basic;
                }
                field(Type; Type)
                {
                    ApplicationArea = Basic;
                    OptionCaption = 'Service';
                }
                field("Booking Type"; "Booking Type")
                {
                    ApplicationArea = Basic;
                }
                field("Purpose of Travel"; "Purpose of Travel")
                {
                    ApplicationArea = Basic;
                }
                field("Destination From"; "Destination From")
                {
                    ApplicationArea = Basic;
                }
                field("Destination To"; "Destination To")
                {
                    ApplicationArea = Basic;
                }
                field("Departure Date"; "Departure Date")
                {
                    ApplicationArea = Basic;
                }
                field("Departure Time"; "Departure Time")
                {
                    ApplicationArea = Basic;
                }
                field("Return Date"; "Return Date")
                {
                    ApplicationArea = Basic;
                }
                field("Return Time"; "Return Time")
                {
                    ApplicationArea = Basic;
                }
                field("Request Status"; "Request Status")
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
                    Visible = false;
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

