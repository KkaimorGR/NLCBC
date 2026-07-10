table 52193564 "Holding Lines"
{
    Caption = 'Holding Lines';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Entry No"; Integer)
        {
            Caption = 'Entry No';
            AutoIncrement = true;
            Editable = false;

        }
        field(2; "Item No"; Code[20])
        {
            Caption = 'Item No';
        }
        field(3; "Item Description"; Text[300])
        {
            Caption = 'Item Description';
        }
        field(4; "Quantiy Delivered"; Integer)
        {
            Caption = 'Quantity Delivered';
            trigger OnValidate()

            begin

            end;
        }
        field(5; "Line Cost"; Decimal)
        {
            Caption = 'Line Cost';
            trigger OnValidate()

            begin
                "Total Cost" := "Quanity Approved" * "Line Cost";
            end;
        }
        field(6; "Total Cost"; Decimal)
        {
            Caption = 'Total Cost';
        }
        field(7; "Holding No"; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(8; "Serial No"; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(9; "Quantity received"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(10; "Quantity as LPO"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(11; "Quantity  Rejected"; Decimal)
        {
            DataClassification = ToBeClassified;
            trigger OnValidate()
            var
                myInt: Integer;
            begin
                if rec."Quantity  Rejected" < 0 then
                    Error('we cannot reject negative value');

            end;
        }
        field(12; Remarks; Text[200])
        {
            DataClassification = ToBeClassified;
        }
        field(13; "Quanity Approved"; Decimal)
        {
            DataClassification = ToBeClassified;
            trigger OnValidate()
            var
                myInt: Integer;
            begin
                "Total Cost" := "Quanity Approved" * "Line Cost";

            end;
        }
        field(14; "Unit of measure"; Code[40])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Unit of Measure";
        }
        field(15; "PO Number"; Code[100])
        {
            DataClassification = ToBeClassified;

        }
        field(16; "Model"; Code[90])
        {
            DataClassification = ToBeClassified;
        }
        field(17; "Status"; Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = "Pending Inspection",Accepted,Rejected;
        }
        field(18; Closed; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(19; "Reopening Remarks"; Text[300])
        {
            DataClassification = ToBeClassified;
        }
        field(20; "Inspection Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(21; "Inspecion No"; Code[40])
        {
            DataClassification = ToBeClassified;
        }
    }
    keys
    {
        key(PK; "Entry No", "Holding No")
        {
            Clustered = true;
        }
    }
}
