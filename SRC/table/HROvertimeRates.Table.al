
table 52193938 "HR Overtime Rates"
{
    Caption = 'HR Overtime Rates';
    DataClassification = CustomerContent;
    fields
    {
        field(1; "Line No."; Integer)
        {
            AutoIncrement = true;
            Caption = 'Line No.';
        }
        field(2; "Extra Hours Rate"; Decimal)
        {
            Caption = 'Extra Hours Rate';
        }
        field(3; "Holiday Hours Rate"; Decimal)
        {
            Caption = 'Holiday Hours Rate';
        }
        field(4; "Weekend Hours Rate"; Decimal)
        {
            Caption = 'Weekend Hours Rate';
        }
        field(5; "Conversion Type"; Option)
        {
            OptionCaption = ' ,Convert to Pay,Convert to Leave';
            OptionMembers = " ","Convert to Pay","Convert to Leave";
            Caption = 'Conversion Type';
        }
    }

    keys
    {
        key(Key1; "Line No.")
        {
            Clustered = true;
        }
    }

    fieldgroups { }
}
