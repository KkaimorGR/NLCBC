
Table 52194030 "Terms of Service"
{
    // DrillDownPageID = "Terms of Service";
    // LookupPageID = "Terms of Service";

    fields
    {
        field(1; "Code"; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(2; "Employment Type"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Permanent,Contract,Casual,Secondment,Internship,Attachment,Volunteer,Probation,Probational Extension';
            OptionMembers = Permanent,Contract,Casual,Secondment,Internship,Attachment,Volunteer,Probation,"Probational Extension";
        }
        field(3; Description; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(4; "Contract Term Period"; DateFormula)
        {
            DataClassification = ToBeClassified;
        }
        field(5; "Maximum No. of Terms"; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(6; "Maximum Employment Age (Years)"; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(7; "Linked to Projects"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(8; "Pension Benefit"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(9; "Service Gratuity Benefit"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(10; "No. of Positions"; Integer)
        {
            CalcFormula = count("Company Positions" where("Default Terms of Service" = field(Code)));
            Editable = false;
            FieldClass = FlowField;
        }
        field(11; "No. of Active Employees"; Integer)
        {
            CalcFormula = count(Employee);
            Editable = false;
            FieldClass = FlowField;
        }
        field(12; "Minumum Employment Age (Years)"; Integer)
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1; "Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

