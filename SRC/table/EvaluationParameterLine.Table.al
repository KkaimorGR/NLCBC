
table 52193879 "Evaluation Parameter Line"
{
    Caption = 'Evaluation Parameter Line';
    DataClassification = CustomerContent;
    fields
    {
        field(1; "Code"; Code[20])
        {
            Caption = 'Code';
        }
        field(2; "Overall Comment"; Text[50])
        {
            Caption = 'Overall Comment';
        }
        field(3; "Line No."; Integer)
        {
            AutoIncrement = true;
            Caption = 'Line No.';
        }
        field(4; "Parameter Code"; Code[10])
        {
            Editable = false;
            Caption = 'Parameter Code';
        }
        field(5; "Min. Score"; Decimal)
        {
            Editable = false;
            Caption = 'Min. Score';
        }
        field(6; "Max. Score"; Decimal)
        {
            Editable = false;
            Caption = 'Max. Score';
        }
        field(7; "Vendor No"; Code[20])
        {
            TableRelation = Vendor."No.";
            Caption = 'Vendor No';
            trigger OnValidate()
            begin
                Vend.Reset();
                Vend.SetRange(Vend."No.", "Vendor No");
                if Vend.Find('-') then
                    "Vendor Name" := Vend.Name;
            end;
        }
        field(8; "Vendor Name"; Text[100])
        {
            Caption = 'Vendor Name';
        }
        field(9; "Evaluation Year"; Code[50])
        {
            Caption = 'Evaluation Year';
        }
        field(10; "Actuals Scores"; Decimal)
        {
            Caption = 'Actuals Scores';
        }
        field(11; Comment; Text[100])
        {
            Caption = 'Comment';
        }
    }

    keys
    {
        key(Key1; "Code", "Line No.")
        {
            Clustered = true;
        }
    }

    fieldgroups { }

    var
        Vend: Record Vendor;
}
