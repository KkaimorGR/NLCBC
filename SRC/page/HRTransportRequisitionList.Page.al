
page 52194228 "HR Transport Requisition List"
{
    ApplicationArea = all;
    CardPageId = "HR Staff Transport Requisition";
    PageType = List;
    Editable = false;
    SourceTable = "HR Transport Requisition";
    UsageCategory = Lists;
    Caption = 'HR Transport Requisition List';
    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field("Transport Request No"; Rec."Transport Request No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Transport Request No field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Employee No"; Rec."Employee No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Employee No field.';
                }

                field("Wheelchair Accessible"; Rec."Wheelchair Accessible")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Wheelchair Accessible field.';
                }
                field(Supervisor; Rec.Supervisor)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Supervisor field.';
                }
                field("Responsibility Center"; Rec."Responsibility Center")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Responsibility Center field.';
                }
                field(Comment; Rec.Comment)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Comment field.';
                }
                field("Purpose of Trip"; Rec."Purpose of Trip")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Purpose of Trip field.';
                }
                field("Transport type"; Rec."Transport type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Transport type field.';
                }
                field("Time of Trip"; Rec."Time of Trip")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Time of Trip field.';
                }
                field("Time of Return"; Rec."Time of Return")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Time of Return field.';
                }
                field("Trip From Destination"; Rec."Trip From Destination")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Trip From Destination field.';
                }
                field("Trip To Destination"; Rec."Trip To Destination")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Trip To Destination field.';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = all;
                    OptionCaption = 'New,Pending Approval,Rejected,Approved,Released';
                    ToolTip = 'Specifies the value of the Status field.';
                }
                field("Start Date"; Rec."Start Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Start Date field.';
                }
                field("Return Date"; Rec."Return Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Return Date field.';
                }
                field(Names; Rec.Names)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Names field.';
                }
                field(County; Rec.County)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the County field.';
                }
                field("Days Applied"; Rec."Days Applied")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Days Applied field.';
                }
                field("Reference No."; Rec."Reference No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Reference No. field.';
                }
                field("Number of Employees"; Rec."Number of Employees")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Number of Employees field.';
                }
                field("Trip Return Destination"; Rec."Trip Return Destination")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Trip Return Destination field.';
                }
                field("Application Date"; Rec."Application Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Application Date field.';
                }
                field("User ID"; "User ID")
                {
                    ApplicationArea = Basic;
                }

            }
        }
    }

    actions { }
}
