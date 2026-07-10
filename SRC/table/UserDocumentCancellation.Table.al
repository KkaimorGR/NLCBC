
table 52193715 "User Document Cancellation"
{
    Caption = 'User Document Cancellation';
    DataClassification = CustomerContent;
    fields
    {
        field(1; "Document Area"; Option)
        {
            NotBlank = true;
            OptionMembers = " ",Purchase,Sale,Transfers;
            Caption = 'Document Area';
        }
        field(2; "Document Type"; Option)
        {
            NotBlank = true;
            OptionMembers = " ","Order",Invoice,"Cash Sale","Credit Memo","Return Order","Transfer Order";
            Caption = 'Document Type';
        }
    }

    keys
    {
        key(Key1; "Document Area", "Document Type")
        {
            Clustered = true;
        }
    }

    fieldgroups { }
}
