page 52193524 "Monthly salary Scale"
{
    ApplicationArea = All;
    Caption = 'Monthly salary Scale';
    PageType = List;
    SourceTable = "Monthly Salary Scale";
    UsageCategory = Administration;
    // Editable = false;

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("Entry No."; "Entry No.")
                {
                    ApplicationArea = all;
                    Editable = false;
                    Visible = false;
                }
                field("Job ID"; "Job ID")
                {
                    ApplicationArea = all;
                    Editable = false;
                }
                field("Transaction Name"; "Transaction Name")
                {
                    ApplicationArea = all;
                    Caption = 'Salary Details';
                }
                field(Amount; Amount)
                {
                    ApplicationArea = all;
                }
                field(Remarks; Remarks)
                {
                    ApplicationArea = all;
                }
            }
        }
    }
}
