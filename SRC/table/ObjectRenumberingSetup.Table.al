
table 52194154 "Object Renumbering Setup"
{
    Caption = 'Object Renumbering Setup';
    DataClassification = CustomerContent;
    fields
    {
        field(1; "Primary Key"; Code[20])
        {
            Caption = 'Primary Key';
        }
        field(2; "Database Name"; Text[30])
        {
            Caption = 'Database Name';
        }
        field(3; "Connnection String"; Text[250])
        {
            Caption = 'Connnection String';
        }
    }

    keys
    {
        key(Key1; "Primary Key")
        {
            Clustered = true;
        }
    }

    fieldgroups { }
}
