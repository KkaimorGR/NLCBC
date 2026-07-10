
table 52193740 "Quote Specifications"
{
    LookupPageId = "Quote Specifications List";
    Caption = 'Quote Specifications';
    DataClassification = CustomerContent;
    fields
    {
        field(1; "Code"; Code[20])
        {
            Caption = 'Code';
        }
        field(2; Description; Text[60])
        {
            Caption = 'Description';
        }
        field(3; "Value/Weight"; Decimal)
        {
            Caption = 'Value/Weight';
        }
    }

    keys
    {
        key(Key1; "Code")
        {
            Clustered = true;
        }
    }

    fieldgroups { }
}
