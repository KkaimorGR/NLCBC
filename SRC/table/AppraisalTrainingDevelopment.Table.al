
table 52193642 "Appraisal Training Development"
{
    Caption = 'Appraisal Training Development';
    DataClassification = CustomerContent;
    fields
    {
        field(1; "Entry No"; Integer)
        {
            AutoIncrement = true;
            Caption = 'Entry No';
        }
        field(2; "Skills Gap"; Text[250])
        {
            Caption = 'Skills Gap';
        }
        field(3; "Skills Example"; Text[250])
        {
            Caption = 'Skills Example';
        }
        field(4; "Recommended Development"; Text[250])
        {
            Caption = 'Recommended Development';
        }
        field(5; Date; Date)
        {
            Caption = 'Date';
        }
        field(50001; "Staff No"; Code[50])
        {
            Caption = 'Staff No';
        }
        field(50002; "Appraisal Code"; Code[50])
        {
            TableRelation = "HR Appraisal Header"."Appraisal No";
            Caption = 'Appraisal Code';
        }
        field(50003; "inhouse or outhouse"; Text[30])
        {
            Caption = 'inhouse or outhouse';
        }
        field(50004; Duration; Code[30])
        {
            Caption = 'Duration';
        }
        field(50005; "Training Type"; Text[250])
        {
            Caption = 'Training Type';
        }
    }

    keys
    {
        key(Key1; "Entry No", "Appraisal Code", "Skills Gap", Duration, "Training Type")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
        fieldgroup(Dropdown; "Appraisal Code", "Skills Gap", "Training Type", Duration)
        { }
    }
}
