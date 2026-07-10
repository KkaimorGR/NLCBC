
table 52193645 "Applicant Sessions"
{
    Caption = 'Applicant Sessions';
    DataClassification = CustomerContent;
    fields
    {
        field(10; No; Integer)
        {
            AutoIncrement = true;
            Caption = 'No';
        }
        field(20; UserName; Text[30])
        {
            Caption = 'UserName';
        }
        field(30; SessionId; Text[50])
        {
            Caption = 'SessionId';
        }
        field(40; LoginTime; DateTime)
        {
            Caption = 'LoginTime';
        }
        field(41; LogoutTime; DateTime)
        {
            Caption = 'LogoutTime';
        }
    }

    keys
    {
        key(Key1; No)
        {
            Clustered = true;
        }
    }

    fieldgroups { }
}
