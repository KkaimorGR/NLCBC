
table 52193946 DMS
{
    Caption = 'DMS';
    DataClassification = CustomerContent;
    fields
    {
        field(1; "DMS Link Type"; Option)
        {
            OptionMembers = " ","Staff File","Job Card","Emp Req","Job App",Leave,Transport,Training,Appraisal,Disciplinary,"Exit",Payroll,succeed;
            Caption = 'DMS Link Type';
        }
        field(2; "DMS Link Path"; Text[250])
        {
            Caption = 'DMS Link Path';
        }
    }

    keys
    {
        key(Key1; "DMS Link Type")
        {
            Clustered = true;
        }
    }

    fieldgroups { }
}
