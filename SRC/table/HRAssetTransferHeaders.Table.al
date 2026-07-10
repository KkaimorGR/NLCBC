
Table 52193473 "HR Asset Transfer Headers"
{

    fields
    {
        field(1; "No."; Code[20])
        {
            Editable = false;
        }
        field(2; "Document Date"; Date)
        {
            Editable = false;
        }
        field(5; "Issuing Admin/Asst"; Code[20])
        {
            //TableRelation = Table39003910.Field1;

            trigger OnValidate()
            begin

                hremployee.Reset;
                if hremployee.Get("Issuing Admin/Asst") then begin
                    "Issuing Admin/Asst Name" := hremployee."First Name" + ' ' + hremployee."Last Name";
                end else begin
                    "Issuing Admin/Asst Name" := '';

                end;
            end;
        }
        field(6; "Issuing Admin/Asst Name"; Text[50])
        {
        }
        field(7; "Document Type"; Option)
        {
            OptionCaption = 'Asset Transfer,Asset Allocation,Asset Incidence';
            OptionMembers = "Asset Transfer","Asset Allocation","Asset Incidence";
        }
        field(8; "Currency Code"; Code[10])
        {
        }
        field(9; "No. Series"; Code[10])
        {
        }
        field(10; Status; Option)
        {
            OptionCaption = 'Open,Pending Approval,Approved,Canceled,Posted';
            OptionMembers = Open,"Pending Approval",Approved,Canceled,Posted;
        }
        field(11; Transfered; Boolean)
        {
        }
        field(12; "Date Transfered"; Date)
        {
        }
        field(13; "Transfered By"; Code[20])
        {
        }
        field(14; "Time Posted"; Time)
        {
        }
        field(50000; "User ID"; Code[50])
        {
            Editable = false;
        }
        field(50001; "Responsibility Center"; Code[50])
        {
            TableRelation = "Responsibility Center BR 2".Code;
        }
        field(50002; Type; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Issue,Return,Exchange,Transfer';
            OptionMembers = " ",Issue,Return,Exchange,Transfer;
        }
    }

    keys
    {
        key(Key1; "No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin

        if "No." = '' then begin
            fasetup.Get;
            fasetup.TestField(fasetup."Asset Transfer Nos.");
            NoSeriesMgt.InitSeries(fasetup."Asset Transfer Nos.", xRec."No. Series", 0D, "No.", "No. Series");
        end;

        "Document Date" := Today;
        "User ID" := UserId;
    end;

    var
        fasetup: Record "FA Setup";
        hremployee: Record "HR Employees";
        fasset: Record "Fixed Asset";
        NoSeriesMgt: Codeunit 396;
        DimValue: Record 349;
}

