
page 52193972 "Vendor Category Card"
{
    Editable = true;
    PageType = Card;
    SourceTable = "HR Disciplinary Cases";
    ApplicationArea = All;
    Caption = 'Vendor Category Card';
    layout
    {
        area(Content)
        {
            group(Group)
            {
                field("Case Number"; Rec."Case Number")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Case Number field.';
                }
                field("Date of Complaint"; Rec."Date of Complaint")
                {
                    ApplicationArea = Basic;
                    Caption = 's';
                    ToolTip = 'Specifies the value of the s field.';
                }
                field("Type of Disciplinary Case"; Rec."Type of Disciplinary Case")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Type of Disciplinary Case field.';
                }
                field("Recommended Action"; Rec."Recommended Action")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Recommended Action field.';
                }
            }
        }
        area(FactBoxes)
        {
            systempart(Control1000000008; Outlook) { }
            systempart(Control1000000009; Notes) { }
            systempart(Control1000000010; MyNotes) { }
        }
    }

    actions { }
}
