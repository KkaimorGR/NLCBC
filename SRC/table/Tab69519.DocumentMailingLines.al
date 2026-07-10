
Table 52194018 "Document Mailing Lines"
{

    fields
    {
        field(1; "Report No."; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(2; "Employee No"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = Employee;

            trigger OnValidate()
            begin
                if Employee.Get("Employee No") then begin
                    "Employee Name" := Employee.FullName;
                    "E-Mail Address" := Employee."E-Mail";
                end;
            end;
        }
        field(3; "Employee Name"; Text[100])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(4; "E-Mail Address"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(5; "Mailing Format"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'PDF,Word,Excel';
            OptionMembers = PDF,Word,Excel;
        }
    }

    keys
    {
        key(Key1; "Report No.", "Employee No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        Employee: Record Employee;
}

