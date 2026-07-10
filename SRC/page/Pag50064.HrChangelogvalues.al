page 52193488 "Hr Change log values"
{
    ApplicationArea = All;
    Caption = 'Change log values';
    PageType = List;
    SourceTable = "HR Employee Staff Changes";
    UsageCategory = Lists;
    Editable = false;
    DeleteAllowed = false;

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("Employee No"; "Employee No")
                {
                    ApplicationArea = all;
                    Editable = false;
                }
                field("Full Name"; "Full Name")
                {
                    ApplicationArea = all;
                    Editable = false;
                }
                field("Field Modified"; "Field Modified")
                {
                    ApplicationArea = all;
                    Editable = false;
                }
                field("Old Value"; "Old Value")
                {
                    ApplicationArea = all;
                    Editable = false;
                }
                field("New Value"; "New Value")
                {
                    ApplicationArea = all;
                    Editable = false;
                }
                field("Captured By"; "Captured By")
                {
                    ApplicationArea = all;
                }
            }
        }
    }
}
