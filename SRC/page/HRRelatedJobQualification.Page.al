
page 52194235 "HR Related Job Qualification"
{
    PageType = List;
    SourceTable = "HR Job Related Requirements";
    ApplicationArea = All;
    Caption = 'HR Related Job Qualification';
    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field("Qualification ID"; Rec."Qualification ID")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Qualification ID field.';
                }
                field("Qualification Type"; Rec."Qualification Type")
                {
                    ApplicationArea = Basic;
                    Editable = true;
                    ToolTip = 'Specifies the value of the Qualification Type field.';
                }
                field("Job ID"; Rec."Job ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Job ID field.';
                }
                field("Qualification Code"; Rec."Qualification Code")
                {
                    ApplicationArea = Basic;
                    Editable = true;
                    ToolTip = 'Specifies the value of the Qualification Code field.';
                    trigger OnValidate()
                    begin
                        if Rec."Job ID" = '' then
                            Error('You must select Job ID first');
                    end;
                }
                field("Qualification Description"; Rec."Qualification Description")
                {
                    ApplicationArea = Basic;
                    Editable = true;
                    ToolTip = 'Specifies the value of the Qualification Description field.';
                }
                field("Minimum Score"; Rec."Minimum Score")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Minimum Score field.';
                }
                field("Maximum Score"; Rec."Maximum Score")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Maximum Score field.';
                }
                field(Relevant; Rec.Relevant)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Relevant field.';
                }
                field(No; Rec.No)
                {
                    ApplicationArea = Basic;
                    Enabled = false;
                    ToolTip = 'Specifies the value of the No field.';
                }
            }
        }
    }

    actions { }
}
