table 52193444 "Survey Character"
{
    Caption = 'Survey Character';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Line No."; Integer)
        {
            Caption = 'Line No.';
            AutoIncrement = true;
        }
        field(2; "Candidate No."; Code[40])
        {
            Caption = 'Candidate No.';
        }
        field(3; Question; Text[300])
        {
            Caption = 'Question';
        }
        field(4; Respose; Option)
        {
            Caption = 'Respose';
            OptionMembers = "",No,Yes;
        }
        field(5; Explanation; Text[300])
        {
            Caption = 'Explanation';
        }
    }
    keys
    {
        key(PK; "Line No.")
        {
            Clustered = true;
        }
    }
}
