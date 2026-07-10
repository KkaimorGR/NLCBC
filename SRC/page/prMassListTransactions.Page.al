
page 52193729 "prMassList Transactions"
{
    DeleteAllowed = false;
    InsertAllowed = false;
    ModifyAllowed = true;
    PageType = Card;
    SourceTable = "PR Transaction Codes";
    SourceTableView = where("Transaction Type" = filter(Deduction));
    ApplicationArea = All;
    Caption = 'prMassList Transactions';
    layout
    {
        area(Content)
        {
            field("Transaction Code"; Rec."Transaction Code")
            {
                ApplicationArea = Basic;
                Editable = false;
                ToolTip = 'Specifies the value of the Transaction Code field.';
            }
            field("Transaction Name"; Rec."Transaction Name")
            {
                ApplicationArea = Basic;
                Editable = false;
                ToolTip = 'Specifies the value of the Transaction Name field.';
            }
            part(Control1000000002; "prmassList Translines")
            {
                SubPageLink = "Transaction Code" = field("Transaction Code");
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action("Load Employees")
            {
                ApplicationArea = Basic;
                Caption = 'Load Employees';
                Image = CalculateRegenerativePlan;
                Promoted = true;
                PromotedCategory = Process;
                ToolTip = 'Executes the Load Employees action.';
            }
        }
    }

    var
        objTransCodes: Record "PR Transaction Codes";
        SelectedPeriod: Date;
        objPeriod: Record "PR Payroll Periods";
        PeriodName: Text[30];
        PeriodTrans: Record "PR Period Transactions";
        PeriodMonth: Integer;
        PeriodYear: Integer;
        objEmpTrans: Record "PR Employee Transactions";
        transType: Text[30];
        strExtractedFrml: Text[30];
        curTransAmount: Decimal;
        empCode: Text[30];
        Employee: Record "PR Salary Arrears22";
        SalaryCard: Record "PR Salary Card";
        "Period Amount": Decimal;
        "Period Balance": Decimal;
        objEmp: Record "PR Salary Arrears22";
        Names: Text;
}
