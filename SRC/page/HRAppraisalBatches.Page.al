
page 52194305 "HR Appraisal Batches"
{
    PageType = List;
    SourceTable = "HR Appraisal Journal Batch";
    ApplicationArea = All;
    Caption = 'HR Appraisal Batches';
    layout
    {
        area(Content)
        {
            repeater(Control1102755000)
            {
                field(Name; Rec.Name)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Name field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Posting Description"; Rec."Posting Description")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Posting Description field.';
                }
                field(Type; Rec.Type)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Type field.';
                }
            }
        }
    }

    actions { }
}
