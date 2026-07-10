
page 52193708 "HR OSAccident Card"
{
    DeleteAllowed = false;
    PageType = Card;
    SourceTable = "HR OSAccident";
    ApplicationArea = All;
    Caption = 'HR OSAccident Card';
    layout
    {
        area(Content)
        {
            group(General)
            {
                field("Accident No"; Rec."Accident No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Accident No field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
            }
            part(Control5; "HR OSAccident Line")
            {
                SubPageLink = "Accident No" = field("Accident No");
            }
            part(Control6; "Transfer Schedule List")
            {
                SubPageLink = Description = field("Accident No");
            }
        }
    }

    actions { }
}
