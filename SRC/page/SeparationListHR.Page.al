
page 52193798 "Separation List HR"
{
    CardPageId = "Separation Card HR";
    DeleteAllowed = false;
    Editable = false;
    InsertAllowed = false;
    ModifyAllowed = false;
    PageType = List;
    SourceTable = "Employee Separation Header";
    ApplicationArea = All;
    Caption = 'Separation List HR';
    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field("Separation No."; Rec."Separation No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Separation No. field.';
                }
                field("Responsibility Center"; Rec."Responsibility Center")
                {
                    ApplicationArea = Basic;
                    Editable = true;
                    ToolTip = 'Specifies the value of the Responsibility Center field.';
                }
                field("Request Date"; Rec."Request Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Request Date field.';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Status field.';
                }
                field("User ID"; Rec."User ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the User ID field.';
                }
            }
        }
    }

    actions { }
}
