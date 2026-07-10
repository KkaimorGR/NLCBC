
Table 52194138 "Benefit Package"
{

    fields
    {
        field(1; "Package ID"; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(2; Description; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(3; "Primary Objective"; Text[400])
        {
            DataClassification = ToBeClassified;
        }
        field(4; "Benefit Program ID"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Benefit Program";
        }
        field(5; "Benefit Category"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Other Incentives,Social Security,Health Care,Retirement Plans,Insurance Plans,Mortgage,Other Staff Loans,Staff Housing,Staff Leave,Learning and Skill Development,Recreational';
            OptionMembers = "Other Incentives","Social Security","Health Care","Retirement Plans","Insurance Plans",Mortgage,"Other Staff Loans","Staff Housing","Staff Leave","Learning and Skill Development",Recreational;
        }
        field(6; "Beneficiary Type"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Employee Only,Employee+Spouse,Employee+Spouse+Other Dependents';
            OptionMembers = "Employee Only","Employee+Spouse","Employee+Spouse+Other Dependents";
        }
        field(7; "Statutory Requirement"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(8; "Applicable to all Staff"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(9; "Applicable to Retired Staff"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(10; "Enrollment Type"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Company Enrollment,Employee Application';
            OptionMembers = " ","Company Enrollment","Employee Application";
        }
        field(11; "Effective Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(12; "Company Policy ID"; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(13; "Renewal Frequency"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'None,Month,Quarter,Half-Year,Annual';
            OptionMembers = "None",Month,Quarter,"Half-Year",Annual;
        }
        field(14; "No. of Renewals"; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(15; "Last Renewal Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(16; "Min Eligibe Age(Yrs)"; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(17; "Max Eligibe Age(Yrs)"; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(18; "Min Length of Service(Yrs)"; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(19; "Max Waiting Period for Enroll"; DateFormula)
        {
            DataClassification = ToBeClassified;
        }
        field(20; Blocked; Boolean)
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1; "Package ID")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

