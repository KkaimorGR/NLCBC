
table 52193830 "PI Master"
{
    DrillDownPageId = "PI List";
    LookupPageId = "PI List";
    Caption = 'PI Master';
    DataClassification = CustomerContent;
    fields
    {
        field(1; "PI Code"; Code[50])
        {
            Caption = 'PI Code';
        }
        field(2; "PI Name"; Text[100])
        {
            Caption = 'PI Name';
        }
        field(3; "Colabotative Institution"; Text[100])
        {
            Caption = 'Colabotative Institution';
        }
        field(4; "PI Address"; Text[30])
        {
            Caption = 'PI Address';
        }
        field(5; "PI Telephone"; Text[30])
        {
            ExtendedDatatype = PhoneNo;
            Caption = 'PI Telephone';
        }
        field(6; "PI EMail"; Text[30])
        {
            ExtendedDatatype = EMail;
            Caption = 'PI EMail';
        }
    }

    keys
    {
        key(Key1; "PI Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
        fieldgroup(DropDown; "PI Code", "PI Name", "Colabotative Institution") { }
    }
}
