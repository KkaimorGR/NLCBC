
table 52193858 "Contract Expectations"
{
    Caption = 'Contract Expectations';
    DataClassification = CustomerContent;
    fields
    {
        field(1; "Expectation Code"; Code[10])
        {
            Caption = 'Expectation Code';
        }
        field(2; Description; Text[30])
        {
            Caption = 'Description';
        }
    }

    keys
    {
        key(Key1; "Expectation Code")
        {
            Clustered = true;
        }
    }

    fieldgroups { }
}
