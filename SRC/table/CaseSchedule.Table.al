
table 52193969 "Case Schedule"
{
    Caption = 'Case Schedule';
    DataClassification = CustomerContent;
    fields
    {
        field(1; "Case ID"; Code[20])
        {
            Caption = 'Case ID';
            trigger OnValidate()
            begin
                if "Case ID" <> xRec."Case ID" then begin
                    NoSetup.Get();
                    NoSeriesMgt.TestManual(NoSetup."Case Nos");
                    "No. Series" := '';
                end;
            end;
        }
        field(2; "Court Date"; Date)
        {
            Caption = 'Court Date';
        }
        field(3; "Type of Proceedings"; Code[10])
        {
            TableRelation = "Case Document Types".Code;
            Caption = 'Type of Proceedings';
            trigger OnValidate()
            begin
                if proceed.Get("Type of Proceedings") then
                    "Proceedings Description" := proceed.Description;
            end;
        }
        field(4; "Proceedings Description"; Text[60])
        {
            Caption = 'Proceedings Description';
        }
        field(5; "Date Created"; Date)
        {
            Editable = false;
            Caption = 'Date Created';
        }
        field(6; "Time Created"; Date)
        {
            Editable = false;
            Caption = 'Time Created';
        }
        field(7; "Created By"; Code[20])
        {
            Editable = false;
            Caption = 'Created By';
        }
        field(8; "No. Series"; Code[20])
        {
            Caption = 'No. Series';
        }
    }

    keys
    {
        key(Key1; "Case ID")
        {
            Clustered = true;
        }
    }

    fieldgroups { }

    trigger OnInsert()
    begin
        if "Case ID" = '' then begin
            NoSetup.Get();
            NoSetup.TestField(NoSetup."Case Nos");
            NoSeriesMgt.InitSeries(NoSetup."Case Nos", xRec."No. Series", 0D, "Case ID", "No. Series");
        end;

        "Date Created" := Today;
        "Created By" := UserId;
        "Time Created" := "Time Created";
    end;

    var
        NoSetup: Record "Copyright Setup";
        NoSeriesMgt: Codeunit NoSeriesManagement;
        proceed: Record "Case Document Types";
}

