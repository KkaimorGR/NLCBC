
page 52194254 "HR Training Bonding Cond. List"
{
    Caption = 'HR Training Bonding Conditions List';
    PageType = List;
    SourceTable = "HR Training Bonding Conditions";
    ApplicationArea = All;

    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field("Training Bonding Code"; Rec."Training Bonding Code")
                {
                    ApplicationArea = Basic;
                    Editable = True;
                    ToolTip = 'Specifies the value of the Training Bonding Code field.';
                }
                field("Condition Type"; Rec."Condition Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Condition Type field.';
                    trigger OnValidate()
                    begin
                        HRTrainingNeeds.Reset();
                        if HRTrainingNeeds.Get(Rec."Training Bonding Code") then
                            HRTrainingNeeds.TestField(HRTrainingNeeds."Early Bonded Exit?", true);
                    end;
                }
                field("Condition Description"; Rec."Condition Description")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Condition Description field.';
                }
                field("Minimum Amount"; Rec."Minimum Amount")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Minimum Amount field.';
                }
                field("Maximum Amount"; Rec."Maximum Amount")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Maximum Amount field.';
                }
            }
        }
        area(FactBoxes)
        {
            systempart(Control8; Outlook) { }
            systempart(Control9; Notes) { }
        }
    }

    actions { }

    var
        HRTrainingNeeds: Record "HR Training Needs";
}
