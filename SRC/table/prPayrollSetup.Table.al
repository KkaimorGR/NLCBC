
table 52193628 "prPayroll Setup"
{
    Caption = 'prPayroll Setup';
    DataClassification = CustomerContent;
    fields
    {
        field(1; "Primary Key"; Code[20])
        {
            Caption = 'Primary Key';
        }
        field(2; "Salary Review Nos."; Code[20])
        {
            TableRelation = "No. Series".Code;
            Caption = 'Salary Review Nos.';
        }
        field(3; "Salary Advance Nos."; Code[20])
        {
            TableRelation = "No. Series".Code;
            Caption = 'Salary Advance Nos.';
        }
        field(4; "Mortgage Nos."; Code[20])
        {
            TableRelation = "No. Series".Code;
            Caption = 'Mortgage Nos.';
        }
        field(5; "Car Loan Nos."; Code[20])
        {
            TableRelation = "No. Series".Code;
            Caption = 'Car Loan Nos.';
        }
        field(6; "Gratuity Approval Nos."; Code[20])
        {
            TableRelation = "No. Series".Code;
            Caption = 'Gratuity Approval Nos.';
        }
        field(7; "Bonus Recommendation Nos."; Code[20])
        {
            TableRelation = "No. Series".Code;
            Caption = 'Bonus Recommendation Nos.';
        }
        field(8; "Employee Change Nos"; Code[20])
        {
            TableRelation = "No. Series".Code;
            Caption = 'Employee Change Nos';
        }
        field(9; "Allowances Nos"; Code[20])
        {
            TableRelation = "No. Series".Code;
            Caption = 'Allowances Nos';
        }
        field(10; "Deductions Nos"; Code[20])
        {
            TableRelation = "No. Series".Code;
            Caption = 'Deductions Nos';
        }
        field(11; "S.H.A"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(12; "Pension Arreas"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(13; "Employer PIN"; Code[40])
        {
            DataClassification = ToBeClassified;
        }
        field(14; "Payroll Email Contact"; Text[200])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1; "Primary Key")
        {
            Clustered = true;
        }
    }

    fieldgroups { }
}
