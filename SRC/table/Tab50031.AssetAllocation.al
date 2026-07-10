table 50031 "Asset Allocation"
{
    Caption = 'Asset Allocation';
    DataClassification = ToBeClassified;
    DrillDownPageId = "Fixed Asset Allocation";
    LookupPageId = "Fixed Asset Allocation";


    fields
    {
        field(1; "Entry No."; Integer)
        {
            Caption = 'Entry No.';
            AutoIncrement = true;
        }
        field(2; "Asset No."; Code[20])
        {
            Caption = 'Asset No.';
            TableRelation = "Fixed Asset";
            trigger onvalidate()
            var
                FixedAsset: Record "Fixed Asset";
            begin
                FixedAsset.Reset();
                FixedAsset.SetRange("No.", "Asset No.");
                if FixedAsset.FindFirst() then begin
                    Description := FixedAsset."Make/Model";
                    FixedAsset.CalcFields("FA Q in Store");
                    "Quantity in Store" := FixedAsset."FA Q in Store";

                end;
                "Document No." := "Asset No." + '-' + Format("Entry No.");
            end;

        }
        field(3; Description; Text[100])
        {
            Caption = 'Description';
            Editable = false;
        }
        field(4; Quantity; Integer)
        {
            Caption = 'Quantity';
            trigger OnValidate()

            begin
                if Quantity > "Quantity in Store" then
                    Error('The Allocated Quantity canot be greater than what is in store');
            end;
        }
        field(5; Department; Code[50])
        {
            TableRelation = "Responsibility Center BR NEW".Code;
        }
        field(6; Status; Option)
        {
            OptionMembers = Open,"Pending Approval",Approved,Rejected;
        }
        field(7; "Document No."; Code[100])
        {
            DataClassification = ToBeClassified;
        }
        field(8; "Quantity in Store"; Decimal)
        {
            DataClassification = ToBeClassified;
        }

    }
    keys
    {
        key(PK; "Entry No.")
        {
            Clustered = true;
        }
    }
}
