
page 52193785 "Applicant Relevant Document"
{
    Caption = 'Applicant Relevant Document';
    PageType = Card;
    SourceTable = "Applicant relevant Documents1";
    ApplicationArea = All;

    layout
    {
        area(Content)
        {
            group(General)
            {
                field("Applicant No"; Rec."Applicant No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Applicant No field.';
                }
                field("Job Application No"; Rec."Job Application No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Job Application No field.';
                }
                field("Helb Certificate"; Rec."Helb Certificate")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Helb Certificate field.';
                }
                field("Good Conduct Certificate"; Rec."Good Conduct Certificate")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Good Conduct Certificate field.';
                }
                field("CRB Certificate"; Rec."CRB Certificate")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the CRB Certificate field.';
                }
                field("EACC Certificate"; Rec."EACC Certificate")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the EACC Certificate field.';
                }
                field("KRA Pin Certificate"; Rec."KRA Pin Certificate")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the KRA Pin Certificate field.';
                }
                field("Date Modified"; Rec."Date Modified")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Date Modified field.';
                }
                field("Entry No"; Rec."Entry No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Entry No field.';
                }
            }
        }
    }

    actions { }
}
