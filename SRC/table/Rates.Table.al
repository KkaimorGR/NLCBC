
table 52193766 Rates
{
    LookupPageId = Rates;
    Caption = 'Rates';
    DataClassification = CustomerContent;
    fields
    {
        field(1; "Code"; Code[20])
        {
            Caption = 'Code';
        }
        field(2; Rate; Decimal)
        {
            Caption = 'Rate';
        }
        field(3; Type; Option)
        {
            OptionCaption = ' ,Interest,Withholding Tax';
            OptionMembers = " ",Interest,"Withholding Tax";
            Caption = 'Type';
        }
    }

    keys
    {
        key(Key1; "Code", Rate)
        {
            Clustered = true;
        }
    }

    fieldgroups { }
}
