
page 52193788 "HR Job Qualifications Lists"
{
    PageType = List;
    SourceTable = "HR Job Qualifications";
    ApplicationArea = All;
    Caption = 'HR Job Qualifications Lists';
    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field("Qualification Type"; Rec."Qualification Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Qualification Type field.';
                }
                field("Code"; Rec.Code)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Code field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field(Category; Rec.Category)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Category field.';
                }
                field("Order"; Rec.Order)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Order field.';
                }
                field(Closed; Rec.Closed)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Closed field.';
                }
                field(Professional; Rec.Professional)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Professional field.';
                }
            }
        }
    }

    actions { }
}
