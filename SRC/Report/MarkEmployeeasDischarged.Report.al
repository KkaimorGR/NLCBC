
report 52193707 "Mark Employee as Discharged"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/Mark Employee as Discharged.rdlc';
    ApplicationArea = All;
    Caption = 'Mark Employee as Discharged';
    dataset { }

    requestpage
    {

        layout { }

        actions { }
    }

    labels { }

    var
        RCount: Integer;
        DeptName: Text[200];
        DValue: Record "Dimension Value";
        Employee_ListCaptionLbl: Label 'Employee List';
        CurrReport_PAGENOCaptionLbl: Label 'Page';
        NamesCaptionLbl: Label 'Names';
        DepartmentCaptionLbl: Label 'Department';
}
