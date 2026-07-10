
table 52193981 "Permission Set For Roles"
{
    // SauravNavRP.NAVW17.01 #Saurav Dhyani #07-05-2015
    //   # Copy of Standard Table 2000000004

    Caption = 'Permission Set For Roles';
    DataCaptionFields = "Role ID", Name;
    DataPerCompany = false;
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Role ID"; Code[20])
        {
            Caption = 'Role ID';
        }
        field(2; Name; Text[30])
        {
            Caption = 'Name';
        }
    }

    keys
    {
        key(Key1; "Role ID")
        {
            Clustered = true;
        }
    }

    fieldgroups { }
}
