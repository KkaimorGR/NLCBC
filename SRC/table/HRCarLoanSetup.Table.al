
table 52193930 "HR Car Loan Setup"
{
    Caption = 'HR Car Loan Setup';
    DataClassification = CustomerContent;
    fields
    {
        field(1; "code"; Code[10])
        {
            Caption = 'code';
        }
        field(2; "Loan type"; Text[50])
        {
            TableRelation = "HR Staff Loan Types".Code;
            Caption = 'Loan type';
        }
        field(3; New; Boolean)
        {
            Caption = 'New';
        }
        field(4; Installments; Integer)
        {
            Caption = 'Installments';
        }
    }

    keys
    {
        key(Key1; "code")
        {
            Clustered = true;
        }
    }

    fieldgroups { }
}
