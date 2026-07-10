
page 52193961 "Office Equipments/Machines"
{
    PageType = List;
    SourceTable = "Employee Equipment";
    ApplicationArea = All;
    Caption = 'Office Equipments/Machines';
    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field("Employee code"; Rec."Employee code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Employee code field.';
                }
                field("Office Equipment/Machine"; Rec."Office Equipment/Machine")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Office Equipment/Machine field.';
                }
            }
        }
    }

    actions { }
}
