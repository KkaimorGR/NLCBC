
table 52194044 "Committee Type"
{
    Caption = 'Committee Type';
    DataClassification = CustomerContent;
    fields
    {
        field(1; "Code"; Code[30])
        {
            Caption = 'Code';
        }
        field(2; "Functional Classification"; Option)
        {
            OptionCaption = ',Core Mandate,Finance,Procurement,Human Resource,ICT,Legal,Risk & Audit,Other';
            OptionMembers = ,"Core Mandate",Finance,Procurement,"Human Resource",ICT,Legal,"Risk & Audit",Other;
            Caption = 'Functional Classification';
        }
        field(3; Description; Text[50])
        {
            Caption = 'Description';
        }
        field(4; "Title of Appointing Officer"; Code[30])
        {
            Caption = 'Title of Appointing Officer';
            //TableRelation = "Company Positions";
        }
        field(5; "Non-Staff Allowed"; Boolean)
        {
            Caption = 'Non-Staff Allowed';
        }
        field(6; "Minimim No. of Members"; Integer)
        {
            Caption = 'Minimim No. of Members';
        }
        field(7; "No. of Appointments Made"; Integer)
        {
            Caption = 'No. of Appointments Made';
        }
        field(8; Blocked; Boolean)
        {
            Caption = 'Blocked';
        }
    }

    keys
    {
        key(Key1; "Code")
        {
            Clustered = true;
        }
    }

    fieldgroups { }
}

