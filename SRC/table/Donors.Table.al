
table 52193813 Donors
{
    Caption = 'Donors';
    DataClassification = CustomerContent;
    //DrillDownPageID = UnknownPage39004433;
    //LookupPageID = UnknownPage39004433;

    fields
    {
        field(1; "Code"; Code[20])
        {
            NotBlank = true;
            Caption = 'Code';
            trigger OnValidate()
            begin
                DimVal.Reset();
                DimVal.SetRange(DimVal."Global Dimension No.", 1);
                DimVal.SetRange(DimVal.Code, Code);
                if DimVal.Find('-') then
                    "Donor Name" := DimVal.Name;
            end;
        }
        field(2; "Donor Name"; Text[100])
        {
            Caption = 'Donor Name';
        }
        field(3; Address; Text[250])
        {
            Caption = 'Address';
        }
        field(4; "Telephone No."; Text[30])
        {
            Caption = 'Telephone No.';
        }
        field(5; Email; Text[30])
        {
            Caption = 'Email';
        }
        field(6; "Contact Person"; Text[30])
        {
            Caption = 'Contact Person';
        }
        field(7; "Donor No."; Code[10])
        {
            TableRelation = Customer."Customer Posting Group" where("Customer Posting Group" = filter('FUND'));
            Caption = 'Donor No.';
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

    var
        Cust: Record Customer;
        DimVal: Record "Dimension Value";
}
