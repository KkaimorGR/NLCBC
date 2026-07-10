
table 52193988 "Scale Benefits"
{
    Caption = 'Scale Benefits';
    DataClassification = CustomerContent;
    fields
    {
        field(1; "Salary Scale"; Code[10])
        {
            TableRelation = "Salary Scales";
            Caption = 'Salary Scale';
        }
        field(2; "Salary Pointer"; Code[10])
        {
            TableRelation = "Salary Pointers"."Salary Pointer";
            Caption = 'Salary Pointer';
        }
        field(3; "ED Code"; Code[10])
        {
            NotBlank = true;
            TableRelation = "PR Transaction Codes";
            Caption = 'ED Code';
            trigger OnValidate()
            begin
                if EarningRec.Get("ED Code") then
                    "ED Description" := EarningRec."Transaction Name";
            end;
        }
        field(4; Amount; Decimal)
        {
            Caption = 'Amount';
        }
        field(5; "ED Description"; Text[30])
        {
            Caption = 'ED Description';
        }
        field(6; "G/L Account"; Code[20])
        {
            Caption = 'G/L Account';
        }
        field(7; "Basic Salary"; Boolean)
        {
            Caption = 'Basic Salary';
        }
        field(8; Percentage; Decimal)
        {
            Caption = 'Percentage';
            trigger OnValidate()
            var
                Pointer: Record "Salary Pointers";
            begin
                if "Based On" = "Based On"::Percentage then begin
                    Pointer.Get("Salary Scale", "Salary Pointer");
                    Amount := Pointer."Gross Pay" * Percentage / 100;
                end;
            end;
        }
        field(9; "Based On"; Option)
        {
            OptionMembers = Amount,Percentage;
            OptionCaption = 'Flat Amount,Percentage of Gross';
            Caption = 'Based On';
        }

    }

    keys
    {
        key(Key1; "Salary Scale", "Salary Pointer", "ED Code")
        {
            Clustered = true;
        }
    }

    fieldgroups { }

    var
        EarningRec: Record "PR Transaction Codes";
}

