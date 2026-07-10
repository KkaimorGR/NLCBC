
table 52193771 "PR Employee Allowances"
{
    Caption = 'PR Employee Allowances';
    DataClassification = CustomerContent;
    fields
    {
        field(1; "Job Group"; Code[10])
        {
            TableRelation = "HR Lookup Values".Code where(Type = filter(Grade));
            Caption = 'Job Group';
        }
        field(3; "Transaction Code"; Code[10])
        {
            TableRelation = "PR Transaction Codes"."Transaction Code" where("Transaction Type" = const(Income));
            Caption = 'Transaction Code';
            trigger OnValidate()
            begin
                "Transaction Name" := '';

                PRTransCode.Reset();
                PRTransCode.SetRange(PRTransCode."Transaction Code");
                if PRTransCode.Find('-') then
                    "Transaction Name" := UpperCase(PRTransCode."Transaction Name");
            end;
        }
        field(4; "Transaction Name"; Text[100])
        {
            Editable = false;
            Caption = 'Transaction Name';
        }
        field(6; Amount; Decimal)
        {
            Caption = 'Amount';
        }
        field(7; "Global Dimension 1 Code"; Code[20])
        {
            CaptionClass = '1,1,1';
            Caption = 'Global Dimension 1 Code';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(1));

            trigger OnValidate()
            begin
                "County Desc" := '';

                DimensionValue.Reset();
                DimensionValue.SetRange(DimensionValue.Code, "Global Dimension 1 Code");
                if DimensionValue.Find('-') then
                    "County Desc" := UpperCase(DimensionValue.Name);
            end;
        }
        field(8; "Contract Type"; Code[20])
        {
            TableRelation = "HR Lookup Values".Code where(Type = filter("Contract Type"));
            Caption = 'Contract Type';
        }
        field(9; "County Desc"; Text[100])
        {
            Editable = false;
            Caption = 'County Desc';
        }
    }

    keys
    {
        key(Key1; "Job Group", "Contract Type", "Global Dimension 1 Code")
        {
            Clustered = true;
        }
    }

    fieldgroups { }

    var
        DimensionValue: Record "Dimension Value";
        PRTransCode: Record "PR Transaction Codes";
}
