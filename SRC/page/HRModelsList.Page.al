

page 50021 "HR Models List"
{
    CardPageId = "HR Models Card";
    DeleteAllowed = false;
    InsertAllowed = false;
    ModifyAllowed = false;
    PageType = List;
    SourceTable = "HR Models";
    ApplicationArea = All;
    Caption = 'HR Models List';
    layout
    {
        area(Content)
        {
            repeater(Control1102755000)
            {
                Editable = true;
                field(Type; Rec.Type)
                {
                    ApplicationArea = Basic;
                    Enabled = false;
                    ToolTip = 'Specifies the value of the Type field.';
                }
                field("Code"; Rec.Code)
                {
                    ApplicationArea = Basic;
                    Enabled = false;
                    ToolTip = 'Specifies the value of the Code field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Description field.';
                }
            }
        }
        area(FactBoxes)
        {
            part(Control1102755004; "HR Model Factbox")
            {
                SubPageLink = Type = field(Type);
                ApplicationArea = Basic;
            }
        }
    }

    actions { }
}

#pragma implicitwith restore

