
report 52193544 "HR Disciplinary Cases"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/HR Disciplinary Cases.rdlc';
    ApplicationArea = All;
    Caption = 'HR Disciplinary Cases';
    dataset
    {
        dataitem("HR Disciplinary Cases"; "HR Disciplinary Cases")
        {
            RequestFilterFields = "Case Number", "Employee No";
            column(ReportForNavId_6792; 6792) { }

            trigger OnAfterGetRecord()
            begin
                if HREmp.Get("HR Disciplinary Cases"."Employee No") then
                    EmpName := HREmp.FullName();
            end;
        }
    }

    requestpage
    {

        layout { }

        actions { }
    }

    labels { }

    trigger OnPreReport()
    begin
        CI.Get();
        CI.CalcFields(CI.Picture);
    end;

    var
        CI: Record "Company Information";
        EmpName: Text[40];
        HREmp: Record "HR Employees";
        HR_Disciplinary_CasesCaptionLbl: Label 'HR Disciplinary Cases';
        CurrReport_PAGENOCaptionLbl: Label 'Page';
        Disciplinary_Case_ReportCaptionLbl: Label 'Disciplinary Case Report';
        P_O__BoxCaptionLbl: Label 'P.O. Box';
        Employee_NameCaptionLbl: Label 'Employee Name';
}
