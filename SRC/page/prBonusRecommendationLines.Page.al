
page 52193755 "prBonus Recommendation Lines"
{
    PageType = ListPart;
    SourceTable = "Responsibility Center BR NEW";
    ApplicationArea = All;
    Caption = 'prBonus Recommendation Lines';
    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field("Name 2"; Rec."Name 2")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Name 2 field.';
                }
                field(Contact; Rec.Contact)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Contact field.';
                }
            }
        }
    }

    actions { }
}
