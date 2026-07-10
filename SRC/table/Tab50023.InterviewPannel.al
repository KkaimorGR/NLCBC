table 52193446 "Interview Pannel"
{
    Caption = 'Interview Pannel';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Entry No"; Integer)
        {
            Caption = 'Entry No';
            AutoIncrement = true;
            Editable = false;
        }
        field(2; "Staff No"; Code[200])
        {
            Caption = 'Staff No';
            TableRelation = "HR Employees"."No.";
            trigger OnValidate()
            var
                myInt: Integer;
                HrEmployees: Record "HR Employees";
                Requestision: Record "HR Employee Requisitions";
                PanelRec: Record "Interview Pannel";
            begin
                HrEmployees.Reset();
                HrEmployees.SetRange("No.", Rec."Staff No");
                if HrEmployees.Find('-') then begin
                    rec."Staff Name" := HrEmployees."Full Name";
                    rec."Company Mail" := HrEmployees."Company E-Mail";
                end;
                Requestision.Reset();
                Requestision.SetRange("Requisition No.", Rec."Requisition No");
                if Requestision.Find('-') then begin
                    rec."JOb ID" := Requestision."Job ID";
                    // PanelRec.Reset();
                    // PanelRec.SetRange("Requisition No", rec."Requisition No");
                    // if PanelRec.Find('-') then begin
                    //     PanelRec."JOb ID" := Requestision."Job ID";
                    //     PanelRec.Modify();
                    // end;
                end;

            end;
        }
        field(3; "Staff Name"; Text[200])
        {
            Caption = 'Staff Name';
            Editable = false;
        }
        field(4; "JOb ID"; Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(5; "Requisition No"; Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(6; "Company Mail"; Text[200])
        {
            DataClassification = ToBeClassified;
        }
        field(7; "Roles"; Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = Member,Secretary,Chairperson;
        }
        field(8; "Shortlisting Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
    }
    keys
    {
        key(PK; "Entry No", "Requisition No")
        {
            Clustered = true;
        }
    }
}
