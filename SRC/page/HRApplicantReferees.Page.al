
page 52193677 "HR Applicant Referees"
{
    PageType = List;
    SourceTable = "Application Referees";
    ApplicationArea = All;
    Caption = 'HR Applicant Referees';
    Editable = false;
    layout
    {
        area(Content)
        {
            repeater(Control1000000000)
            {
                field("Application No."; "Application No.")
                {
                    ApplicationArea = all;
                }
                field(Names; Rec.Name)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Names field.';
                }
                field(Designation; "Designation/Title")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Designation field.';
                }
                field(Institution; Rec.Institution)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Institution field.';
                }
                field("Telephone No"; "Phone No.")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Telephone No field.';
                }
                field("E-Mail"; Rec."E-Mail")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the E-Mail field.';
                }
                field("Contact Years Known"; "Contact Years Known")
                {
                    ApplicationArea = all;
                }
                field(Address; Rec.Address)
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Address field.';
                }

            }
        }
    }

    actions { }
}
