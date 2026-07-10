
table 52193538 "HR OSSafety Checklist"
{
    Caption = 'HR OSSafety Checklist';
    DataClassification = CustomerContent;
    fields
    {
        field(1; SafetyNo; Code[10])
        {
            Caption = 'SafetyNo';
        }
        field(2; "Safety Rules"; Text[200])
        {
            Caption = 'Safety Rules';
        }
        field(3; Observed; Boolean)
        {
            Caption = 'Observed';
            trigger OnValidate()
            begin
                if (Observed = true) and ("Not Observed" = true) then
                    Error('Both Option CANNOT apply');
            end;
        }
        field(4; "Not Observed"; Boolean)
        {
            Caption = 'Not Observed';
            trigger OnValidate()
            begin
                if (Observed = true) and ("Not Observed" = true) then
                    Error('Both Option CANNOT apply');
            end;
        }
        field(5; "Accident No"; Code[10])
        {
            Caption = 'Accident No';
        }
        field(6; "Incident No"; Code[10])
        {
            TableRelation = "HR OSIncident"."Incident No";
            Caption = 'Incident No';
        }
        field(7; "Observation Made"; Text[200])
        {
            Caption = 'Observation Made';
        }
    }

    keys
    {
        key(Key1; SafetyNo, "Incident No")
        {
            Clustered = true;
        }
    }

    fieldgroups { }
}
