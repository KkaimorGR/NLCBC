
table 52193776 "PR Employees Salary Scale1"
{
    Caption = 'PR Employees Salary Scale1';
    DataClassification = CustomerContent;
    fields
    {
        field(1; Grade; Code[20])
        {
            TableRelation = "HR Lookup Values".Code where(Type = const(Grade));
            Caption = 'Grade';
        }
        field(2; "Basic Pay 1 - Minimum"; Decimal)
        {
            Caption = 'Basic Pay 1 - Minimum';
        }
        field(3; "IA to BP 2"; Decimal)
        {
            Description = 'Incremental Amount to Basic Pay 2';
            Caption = 'IA to BP 2';
            trigger OnValidate()
            begin
                "Basic Pay 2" := "Basic Pay 1 - Minimum" + "IA to BP 2";
            end;
        }
        field(4; "Basic Pay 2"; Decimal)
        {
            Caption = 'Basic Pay 2';
        }
        field(5; "IA to BP 3"; Decimal)
        {
            Caption = 'IA to BP 3';
            trigger OnValidate()
            begin
                "Basic Pay 3" := "Basic Pay 2" + "IA to BP 3";
            end;
        }
        field(6; "Basic Pay 3"; Decimal)
        {
            Caption = 'Basic Pay 3';
        }
        field(7; "IA to BP 4"; Decimal)
        {
            Caption = 'IA to BP 4';
            trigger OnValidate()
            begin
                "Basic Pay 4" := "Basic Pay 3" + "IA to BP 4";
            end;
        }
        field(8; "Basic Pay 4"; Decimal)
        {
            Caption = 'Basic Pay 4';
        }
        field(9; "IA to BP 5"; Decimal)
        {
            Caption = 'IA to BP 5';
            trigger OnValidate()
            begin
                "Basic Pay 5" := "Basic Pay 4" + "IA to BP 5";
            end;
        }
        field(10; "Basic Pay 5"; Decimal)
        {
            Caption = 'Basic Pay 5';
        }
        field(11; "IA to BP 6"; Decimal)
        {
            Caption = 'IA to BP 6';
            trigger OnValidate()
            begin
                "Basic Pay 6" := "Basic Pay 5" + "IA to BP 6";
            end;
        }
        field(12; "Basic Pay 6"; Decimal)
        {
            Caption = 'Basic Pay 6';
        }
        field(13; "IA to BP 7"; Decimal)
        {
            Caption = 'IA to BP 7';
            trigger OnValidate()
            begin
                "Basic Pay 7" := "Basic Pay 6" + "IA to BP 7";
            end;
        }
        field(14; "Basic Pay 7"; Decimal)
        {
            Caption = 'Basic Pay 7';
        }
        field(15; "IA to BP 8"; Decimal)
        {
            Caption = 'IA to BP 8';
            trigger OnValidate()
            begin
                "Basic Pay 8" := "Basic Pay 7" + "IA to BP 8";
            end;
        }
        field(16; "Basic Pay 8"; Decimal)
        {
            Caption = 'Basic Pay 8';
        }
        field(17; "IA BP 9"; Decimal)
        {
            Caption = 'IA BP 9';
            trigger OnValidate()
            begin
                "Basic Pay 9" := "Basic Pay 8" + "IA BP 9";
            end;
        }
        field(18; "Basic Pay 9"; Decimal)
        {
            Caption = 'Basic Pay 9';
        }
        field(19; "IA to BP 10"; Decimal)
        {
            Caption = 'IA to BP 10';
            trigger OnValidate()
            begin
                "Basic Pay 10" := "Basic Pay 9" + "IA to BP 10";
            end;
        }
        field(20; "Basic Pay 10"; Decimal)
        {
            Caption = 'Basic Pay 10';
        }
        field(21; "Maximum Basic Pay"; Decimal)
        {
            Caption = 'Maximum Basic Pay';
            trigger OnValidate()
            begin
                // "Basic Pay 10" := "Basic Pay 9" + "IA to BP 10";
            end;
        }
        field(22; "Job Group Description"; Text[250])
        {
            Caption = 'Job Group Description';
        }
        field(23; "IA to BP 11"; Decimal)
        {
            Caption = 'IA to BP 11';
            trigger OnValidate()
            begin
                "Basic Pay 11" := "Basic Pay 10" + "IA to BP 11";
            end;
        }
        field(24; "Basic Pay 11"; Decimal)
        {
            Caption = 'Basic Pay 11';
        }
        field(25; "IA to BP 12"; Decimal)
        {
            Caption = 'IA to BP 12';
            trigger OnValidate()
            begin
                "Basic Pay 12" := "Basic Pay 11" + "IA to BP 12";
            end;
        }
        field(26; "Basic Pay 12"; Decimal)
        {
            Caption = 'Basic Pay 12';
        }
        field(27; "IA to BP 13"; Decimal)
        {
            Caption = 'IA to BP 13';
            trigger OnValidate()
            begin
                "Basic Pay 13" := "Basic Pay 12" + "IA to BP 13";
            end;
        }
        field(28; "Basic Pay 13"; Decimal)
        {
            Caption = 'Basic Pay 13';
        }
        field(29; "IA to BP 14"; Decimal)
        {
            Caption = 'IA to BP 14';
            trigger OnValidate()
            begin
                "Basic Pay 14" := "Basic Pay 13" + "IA to BP 14";
            end;
        }
        field(30; "Basic Pay 14"; Decimal)
        {
            Caption = 'Basic Pay 14';
        }
        field(31; "IA to BP 15"; Decimal)
        {
            Caption = 'IA to BP 15';
            trigger OnValidate()
            begin
                "Basic Pay 15" := "Basic Pay 14" + "IA to BP 15";
            end;
        }
        field(32; "Basic Pay 15"; Decimal)
        {
            Caption = 'Basic Pay 15';
            Editable = false;
        }
        field(33; "IA to BP 16"; Decimal)
        {
            Caption = 'IA to BP 15';
            trigger OnValidate()
            begin
                "Basic Pay 16" := "Basic Pay 15" + "IA to BP 16";
            end;
        }
        field(34; "Basic Pay 16"; Decimal)
        {
            Caption = 'Basic Pay 16';
            Editable = false;
        }
        field(35; "IA to BP 17"; Decimal)
        {
            Caption = 'IA to BP 17';
            trigger OnValidate()
            begin
                "Basic Pay 17" := "Basic Pay 16" + "IA to BP 17";
            end;
        }
        field(36; "Basic Pay 17"; Decimal)
        {
            Caption = 'Basic Pay 17';
            Editable = false;
        }
        field(37; "IA to BP 18"; Decimal)
        {
            Caption = 'IA to BP 18';
            trigger OnValidate()
            begin
                "Basic Pay 18" := "Basic Pay 17" + "IA to BP 18";
            end;
        }
        field(38; "Basic Pay 18"; Decimal)
        {
            Caption = 'Basic Pay 18';
            Editable = false;
        }
        field(39; "IA to BP 19"; Decimal)
        {
            Caption = 'IA to BP 19';
            trigger OnValidate()
            begin
                "Basic Pay 19" := "Basic Pay 18" + "IA to BP 19";
            end;
        }
        field(40; "Basic Pay 19"; Decimal)
        {
            Caption = 'Basic Pay 19';
            Editable = false;
        }
        field(41; "Leave Allowance Amount"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1; Grade)
        {
            Clustered = true;
        }
    }

    fieldgroups { }
}
