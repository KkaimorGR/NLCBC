
table 52193754 "Cashier Link"
{
    Caption = 'Cashier Link';
    DataClassification = CustomerContent;
    // //DrillDownPageID = UnknownPage50121;
    // //LookupPageID = UnknownPage50121;

    fields
    {
        field(1; UserID; Code[20])
        {
            NotBlank = true;
            Caption = 'UserID';
            //TableRelation = Table2000000002.Field1;
        }
        field(2; "Bank Account No"; Code[20])
        {
            TableRelation = "Bank Account"."No.";
            Caption = 'Bank Account No';
        }
        field(3; "Branch Code"; Code[20])
        {
            TableRelation = "Dimension Value".Code where("Dimension Code" = const('BRANCHES'));
            Caption = 'Branch Code';
        }
    }

    keys
    {
        key(Key1; UserID)
        {
            Clustered = true;
        }
    }

    fieldgroups { }
}
