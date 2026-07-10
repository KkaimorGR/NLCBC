
page 52193761 "Inactive staff"
{
    ApplicationArea = Basic;
    CardPageId = "HR Employee Card";
    Editable = false;
    PageType = List;
    SourceTable = "HR Employees";
    SourceTableView = where(Status = const(Inactive));
    UsageCategory = Lists;
    Caption = 'Inactive staff';
    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field("No."; Rec."No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No. field.';
                }
                field("Full Name"; Rec."Full Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Full Name field.';
                }
                field("ID Number"; Rec."ID Number")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the ID Number field.';
                }
                field(Gender; Rec.Gender)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Gender field.';
                }
                field("Department Code"; Rec."Responsibility Center")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Department Code field.';
                }
                field("Location/Division Code"; Rec."Location/Division Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Location/Division Code field.';
                }
            }
        }
    }

    actions { }
}
