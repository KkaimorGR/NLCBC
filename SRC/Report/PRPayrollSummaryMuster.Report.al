
report 52193483 "PR Payroll Summary -  Muster"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/PR Payroll Summary -  Muster.rdlc';
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    Caption = 'PR Payroll Summary -  Muster';
    dataset
    {
        dataitem("PR Period Transactions"; "PR Period Transactions")
        {
            RequestFilterFields = "Payroll Period", "Employee Code", "Global Dimension 1 Code";
            DataItemTableView = where("Transaction Code" = filter(<> 'GPAY' | <> 'NPAY' | <> 'PSNR' | <> 'INSR'));
            column(ReportForNavId_1; 1) { }
            column(Payroll_Period; "Payroll Period")
            { }
            column(TransactionCode_PRPeriodTransactions; "PR Period Transactions"."Transaction Code") { }
            column(Amount_PRPeriodTransactions; "PR Period Transactions".Amount) { }
            column(EmployeeCode_PRPeriodTransactions; "PR Period Transactions"."Employee Code") { }
            column(TransactionName_PRPeriodTransactions; "PR Period Transactions"."Transaction Name") { }
            column(PeriodMonth_PRPeriodTransactions; "PR Period Transactions"."Period Month") { }
            column(PeriodYear_PRPeriodTransactions; "PR Period Transactions"."Period Year") { }
            column(GlobalDimension1Code_PRPeriodTransactions; "PR Period Transactions"."Global Dimension 1 Code") { }
            column(GroupOrder_PRPeriodTransactions; "PR Period Transactions"."Group Order") { }
            column(SubGroupOrder_PRPeriodTransactions; "PR Period Transactions"."Sub Group Order") { }
            column(FullName; FullName) { }
            column(RowNum; RowNum) { }
            column(Picture; CompInfo.Picture) { }
            column(CountyName; CountyName) { }
            column(HideDeductions; HideDeductions) { }
            column(Grade; Grade) { }
            column(Designation; Designation) { }
            column(Directorate; Directorate) { }
            column(CompanyAddress; CompanyAddress)
            { }
            column(CompanyName; CompanyName)
            {

            }
            column(NLCWebsite; NLCWebsite)
            {

            }
            column(Piture; CompInfo.Picture)
            {

            }
            column(HDecimal; HDecimal)
            {

            }
            column(TotalDuc; TotalDuc)
            {

            }
            column(Cummulative; Cummulative)
            { }
            column(PensionArr; PensionArr)
            {

            }

            trigger OnAfterGetRecord()
            begin
                FullName := '';
                Grade := '';
                Designation := '';
                HSELEVY := 0;
                Directorate := '';
                TotalDuc := 0;
                NHAmt := 0;


                if "PR Period Transactions"."Employee Code" = '' then
                    CurrReport.Skip();
                // IF "PR Period Transactions"."Employee Code" = 'NLCPEN' then
                //     CurrReport.Skip();
                // Prperid.Reset();
                // // PeriodTrans.SETRANGE(PeriodTrans."Payroll Code","prPayroll Type"."Payroll Code");
                // Prperid.SetRange(Prperid."Transaction Code", 'TOT-DED');
                // Prperid.SetRange(Prperid."Payroll Period", "PR Period Transactions"."Payroll Period");
                // Prperid.SetRange("Employee Code", "PR Period Transactions"."Employee Code");
                // Prperid.SetRange("Transaction Type", Prperid."Transaction Type"::Deduction);
                // Prperid.SetFilter(Prperid.Amount, '>%1', 0);
                // if Prperid.Find('-') then begin
                //     Prperid.CalcSums(Prperid.Amount);
                //     HDecimal := Prperid.Amount;
                //     Prperid.Amount := HDecimal;
                //     Prperid.Modify();
                // end;

                RowNum := 0;
                // IF "PR Period Transactions"."Transaction Code" = 'HOUSING LEVY' THEN CurrReport.SKIP;

                if "PR Period Transactions"."Employee Code" <> "PR Period Transactions"."Employee Code" then begin
                    RowNum += 1;
                    Passed := false;
                    HDecimal := 0;
                    // Message('test');
                end;

                HREmp.Reset();
                HREmp.SetRange(HREmp."No.", "PR Period Transactions"."Employee Code");
                if HREmp.Find('-') then begin
                    FullName := UpperCase(HREmp."Full Name");
                    Grade := HREmp.Grade;
                    Designation := HREmp."Job Title";
                    Directorate := HREmp."Global Dimension 2 Code";
                end;

                DimensionValue.Reset();
                //DimensionValue.SetRange(DimensionValue."Global Dimension No.", 1);
                DimensionValue.SetRange(DimensionValue.Code, "PR Period Transactions"."Global Dimension 1 Code");
                if DimensionValue.Find('-') then
                    CountyName := DimensionValue.Name;
                if Passed = false then begin
                    HDecimal := 0;
                    Prperid.Reset();
                    // Prperid.SetRange(Prperid."Transaction Code", "PR Period Transactions"."Transaction Code");
                    Prperid.SetRange(Prperid."Payroll Period", "PR Period Transactions"."Payroll Period");
                    Prperid.SetRange("Employee Code", "PR Period Transactions"."Employee Code");
                    Prperid.SetRange("Transaction Type", Prperid."Transaction Type"::Deduction);
                    Prperid.SetFilter(Prperid.Amount, '>%1', 0);
                    if Prperid.FindSet() then begin
                        Prperid.CalcSums(Prperid.Amount);
                        HDecimal := Prperid.Amount;
                        // Passed := true;
                    end;
                end;
                Prperid.Reset();
                // Prperid.SetRange(Prperid."Transaction Code", "PR Period Transactions"."Transaction Code");
                Prperid.SetRange(Prperid."Payroll Period", "PR Period Transactions"."Payroll Period");
                // Prperid.SetRange("Employee Code", "PR Period Transactions"."Employee Code");
                Prperid.SetRange("Transaction Type", Prperid."Transaction Type"::Deduction);
                Prperid.SetFilter(Prperid.Amount, '>%1', 0);
                if Prperid.FindSet() then begin
                    Prperid.CalcSums(Prperid.Amount);
                    TotalDuc := Prperid.Amount;
                    // Passed := true;
                end;
                PeriodTrans.Reset();
                //PeriodTrans.SETRANGE(PeriodTrans."Payroll Code","prPayroll Type"."Payroll Code");
                PeriodTrans.SetRange(PeriodTrans."Transaction Code", 'PAYE');
                PeriodTrans.SetRange(PeriodTrans."Payroll Period", "PR Period Transactions"."Payroll Period");
                if PeriodTrans.FindSet() then begin
                    PeriodTrans.CalcSums(PeriodTrans.Amount);
                    PAYEAmount := PAYEAmount + PeriodTrans.Amount;
                end;

                PeriodTrans.Reset();
                //PeriodTrans.SETRANGE(PeriodTrans."Payroll Code","prPayroll Type"."Payroll Code");
                PeriodTrans.SetRange(PeriodTrans."Transaction Code", 'NSSF');
                PeriodTrans.SetRange(PeriodTrans."Payroll Period", "PR Period Transactions"."Payroll Period");
                if PeriodTrans.Find('-') then begin
                    PeriodTrans.CalcSums(PeriodTrans.Amount);
                    NSSFAmount := PeriodTrans.Amount;
                end;
                PensionArr := 0;
                PeriodTrans.Reset();
                //PeriodTrans.SETRANGE(PeriodTrans."Payroll Code","prPayroll Type"."Payroll Code");
                PeriodTrans.SetRange(PeriodTrans."Employee Code", 'NLCPEN');
                PeriodTrans.SetRange(PeriodTrans."Payroll Period", "PR Period Transactions"."Payroll Period");
                if PeriodTrans.FindSet() then begin
                    PeriodTrans.CalcSums(PeriodTrans.Amount);
                    PensionArr := PeriodTrans.Amount;

                end;
                PeriodTrans.Reset();
                //PeriodTrans.SETRANGE(PeriodTrans."Payroll Code","prPayroll Type"."Payroll Code");
                PeriodTrans.SetRange(PeriodTrans."Transaction Code", 'SHA');
                PeriodTrans.SetRange(PeriodTrans."Payroll Period", "PR Period Transactions"."Payroll Period");

                if PeriodTrans.FindSet() then begin
                    PeriodTrans.CalcSums(PeriodTrans.Amount);
                    NHIFAmount := PeriodTrans.Amount;

                end;
                PeriodTrans.Reset();
                //PeriodTrans.SETRANGE(PeriodTrans."Payroll Code","prPayroll Type"."Payroll Code");
                PeriodTrans.SetRange(PeriodTrans."Transaction Code", 'NHIF');
                PeriodTrans.SetRange(PeriodTrans."Payroll Period", "PR Period Transactions"."Payroll Period");

                if PeriodTrans.FindSet() then begin
                    PeriodTrans.CalcSums(PeriodTrans.Amount);
                    NHAmt := PeriodTrans.Amount;
                end;

                // Message(Format(HDecimal));
                Cummulative := NSSFAmount + TotalDuc + NHIFAmount + NHAmt;
            end;

            trigger OnPreDataItem()
            begin
                HDecimal := 0;
                "PR Period Transactions".SetCurrentKey("PR Period Transactions"."Employee Code", "PR Period Transactions"."Period Month", "PR Period Transactions"."Period Year",
                "PR Period Transactions"."Group Order", "PR Period Transactions"."Sub Group Order");


            end;
        }



    }

    requestpage
    {
        SaveValues = true;

        layout
        {
            area(Content)
            {
                field(HideDeductions; HideDeductions)
                {
                    ApplicationArea = Basic;
                    Caption = 'Hide Deductions';
                    ToolTip = 'Specifies the value of the Hide Deductions field.';
                }
            }
        }

        actions { }
    }

    labels { }

    trigger OnPreReport()
    begin
        if "PR Period Transactions".GetFilter("PR Period Transactions"."Payroll Period") = '' then
            Error('Please select a payroll period');
        CompInfo.get();
        CompInfo.CalcFields(Picture);
        CompanyName := CompInfo.Name;
        CompanyAddress := CompInfo.Address;
        NLCWebsite := CompInfo."NLC Website";
    end;

    trigger OnPostReport()
    var
        myInt: Integer;
    begin
        // Message(Format(HSELEVY));

    end;

    var
        HREmp: Record "HR Employees";
        FullName: Text;
        RowNum: Integer;
        HideDeductions: Boolean;
        PeriodTrans: record "PR Period Transactions";
        CompInfo: Record "Company Information";
        CountyName: Text;
        NHIFAmount: Decimal;
        NHAmt: Decimal;
        Passed: Boolean;
        PAYEAmount: Decimal;
        TotalDuc: Decimal;
        Prperid: Record "PR Period Transactions";
        DimensionValue: Record "Dimension Value";
        HDecimal: Decimal;
        NSSFAmount: Decimal;
        Cummulative: Decimal;
        Grade: Text;
        Designation: Text;
        CompanyName: Text;
        CompanyAddress: Text;
        HSELEVY: Decimal;
        NLCWebsite: Text;
        Directorate: Text;
        TotalDecutions: Decimal;
        PensionArr: Decimal;
}
