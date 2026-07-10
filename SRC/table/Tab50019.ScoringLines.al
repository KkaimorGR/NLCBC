table 52193442 "Scoring Lines"
{
    Caption = 'Scoring Lines';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Code"; Code[20])
        {
            Caption = 'Code';
        }
        field(2; "Minimum Score"; Decimal)
        {
            Caption = 'Minimum Score';
        }
        field(3; "Maximum Score"; Decimal)
        {
            Caption = 'Maximum Score';
        }
        field(4; Qualified; Boolean)
        {
            DataClassification = ToBeClassified;
        }
    }
    keys
    {
        key(PK; "Code", "Minimum Score")
        {
            Clustered = true;
        }
    }
}
