
table 52193620 "prSalary Review Header"
{
    DataCaptionFields = "Proposal No.", Reason;
    Caption = 'prSalary Review Header';
    DataClassification = CustomerContent;
    fields
    {
        field(1; "Proposal No."; Code[20])
        {
            Caption = 'Proposal No.';
            trigger OnValidate()
            begin
                //TEST IF MANUAL NOs ARE ALLOWED
                if "Proposal No." <> xRec."Proposal No." then begin
                    PrSetup.Get();
                    NoSeriesMgt.TestManual(PrSetup."Salary Review Nos.");
                    "No. Series" := '';
                end;
            end;
        }
        field(5; "Proposal Date"; Date)
        {
            Caption = 'Proposal Date';
        }
        field(10; Reason; Text[100])
        {
            Caption = 'Reason';
        }
        field(15; "No. Series"; Code[20])
        {
            Caption = 'No. Series';
        }
        field(20; Status; Option)
        {
            OptionCaption = 'New,Pending Approval,Approved,Rejected';
            OptionMembers = New,"Pending Approval",Approved,Rejected;
            Caption = 'Status';
        }
    }

    keys
    {
        key(Key1; "Proposal No.")
        {
            Clustered = true;
        }
    }

    fieldgroups { }

    trigger OnInsert()
    begin
        if "Proposal No." = '' then begin
            PrSetup.Get();
            PrSetup.TestField(PrSetup."Salary Review Nos.");
            NoSeriesMgt.InitSeries(PrSetup."Salary Review Nos.", xRec."No. Series", 0D, "Proposal No.", "No. Series");
        end;

        "Proposal Date" := Today;
    end;

    var
        PrSetup: Record "prPayroll Setup";
        NoSeriesMgt: Codeunit NoSeriesManagement;
}
