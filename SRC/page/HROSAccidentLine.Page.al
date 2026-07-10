
page 52193709 "HR OSAccident Line"
{
    DeleteAllowed = false;
    PageType = ListPart;
    SourceTable = "HR OSAccident Line";
    ApplicationArea = All;
    Caption = 'HR OSAccident Line';
    layout
    {
        area(Content)
        {
            repeater(Group)
            {
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
                field("Accident No"; Rec."Accident No")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Accident No field.';
                }
            }
        }
    }

    actions { }
}
