
table 52193621 "prSalary Review Lines"
{
    Caption = 'prSalary Review Lines';
    DataClassification = CustomerContent;
    fields
    {
        field(1; "Line No."; Integer)
        {
            AutoIncrement = true;
            Caption = 'Line No.';
        }
        field(2; test; Text[30])
        {
            Caption = 'test';
        }
        field(5; "Proposal No."; Code[20])
        {
            Caption = 'Proposal No.';
        }
        field(10; Type; Option)
        {
            OptionCaption = ' ,Individual,Salary Group';
            OptionMembers = " ",Individual,"Salary Group";
            Caption = 'Type';
        }
        field(15; Description; Text[100])
        {
            Caption = 'Description';
        }
        field(20; Amount; Decimal)
        {
            Caption = 'Amount';
        }
        field(25; Department; Code[20])
        {
            Caption = 'Department';
        }
        field(30; Project; Code[20])
        {
            Caption = 'Project';
        }
        field(31; "Employee No."; Code[20])
        {
            TableRelation = "HR Employees"."No.";
            Caption = 'Employee No.';
        }
        field(32; Group; Code[20])
        {
            TableRelation = "prSalary Scale".Grade;
            Caption = 'Group';
        }
    }

    keys
    {
        key(Key1; "Line No.", "Proposal No.")
        {
            Clustered = true;
        }
    }

    fieldgroups { }
}
