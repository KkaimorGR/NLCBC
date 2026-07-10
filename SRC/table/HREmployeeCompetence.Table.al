
table 52193943 "HR Employee Competence"
{
    Caption = 'HR Employee Competence';
    DataClassification = CustomerContent;
    fields
    {
        field(1; "Competence Code"; Code[20])
        {
            TableRelation = "HR Lookup Values".Code where(Type = filter(Competency));
            Caption = 'Competence Code';
            trigger OnValidate()
            begin
                HRlookup.Reset();
                HRlookup.SetRange(HRlookup.Code, "Competence Code");
                if HRlookup.Find('-') then
                    Description := HRlookup.Description;
            end;
        }
        field(2; "Employee No"; Code[50])
        {
            Caption = 'Employee No';
        }
        field(3; Description; Text[100])
        {
            Caption = 'Description';
        }
        field(4; "Competency Score"; Decimal)
        {
            Caption = 'Competency Score';
        }
        field(5; "Line No"; Integer)
        {
            Caption = 'Line No';
        }
    }

    keys
    {
        key(Key1; "Competence Code", "Employee No")
        {
            Clustered = true;
        }
    }

    fieldgroups { }

    var
        HRlookup: Record "HR Lookup Values";
}
