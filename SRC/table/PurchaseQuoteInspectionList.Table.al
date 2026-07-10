
table 52193953 "Purchase Quote Inspection List"
{
    Caption = 'Purchase Quote Inspection List';
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
        field(3; Description; Text[50])
        {
            Caption = 'Description';
        }
        field(4; Specification; Code[20])
        {
            Caption = 'Specification';
            //TableRelation = Table39006176.Field1;

            trigger OnValidate()
            begin

                Spec.Reset();
                Spec.SetRange(Spec.Code, Specification);
                if Spec.FindFirst() then
                    Description := Spec.Description;
            end;
        }
        field(5; "Line No."; Integer)
        {
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
