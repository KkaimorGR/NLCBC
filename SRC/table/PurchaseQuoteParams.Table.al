
table 52193744 "Purchase Quote Params"
{
    Caption = 'Purchase Quote Params';
    DataClassification = CustomerContent;
    fields
    {
        field(1; "Document Type"; Option)
        {
            OptionCaption = 'Quotation Request,Open Tender,Restricted Tender';
            OptionMembers = "Quotation Request","Open Tender","Restricted Tender";
            Caption = 'Document Type';
        }
        field(2; "Document No."; Code[20])
        {
            Caption = 'Document No.';
        }
        field(3; Specification; Code[20])
        {
            TableRelation = "Quote Specifications".Code;
            Caption = 'Specification';
            trigger OnValidate()
            begin
                Spec.Reset();
                Spec.SetRange(Spec.Code, Specification);
                if Spec.FindFirst() then
                    Description := Spec.Description;
            end;
        }
        field(4; Description; Text[60])
        {
            Caption = 'Description';
        }
        field(5; "Line No."; Integer)
        {
            AutoIncrement = false;
            Caption = 'Line No.';
        }
        field(6; Value; Decimal)
        {
            Caption = 'Value';
        }
    }

    keys
    {
        key(Key1; "Document Type", "Document No.", Specification, "Line No.")
        {
            Clustered = true;
        }
    }

    fieldgroups { }

    var
        Spec: Record "Quote Specifications";
}
