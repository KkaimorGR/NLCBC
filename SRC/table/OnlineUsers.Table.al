
table 52193636 "Online Users"
{
    Caption = 'Online Users';
    DataClassification = CustomerContent;
    fields
    {
        field(1; "User Name"; Code[50])
        {
            Editable = true;
            NotBlank = true;
            TableRelation = "HR Employees"."No.";
            Caption = 'User Name';
            trigger OnValidate()
            var
                myInt: Integer;
                HrEmployee: Record "HR Employees";
            begin
                HrEmployee.Reset();
                HrEmployee.SetRange("No.", Rec."User Name");
                if HrEmployee.FindFirst() then begin
                    rec.Email := HrEmployee."Company E-Mail";
                end;

            end;
        }
        field(2; Password; Text[50])
        {
            Editable = true;
            NotBlank = true;
            Caption = 'Password';
        }
        field(3; Email; Text[250])
        {
            Editable = true;
            NotBlank = true;
            Caption = 'Email';
        }
        field(4; "Date Created"; DateTime)
        {
            Editable = true;
            NotBlank = true;
            Caption = 'Date Created';
        }
        field(5; "Changed Password"; Boolean)
        {
            Editable = true;
            Caption = 'Changed Password';
        }
        field(6; "Number Of Logins"; Integer)
        {
            Editable = false;
            Caption = 'Number Of Logins';
        }
        field(7; "Line No"; Integer)
        {
            AutoIncrement = true;
            Editable = false;
            Caption = 'Line No';
        }
        field(8; "User Image"; Text[20])
        {
            Editable = false;
            Caption = 'User Image';
        }
        field(9; Password2; Text[250])
        {
            Caption = 'Password2';
        }
    }

    keys
    {
        key(Key1; "User Name")
        {
            Clustered = true;
        }
    }

    fieldgroups { }
}
