
page 52193642 "HR Employee Req. Factbox"
{
    PageType = ListPart;
    SourceTable = "HR Jobs";
    ApplicationArea = All;
    Caption = 'HR Employee Req. Factbox';
    layout
    {
        area(Content)
        {
            field("Job ID"; Rec."Job ID")
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the Job ID field.';
            }
            field("No of Posts"; Rec."No of Posts")
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the No of Posts field.';
            }
            field("Position Reporting to"; Rec."Position Reporting to")
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the Position Reporting to field.';
            }
            field("Occupied Positions"; Rec."Occupied Positions")
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the Occupied Positions field.';
            }
            field("Vacant Positions"; Rec."Vacant Positions")
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the Vacant Positions field.';
            }
            field(Category; Rec.Category)
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the Category field.';
            }
            field(Grade; Rec.Grade)
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the Grade field.';
            }
            field("Employee Requisitions"; Rec."Employee Requisitions")
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the Employee Requisitions field.';
            }
            field("Supervisor Name"; Rec."Supervisor Name")
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the Supervisor Name field.';
            }
            field(Status; Rec.Status)
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the Status field.';
            }
            field("Responsibility Center"; Rec."Responsibility Center")
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the Responsibility Center field.';
            }
        }
    }

    actions { }
}
