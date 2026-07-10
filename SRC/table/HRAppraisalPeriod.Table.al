
table 52193546 "HR Appraisal Period"
{
    Caption = 'HR Appraisal Period';
    DataClassification = CustomerContent;
    fields
    {
        field(1; "Appraisal Period"; Date)
        {
            Caption = 'Appraisal Period';
        }
        field(2; "Appraisal Period Description"; Text[100])
        {
            Caption = 'Appraisal Period Description';
        }
        field(3; "Appraisal Type"; Option)
        {
            OptionCaption = 'Appraisal Review,Target Setting,End Year Appraisal';
            OptionMembers = "Appraisal Review","Target Setting","End Year Appraisal";
            Caption = 'Appraisal Type';
        }
        field(4; Closed; Boolean)
        {
            Caption = 'Closed';
        }
        field(5; "Date opened"; Date)
        {
            Caption = 'Date opened';
        }
        field(6; "Date closed"; Date)
        {
            Caption = 'Date closed';
        }
        field(7; "Appraisal Month"; Integer)
        {
            Caption = 'Appraisal Month';
        }
        field(8; "Appraisal Year"; Text[30])
        {
            Caption = 'Appraisal Year';
        }
    }

    keys
    {
        key(Key1; "Appraisal Period")
        {
            Clustered = true;
        }
    }

    fieldgroups { }
}
