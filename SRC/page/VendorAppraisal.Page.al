
page 52194153 "Vendor Appraisal."
{
    ApplicationArea = Basic;
    CardPageId = "Vendor Appraisal";
    PageType = List;
    SourceTable = "Evaluation Parameter Header";
    UsageCategory = Lists;
    Caption = 'Vendor Appraisal.';
    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field("Criteria Code"; Rec."Criteria Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Criteria Code field.';
                }
                field("Criteria Description"; Rec."Criteria Description")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Criteria Description field.';
                }
                field("Evaluation  Period"; Rec."Evaluation  Period")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Evaluation  Period field.';
                }
                field("Vendor No."; Rec."Vendor No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Vendor No. field.';
                }
                field("Total Expected Value"; Rec."Total Expected Value")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Total Expected Value field.';
                }
                field("Overall Comment"; Rec."Overall Comment")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Overall Comment field.';
                }
                field("Total Actuals Value"; Rec."Total Actuals Value")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Total Actuals Value field.';
                }
                field("Vendor Name"; Rec."Vendor Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Vendor Name field.';
                }
            }
        }
    }

    actions { }
}
