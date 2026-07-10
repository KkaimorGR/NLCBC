
table 52193675 "Travel Destination"
{
    DrillDownPageId = "Destination Code List";
    LookupPageId = "Destination Code List";
    Caption = 'Travel Destination';
    DataClassification = CustomerContent;
    fields
    {
        field(1; "Destination Code"; Code[20])
        {
            NotBlank = true;
            Caption = 'Destination Code';
        }
        field(2; "Destination Name"; Text[50])
        {
            Caption = 'Destination Name';
        }
        field(3; "Destination Type"; Option)
        {
            OptionMembers = "Local",Foreign;
            Caption = 'Destination Type';
        }
        field(4; Currency; Code[10])
        {
            CalcFormula = lookup("Destination Rate Entry".Currency where("Destination Code" = field("Destination Code")));
            FieldClass = FlowField;
            Caption = 'Currency';
            Editable = false;
        }
    }

    keys
    {
        key(Key1; "Destination Code")
        {
            Clustered = true;
        }
    }

    fieldgroups { }
}
