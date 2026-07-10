
table 52193992 "Overtime lines"
{
    Caption = 'Overtime lines';
    DataClassification = CustomerContent;
    fields
    {
        field(1; "EmpNo."; Code[10])
        {
            Caption = 'EmpNo.';
        }
        field(2; Day; Date)
        {
            Caption = 'Day';
        }
        field(3; "Start Time"; Time)
        {
            Caption = 'Start Time';
            trigger OnValidate()
            begin

                TestField(Day);
                TestField("Overtime Type");

                if ("End Time" <> 0T) and ("Start Time" <> 0T) then
                    value := ("End Time" - "Start Time");

                if value <> 0 then
                    Hours := value / 3600000;
                Validate("Overtime Type");
            end;
        }
        field(4; "End Time"; Time)
        {
            Caption = 'End Time';
            trigger OnValidate()
            begin

                TestField(Day);
                TestField("Overtime Type");

                if "End Time" < "Start Time" then
                    Error('End Time can not be less than the start time enter right time');

                if "End Time" = "Start Time" then
                    Error('Time to can not beequal to time from enter right time');
                if ("End Time" <> 0T) and ("Start Time" <> 0T) then
                    value := "End Time" - "Start Time";
                if value <> 0 then
                    Hours := value / 3600000;
                Validate("Overtime Type");
            end;
        }
        field(5; "Work Done"; Text[150])
        {
            Caption = 'Work Done';
        }
        field(6; "Application Code"; Code[10])
        {
            Caption = 'Application Code';
        }
        field(13; "Overtime Type"; Code[20])
        {
            Caption = 'Overtime Type';

        }
        field(14; Hours; Decimal)
        {
            Caption = 'Hours';
        }
        field(15; "Overtime Rate"; Decimal)
        {
            Caption = 'Overtime Rate';
        }
        field(16; "Overtime Amount"; Decimal)
        {
            Caption = 'Overtime Amount';
        }
        field(17; "Employee Basic Pay"; Decimal)
        {
            Caption = 'Employee Basic Pay';
            //TableRelation = Employee.Basic where ("No."=field("EmpNo."));
        }
    }

    keys
    {
        key(Key1; "Application Code", "EmpNo.", Day, "Start Time")
        {
            Clustered = true;
        }
    }

    fieldgroups { }

    var
        Overtim: Record "Overtime Header";
        OvertimD: Record "Overtime lines";
        value: Decimal;
        //TypeRates: Record "Overtime Type Rates";
        //AssMatrixX: Record "Assignment Matrix-X";
        HRSetup: Record "Human Resources Setup";
}

