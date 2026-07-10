table 50029 "Returned /Rejected Goods"
{
    Caption = 'Returned /Rejected Goods';
    DataClassification = ToBeClassified;
    DrillDownPageId = "Retuened/Rejected List";
    LookupPageId = "Retuened/Rejected List";

    fields
    {
        field(1; "No."; Code[40])
        {
            Caption = 'No.';
            Editable = false;
            trigger OnValidate()
            var
                myInt: Integer;
            begin
                if "No." <> xRec."No." then begin
                    GenLedgerSetup.Get();
                    NoSeriesMgt.TestManual(GenLedgerSetup."Returned No");
                    "No. Series" := '';
                end;

            end;
        }
        field(2; "Staff No."; Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = "HR Employees"."No.";
            Editable = false;

        }
        field(3; "Staff Name"; Text[100])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(4; "Responsibility Center"; Code[10])
        {
            TableRelation = "Responsibility Center BR NEW".Code;
            Caption = 'Department';
            Editable = false;
            trigger OnValidate()
            var
                myInt: Integer;
                Responsblece: Record "Responsibility Center BR NEW";
            begin
                Responsblece.Reset();
                Responsblece.SetRange(Code, Rec."Responsibility Center");
                if Responsblece.FindFirst() then
                    "Department Name" := Responsblece.Name;

            end;

        }
        field(5; "Department Name"; Text[100])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(6; "Global Dimension 1 Code"; Code[40])
        {
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(1));
            Caption = 'Workstation';
            Editable = false;
            trigger OnValidate()
            var
                myInt: Integer;
                Dimensi: Record "Dimension Value";
            begin
                Dimensi.Reset();
                Dimensi.SetRange(Code, rec."Global Dimension 1 Code");
                if Dimensi.FindFirst() then
                    rec."County Name" := Dimensi.Name;
            end;
        }
        field(7; "County Name"; Text[100])
        {
            DataClassification = ToBeClassified;
            Editable = false;
            Caption = 'Work station Name';
        }
        field(8; "Item No"; Code[40])
        {
            DataClassification = ToBeClassified;
            TableRelation = Item."No.";
            trigger OnValidate()
            var
                myInt: Integer;
                ItemRec: Record Item;
                TInventory: Decimal;
            begin
                ItemRec.Reset();
                ItemRec.SetRange("No.", rec."Item No");
                if ItemRec.Find('-') then begin
                    ItemRec.CalcFields(Inventory);
                    "Total Inventory" := ItemRec.Inventory;
                    rec."Item Description" := ItemRec.Description;
                end;

            end;
        }
        field(9; "Item Description"; Text[300])
        {
            DataClassification = ToBeClassified;
        }
        field(10; "Total Inventory"; Decimal)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(11; "Quantity Return/Rejected"; Decimal)
        {
            DataClassification = ToBeClassified;
            trigger OnValidate()
            var
                UserSetUp: Record "User Setup";
                EmployeeRec: Record "HR Employees";
            begin
                UserSetUp.Reset();
                UserSetUp.SetRange("User ID", UserId);
                if UserSetUp.FindFirst() then begin
                    "Staff No." := UserSetUp."Employee No.";
                end;

                EmployeeRec.Reset();
                EmployeeRec.SetRange("No.", rec."Staff No.");
                if EmployeeRec.Find('-') then begin
                    rec."Staff Name" := EmployeeRec."Full Name";
                    rec."Global Dimension 1 Code" := EmployeeRec."Global Dimension 1 Code";
                    rec.Validate(rec."Global Dimension 1 Code");
                    rec."Responsibility Center" := EmployeeRec."Responsibility Center";
                    rec.Validate(rec."Responsibility Center");
                    rec."Date captured" := Today;
                end;

            end;
        }
        field(12; "No. Series"; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(13; "Date captured"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(14; "Reason for Return"; Text[150])
        {
            DataClassification = ToBeClassified;
        }
        field(15; Status; Option)
        {
            OptionMembers = Open,"Pending Approval",Approved,Cancelled,Rejected;
            // trigger OnValidate()
            // var
            //     ItemRec: Record Item;
            // begin
            //     if Status = Status::Approved then begin
            //         ItemRec.Reset();
            //         ItemRec.SetRange("No.", "Item No");
            //         IF ItemRec.Find('-') then begin
            //             if (ItemRec."Qty. Returned" <> 0) then
            //                 ItemRec."Qty. Returned" := ItemRec."Qty. Returned" + "Quantity Return/Rejected"
            //             else
            //                 ItemRec."Qty. Returned" := "Quantity Return/Rejected";
            //             ItemRec.Modify();
            //         end;
            //     end;

            // end;
        }

    }
    keys
    {
        key(PK; "No.")
        {
            Clustered = true;
        }
    }
    trigger OnInsert()
    begin
        if "No." = '' then begin
            GenLedgerSetup.Get;
            GenLedgerSetup.TestField("Returned No");
            NoSeriesMgt.InitSeries(GenLedgerSetup."Returned No", xRec."No.", 0D, "No.", "No. Series");
        end;

    end;

    var
        GenLedgerSetup: Record "Purchases & Payables Setup";
        NoSeriesMgt: Codeunit NoSeriesManagement;
}
