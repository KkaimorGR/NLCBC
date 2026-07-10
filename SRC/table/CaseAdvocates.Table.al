
table 52194013 "Case Advocates"
{
    DrillDownPageId = "Case Advocates";
    LookupPageId = "Case Advocates";
    Caption = 'Case Advocates';
    DataClassification = CustomerContent;
    fields
    {
        field(1; "Code"; Code[50])
        {
            Caption = 'Code';
        }
        field(2; Names; Text[100])
        {
            Caption = 'Names';
        }
        field(3; Contacts; Code[255])
        {
            Caption = 'Contacts';
        }
        field(4; Email; Text[100])
        {
            Caption = 'Email';
        }
        field(5; "Firm Code"; Code[10])
        {
            TableRelation = Contact."No.";
            Caption = 'Firm Code';
            trigger OnValidate()
            begin
                contact.Reset();
                contact.SetRange("No.", "Firm Code");
                if contact.Find('-') then
                    "Firm name" := contact.Name;
            end;
        }
        field(6; "Firm name"; Text[30])
        {
            Caption = 'Firm name';
        }
        field(7; "Second name"; Text[30])
        {
            Caption = 'Second name';
        }
        field(8; Address; Code[10])
        {
            Caption = 'Address';
        }
        field(9; City; Text[30])
        {
            Caption = 'City';
        }
        field(10; "Postal Code"; Code[10])
        {
            Caption = 'Postal Code';
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
        fieldgroup(LooKUp; Names) { }
        fieldgroup(DrillDown; Contacts) { }
    }

    var
        contact: Record Contact;
}

