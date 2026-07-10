
table 52193945 "HR Individual Objectives"
{
    Caption = 'HR Individual Objectives';
    DataClassification = CustomerContent;
    fields
    {
        field(1; ID; Integer)
        {
            AutoIncrement = true;
            Caption = 'ID';
        }
        field(2; "Staff No"; Code[50])
        {
            Caption = 'Staff No';
        }
        field(3; Department; Text[100])
        {
            Caption = 'Department';
        }
        field(4; Objectives; Text[250])
        {
            Caption = 'Objectives';
        }
        field(5; Period; Code[50])
        {
            Caption = 'Period';
        }
        field(6; "Appraisal No"; Code[50])
        {
            Caption = 'Appraisal No';
        }
        field(7; "Directorate Code"; Text[50])
        {
            Caption = 'Directorate Code';
        }
    }

    keys
    {
        key(Key1; ID)
        {
            Clustered = true;
        }
    }

    fieldgroups { }
}
