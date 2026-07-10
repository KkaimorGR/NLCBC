
table 52193579 "HR Appraisal Company Target"
{
    Caption = 'HR Appraisal Company Target';
    DataClassification = CustomerContent;
    fields
    {
        field(1; "Code"; Code[10])
        {
            Caption = 'Code';
        }
        field(2; Description; Text[30])
        {
            Caption = 'Description';
        }
        field(3; Score; Decimal)
        {
            Caption = 'Score';

        }
        field(4; Recommendations; Text[200])
        {
            Caption = 'Recommendations';
        }
        field(5; "Description 2"; Text[250])
        {
            Caption = 'Description 2';
        }
    }

    keys
    {
        key(Key1; "Code")
        {
            Clustered = true;
        }
        key(Key2; Description, Score) { }
    }

    fieldgroups { }

    var
        HRAppraisalRating: Record "HR Appraisal Company Target";
}
