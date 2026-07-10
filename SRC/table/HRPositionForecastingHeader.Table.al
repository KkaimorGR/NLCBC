
table 52193575 "HR Position Forecasting Header"
{
    Caption = 'HR Position Forecasting Header';
    DataClassification = CustomerContent;
    fields
    {
        field(1; Region; Code[20])
        {
            Caption = 'Region';
        }
        field(2; Department; Code[20])
        {
            Caption = 'Department';
        }
    }

    keys
    {
        key(Key1; Region)
        {
            Clustered = true;
        }
    }

    fieldgroups { }
}
