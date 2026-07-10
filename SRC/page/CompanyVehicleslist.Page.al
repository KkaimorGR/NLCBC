
page 52194322 "Company Vehicles list"
{
    ApplicationArea = Basic;
    CardPageId = "Company Vehicles Card";
    PageType = List;
    SourceTable = "Company Vehicles";
    UsageCategory = Lists;
    Caption = 'Company Vehicles list';
    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field("Registration No."; Rec."Registration No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Registration No. field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field(Capacity; Rec.Capacity)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Capacity field.';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Status field.';
                }
                field(Allocated; Rec.Allocated)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Allocated field.';
                }
                field("Wheelchair Accessible"; "Wheelchair Accessible")
                {
                    ApplicationArea = all;
                }

            }
        }
    }

    actions { }
}
