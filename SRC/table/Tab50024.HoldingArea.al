table 52193447 "Holding Area"
{
    Caption = 'Holding Area';
    DataClassification = ToBeClassified;
    DrillDownPageId = "Hodling Area";
    LookupPageId = "Hodling Area";

    fields
    {
        field(1; "H Code"; Code[20])
        {
            Caption = 'No.';
            trigger OnValidate()
            var
                NewStr: Code[20];
            begin
                if "H Code" <> xRec."H Code" then begin
                    GenLedgerSetup.Get();
                    NoSeriesMgt.TestManual(GenLedgerSetup."Holding No");
                    "No. Series" := '';
                end;
            end;
        }
        field(2; "Date Captured"; Date)
        {
            Caption = 'Date Captured';
        }
        field(3; Description; Text[200])
        {
            Caption = 'Description';
        }
        field(4; "Staff No"; Code[30])
        {
            Caption = 'Staff No';
            TableRelation = "HR Employees"."No.";
            trigger OnValidate()
            var
                myInt: Integer;
                EmployeeRe: Record "HR Employees";
            begin
                EmployeeRe.Reset();
                EmployeeRe.SetRange("No.", rec."Staff No");
                if EmployeeRe.Find('-') then begin
                    rec."Staff Name" := EmployeeRe."Full Name";
                end;

            end;
        }
        field(5; "Staff Name"; Text[200])
        {
            Caption = 'Staff Name';
        }
        field(6; Department; Code[70])
        {
            Caption = 'Department';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(2));
            trigger OnValidate()
            var
                myInt: Integer;
                DimensionV: Record "Dimension Value";
            begin
                DimensionV.Reset();
                DimensionV.SetRange(Code, rec.Department);
                if DimensionV.Find('-') then
                    rec."Department Name" := DimensionV.Name;

            end;
        }
        field(7; "Department Name"; Text[200])
        {
            Caption = 'Department Name';
            Editable = false;
        }
        field(8; "No. Series"; Code[40])
        {
            DataClassification = ToBeClassified;
        }
        field(9; "Status"; Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = Open,"Pending Approval",Approved,Rejected;
            OptionCaption = 'Open,Pending Inspection,Closed,Rejected';
            trigger OnValidate()
            var
                myInt: Integer;
                ItemRec: Record Item;
                DocNo: Code[30];
                HoldingLines: Record "Holding Lines";
            begin
                if rec.Status = rec.Status::Approved then begin
                    HRSetup.Get;
                    HRSetup.TestField(HRSetup."Item Nos.");
                    HoldingLines.Reset();
                    HoldingLines.SetRange("Holding No", Rec."H Code");
                    HoldingLines.SetRange(Status, Status::Approved);
                    if HoldingLines.Find('-') then begin
                        repeat
                            DocNo := '';
                            ItemRec.Init();
                            DocNo := NoSeriesMgt.GetNextNo(HRSetup."Item Nos.", 0D, True);
                            ItemRec."No." := DocNo;
                            ItemRec."Unit Cost" := HoldingLines."Line Cost";
                            ItemRec."Base Unit of Measure" := HoldingLines."Unit of measure";
                            ItemRec.Description := HoldingLines."Item Description";
                            ItemRec.Status := ItemRec.Status::Approved;
                            ItemRec."Approved By" := UserId;
                            ItemRec."Order No" := rec."PO.No";
                            ItemRec."Last Date Modified" := Today;
                            ItemRec.Model := HoldingLines.Model;
                            ItemRec.Insert(true);
                        until HoldingLines.Next() = 0;
                    end;
                    Message('Item Created Succefully');

                end;

            end;
        }
        field(10; Suplier; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = Vendor."No.";
            trigger OnValidate()
            var
                myInt: Integer;
                VendorsRec: Record Vendor;
            begin
                VendorsRec.Reset();
                VendorsRec.SetRange("No.", rec.Suplier);
                if VendorsRec.Find('-') then begin
                    rec."Supplier Name" := VendorsRec.Name;
                end;

            end;
        }
        field(11; "Supplier Name"; Text[200])
        {
            DataClassification = ToBeClassified;
        }
        field(12; "PO.No"; Code[40])
        {
            DataClassification = ToBeClassified;
        }


    }
    keys
    {
        key(PK; "H Code")
        {
            Clustered = true;
        }
    }
    trigger OnInsert()
    var
        myInt: Integer;
        userSetup: Record "User Setup";
    begin
        if "H Code" = '' then begin
            GenLedgerSetup.Get;
            GenLedgerSetup.TestField("Holding No");
            NoSeriesMgt.InitSeries(GenLedgerSetup."Holding No", xRec."H Code", 0D, "H Code", "No. Series");
            //NoSeriesMgt.InitSeries(GenLedgerSetup."File Movement Numbers", xRec."File Movement Code", 0D, "File Movement Code", "No. Series");
        end;
        rec."Date Captured" := Today;
        if userSetup.Get(UserId) then begin
            EmployeeRe.Reset();
            EmployeeRe.SetRange(EmployeeRe."User ID", userSetup."User ID");
            if EmployeeRe.Find('-') then begin
                rec."Staff No" := EmployeeRe."No.";
                rec."Staff Name" := EmployeeRe."Full Name";
            end;

        end;

    end;

    var
        GenLedgerSetup: Record "Purchases & Payables Setup";
        NoSeriesMgt: Codeunit NoSeriesManagement;
        EmployeeRe: Record "HR Employees";
        HRSetup: Record "Inventory Setup";
}
