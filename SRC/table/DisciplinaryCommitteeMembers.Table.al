
table 52194006 "Disciplinary Committee Members"
{
    Caption = 'Disciplinary Committee Members';
    DataClassification = CustomerContent;
    fields
    {
        field(1; "Commitee Code"; Code[20])
        {
            NotBlank = true;
            Caption = 'Code';
        }
        field(2; "Employee No"; Code[30])
        {
            NotBlank = true;
            TableRelation = "HR Employees"."No.";
            Caption = 'Employee No.';
            trigger OnValidate()
            var
                Committeerec: Record "HR Disciplinary Cases NCA";
            begin
                Board.Reset();
                Board.SetRange("No.", rec."Employee No");
                if Board.FindSet() then begin
                    Names := Board."First Name" + ' ' + Board."Middle Name" + ' ' + Board."Last Name";
                    Designation := Board."Job Title";
                    Email := Board."Company E-Mail";
                    "Phone Number" := Board."Cell Phone Number";
                    Address := Board."Postal Address";
                end;
                Committeerec.Reset();
                Committeerec.SetRange("Document No.", rec."Commitee Code");
                Committeerec.SetRange("Accused Employee", rec."Employee No");
                if Committeerec.Find('-') then
                    Error('Accussed employee cannot be part of the committee');

            end;
        }
        field(4; Names; Text[250])
        {
            Editable = false;
            Caption = 'Full Name';
        }
        field(5; Designation; Text[250])
        {
            Caption = 'Designation';
            Editable = false;
        }
        field(6; Remarks; Text[200])
        {
            Caption = 'Remarks';
        }
        field(7; Role; Option)
        {
            OptionCaption = ' ,Chairman,Secretary,Member,Consultant';
            OptionMembers = " ",Chairman,Secretary,Member,Consultant;
            Caption = 'Role';
        }
        field(10; Email; Text[200])
        {
            Caption = 'Email';
        }
        field(11; "Phone Number"; Code[30])
        {
            Caption = 'Phone Number';
        }
        field(12; Address; Code[200])
        {
            Caption = 'Address';
        }
    }

    keys
    {
        key(Key1; "Commitee Code", "Employee No")
        {
            Clustered = true;
        }
    }

    fieldgroups { }
    trigger OnDelete()
    var
        myInt: Integer;
        TransferReac: Record "HR Disciplinary Cases NCA";
    begin
        TransferReac.Reset();
        TransferReac.SetRange("Document No.", Rec."Commitee Code");
        if TransferReac.FindFirst() then
            if (TransferReac."Disciplinary Stage Status" <> TransferReac."Disciplinary Stage Status"::Reported) and (TransferReac."Disciplinary Stage Status" <> TransferReac."Disciplinary Stage Status"::" ") then
                Error('Commitee members cannot be deleteted at this stage');


    end;

    var
        Board: Record "HR Employees";
        Directors: Record Vendor;
}

