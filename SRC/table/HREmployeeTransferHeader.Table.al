
table 52193492 "HR Employee Transfer Header"
{
    Caption = 'HR Employee Transfer Header';
    DataClassification = CustomerContent;
    fields
    {
        field(1; "Request No"; Code[50])
        {
            Caption = 'Request No';
            trigger OnValidate()
            begin
                if "Request No" <> xRec."Request No" then begin
                    hrsetup.Get();
                    NoSeriesMgt.TestManual(hrsetup."Employee Transfer Nos.");
                    "No. Series" := '';
                end;
            end;
        }
        field(2; "Date Requested"; Date)
        {
            Caption = 'Date Requested';
        }
        field(3; "Date Approved"; Date)
        {
            Caption = 'Date Approved';
        }
        field(4; Status; Option)
        {
            Editable = false;
            OptionCaption = 'New,Pending Approval,Approved,Rejected,Cancelled';
            OptionMembers = New,"Pending Approval",Approved,Rejected,Cancelled;
            Caption = 'Status';
            trigger OnValidate()
            var
                HRRec: Record "HR Employees";
                TransferLines: Record "HR Employee Transfer Lines";
                TranferSingle: Record "Employee Transfers";
                DocNo: code[30];
                PayrolChanges: Record "Payroll Changes";
                HRSetup: Record "HR Setup";
                Payrolchangelines: Record "Payroll Change Request Line";
            begin

                if Status = Status::Approved then begin
                    HRSetup.Get;
                    HRSetup.TestField("Payroll Change Nos.");
                    DocNo := NoSeriesMgt.GetNextNo(HRSetup."Payroll Change Nos.", 0D, True);
                    PayrolChanges.Reset();
                    PayrolChanges.Init();
                    PayrolChanges."Payroll Change No" := DocNo;
                    PayrolChanges."Date Requested" := Today;
                    TransferLines.Reset();
                    TransferLines.SetRange("Request No", rec."Request No");
                    if TransferLines.FindFirst() then begin
                        PayrolChanges."Period Month" := TransferLines."Period Month";
                        PayrolChanges."Period Year" := TransferLines."Period Year";
                        PayrolChanges.Narration := TransferLines.Reason;
                        PayrolChanges.Narrations := TransferLines.Reason;
                    end;
                    PayrolChanges.Status := PayrolChanges.Status::New;
                    PayrolChanges."User ID" := UserId;
                    "Date Approved" := Today;
                    TransferLines.Reset();
                    TransferLines.SetRange("Request No", rec."Request No");
                    if TransferLines.FindFirst() then begin
                        repeat
                            TranferSingle.Reset();
                            TranferSingle.SetRange("Employee No", TransferLines."Employee No");
                            TranferSingle.SetRange(TranferSingle."Request Date", TransferLines."Date Of Transfer");
                            if not TranferSingle.FindFirst() then begin
                                TranferSingle.Init();
                                HRSetup.Get;
                                HRSetup.TestField("Employee Transfer Nos.");
                                HRSetup.TestField("Transfer Allowance");
                                // DocNo := NoSeriesMgt.GetNextNo(HRSetup."Employee Transfer Nos.", 0D, True);
                                TranferSingle."Employee No" := TransferLines."Employee No";
                                TranferSingle.Validate(TranferSingle."Employee No");
                                TranferSingle."Document No" := TransferLines."Request No";
                                TranferSingle.Status := TranferSingle.Status::Released;
                                TranferSingle."Request Date" := TransferLines."Date Of Transfer";
                                TranferSingle."Transfer Date" := TransferLines."Date Of Transfer";
                                TranferSingle."New Station" := TransferLines."New Global Dimension 1 Code";
                                TranferSingle."New Sattion Name" := TransferLines."New Region Name";
                                TranferSingle.Insert();
                            end;
                            HRRec.Reset();
                            HRRec.SetRange("No.", TransferLines."Employee No");
                            if HRRec.FindFirst() then begin
                                HRRec.Grade := TransferLines."Current Grade";
                                if TransferLines."New Designation" <> '' then begin
                                    HRRec."Job ID" := TransferLines."New Designation";
                                    HRRec.Validate("Job ID");
                                end;
                                // HRRec."Job Title" := TransferLines."New Job ID Name";
                                HRRec."Current Duty Station" := TransferLines."New Region Name";
                                HRRec.County := TransferLines."New Global Dimension 1 Code";
                                HRRec."County Name" := TransferLines."New Region Name";
                                //HRRec."Global Dimension 1 Code" := TransferLines."New Global Dimension 2 Code";
                                HRRec."Department Name" := TransferLines."New Department Name";
                                HRRec."Salary Grade" := TransferLines."New Grade";
                                HRRec."EMP Transfer Date" := TransferLines."Date Of Transfer";
                                HRRec."Last Date Modified" := Today;
                                payrolChangeLine.Reset();
                                payrolChangeLine.SetRange(payrolChangeLine."Employee Code", TransferLines."Employee No");
                                payrolChangeLine.SetRange(payrolChangeLine."Transaction Code", TransferLines."Transaction Code");
                                payrolChangeLine.SetRange(payrolChangeLine."Effective Payroll Period", TransferLines."From payroll Period");
                                if not payrolChangeLine.Find('-') then begin
                                    if TransferLines."Hardship Area" = true then begin
                                        payrolChangeLine.Init();
                                        payrolChangeLine."Payroll Change No" := PayrolChanges."Payroll Change No";
                                        payrolChangeLine."Employee Code" := TransferLines."Employee No";
                                        payrolChangeLine.Validate(payrolChangeLine."Employee Code");
                                        payrolChangeLine.Reason := payrolChangeLine.Reason::Other;
                                        payrolChangeLine."Effective Payroll Period" := TransferLines."From payroll Period";
                                        payrolChangeLine."Transaction Code" := TransferLines."HardShip Code";
                                        payrolChangeLine."Transaction Name" := TransferLines."HardShip TransName";
                                        payrolChangeLine."New Value" := TransferLines."Hardship Amount";
                                        // payrolChangeLine."Period Month" := TransferLines."Period Month";
                                        // payrolChangeLine."Period Year" := TransferLines."Period Year";
                                        payrolChangeLine.Insert();
                                    end;
                                    if TransferLines."Hardship Area" = false then begin
                                        payrolChangeLine.Init();
                                        payrolChangeLine."Payroll Change No" := PayrolChanges."Payroll Change No";
                                        payrolChangeLine."Employee Code" := TransferLines."Employee No";
                                        payrolChangeLine.Validate(payrolChangeLine."Employee Code");
                                        payrolChangeLine."Effective Payroll Period" := TransferLines."From payroll Period";
                                        payrolChangeLine."Transaction Code" := TransferLines."Transaction Code";
                                        payrolChangeLine."Transaction Name" := TransferLines."Transaction Name";
                                        payrolChangeLine."New Value" := TransferLines.Amount;
                                        payrolChangeLine.Reason := payrolChangeLine.Reason::Other;
                                        //  payrolChangeLine.per := TransferLines."Period Month";
                                        // payrolChangeLine."Period Year" := TransferLines."Period Year";
                                        payrolChangeLine.Insert();
                                    end;
                                end else begin
                                    if payrolChangeLine.Find('-') then begin
                                        if TransferLines."Hardship Area" = true then begin
                                            payrolChangeLine."Payroll Change No" := PayrolChanges."Payroll Change No";
                                            payrolChangeLine."Employee Code" := TransferLines."Employee No";
                                            payrolChangeLine.Validate(payrolChangeLine."Employee Code");
                                            payrolChangeLine."Effective Payroll Period" := TransferLines."From payroll Period";
                                            payrolChangeLine."Transaction Code" := TransferLines."HardShip Code";
                                            payrolChangeLine."Transaction Name" := TransferLines."HardShip TransName";
                                            payrolChangeLine."New Value" := TransferLines."Hardship Amount";
                                            payrolChangeLine.Reason := payrolChangeLine.Reason::Other;
                                            // payrolChangeLine."Period Month" := TransferLines."Period Month";
                                            // payrolChangeLine."Period Year" := TransferLines."Period Year";
                                            payrolChangeLine.Modify();
                                        end;
                                        if TransferLines."Hardship Area" = false then begin
                                            payrolChangeLine."Payroll Change No" := PayrolChanges."Payroll Change No";
                                            payrolChangeLine."Employee Code" := TransferLines."Employee No";
                                            payrolChangeLine.Validate(payrolChangeLine."Employee Code");
                                            payrolChangeLine."Effective Payroll Period" := TransferLines."From payroll Period";
                                            payrolChangeLine."Transaction Code" := TransferLines."Transaction Code";
                                            payrolChangeLine."Transaction Name" := TransferLines."Transaction Name";
                                            payrolChangeLine."New Value" := TransferLines.Amount;
                                            payrolChangeLine.Reason := payrolChangeLine.Reason::Other;
                                            // payrolChangeLine."Period Month" := TransferLines."Period Month";
                                            // payrolChangeLine."Period Year" := TransferLines."Period Year";
                                            payrolChangeLine.Modify();
                                        end;
                                    end;
                                end;
                                HRRec.Modify();
                            end;
                        until TransferLines.Next() = 0;
                    end;
                    PayrolChanges.Insert();
                end;
            end;
        }
        field(5; "No. Series"; Code[10])
        {
            Caption = 'No. Series';
        }
        field(6; "Responsibility Center"; Code[20])
        {
            Caption = 'Responsibility Center';
            TableRelation = "Responsibility Center BR NEW".Code;
        }
        field(7; "Transfer details Updated"; Boolean)
        {
            Editable = false;
            Caption = 'Transfer details Updated';
        }
        field(8; Details; Text[250])
        {
            Caption = 'Details';
        }
        field(9; Reason; Option)
        {
            OptionCaption = '  ,Acting Position,On Transfer,Re-Deployment,On Promotion,Disciplinary,Medical';
            OptionMembers = "  ","Acting Position","On Transfer","Re-Deployment","On Promotion",Disciplinary,Medical;
            Caption = 'Reason';
        }
        field(10; "Captured By"; Text[80])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1; "Request No")
        {
            Clustered = true;
        }
    }

    fieldgroups { }

    trigger OnDelete()
    begin

        if Status <> Status::New then
            Error('You are not allowed to delete at this level')
    end;

    trigger OnInsert()
    begin
        "Captured By" := UserId;
        "Date Requested" := Today;
        if "Request No" = '' then begin
            hrsetup.Get();
            hrsetup.TestField(hrsetup."Employee Transfer Nos.");
            NoSeriesMgt.InitSeries(hrsetup."Employee Transfer Nos.", xRec."No. Series", 0D, "Request No", "No. Series");

        end;
    end;

    trigger OnModify()
    var
        myInt: Integer;
    begin
        "Date Requested" := Today;
        "Captured By" := UserId;
    end;

    var
        hrsetup: Record "HR Setup";
        NoSeriesMgt: Codeunit NoSeriesManagement;
        Employees: Record "HR Employees";
        HRTransferLines: Record "HR Employee Transfer Lines";
        HREmployeeInfo: Record "HR Employees";
        payrolChangeLine: Record "Payroll Change Request Line";

    local procedure GetLastEntryNo() LastLineNum: Integer
    var
        HRBankInfo: Record "HR Employees Info Changes";
    begin
        HRBankInfo.Reset();
        if HRBankInfo.Find('+') then
            LastLineNum := HRBankInfo."Line No." + 1
        else
            LastLineNum := 1000;
    end;
}
