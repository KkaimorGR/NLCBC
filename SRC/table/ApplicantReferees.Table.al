
table 52193648 "Applicant Referees"
{
    Caption = 'Applicant Referees';
    DataClassification = CustomerContent;
    fields
    {
        field(10; ID; Integer)
        {
            AutoIncrement = true;
            Caption = 'ID';
        }
        field(20; ApplicantNo; Integer)
        {
            Caption = 'ApplicantNo';
        }
        field(30; FullName; Text[200])
        {
            Caption = 'FullName';
        }
        field(40; Address; Text[200])
        {
            Caption = 'Address';
        }
        field(50; Email; Text[200])
        {
            Caption = 'Email';
        }
        field(60; MobileNo; Text[30])
        {
            Caption = 'MobileNo';
        }
        field(70; Occupation; Text[200])
        {
            Caption = 'Occupation';
        }
        field(80; ReferenceType; Text[50])
        {
            Caption = 'ReferenceType';
        }
        field(90; Company; Text[150])
        {
            Caption = 'Company';
        }
        field(91; Designation; Text[150])
        {
            Caption = 'Designation';
        }
    }

    keys
    {
        key(Key1; ID)
        {
            Clustered = true;
        }
    }

    fieldgroups { }
}
