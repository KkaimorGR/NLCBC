
table 52193868 Bidder
{
    // DrillDownPageId = "Bidder List";
    // LookupPageId = "Bidder List";
    Caption = 'Bidder';
    DataClassification = CustomerContent;
    fields
    {
        field(1; "PIN No"; Code[20])
        {
            NotBlank = true;
            Caption = 'PIN No';
        }
        field(4; "Date Created"; Date)
        {
            Caption = 'Date Created';
        }
        field(6; "Created By"; Code[20])
        {
            Editable = false;
            Caption = 'Created By';
        }
        field(7; Password; Text[250])
        {
            Caption = 'Password';

        }
        field(8; "Tenderer Name"; Text[100])
        {
            Caption = 'Tenderer Name';
        }
        field(9; "Changed Password"; Boolean)
        {
            Caption = 'Changed Password';
        }
        field(50000; "Procurement Officer"; Boolean)
        {
            Caption = 'Procurement Officer';
        }
        field(50001; "Posted To Portal"; Boolean)
        {
            Caption = 'Posted To Portal';
        }
    }

    keys
    {
        key(Key1; "PIN No")
        {
            Clustered = true;
        }
    }

    fieldgroups { }
}
