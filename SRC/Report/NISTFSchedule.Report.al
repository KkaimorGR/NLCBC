
report 52193704 "NISTF Schedule"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/NISTF Schedule.rdlc';
    ApplicationArea = All;
    Caption = 'NISTF Schedule';
    dataset { }

    requestpage
    {

        layout { }

        actions { }
    }

    labels { }

    var
        strEmpName: Text[100];
        cHeader: array[200] of Text[200];
        cValue: array[200] of Decimal;
        Trans: Record "Bank Bal. Alert Buffer";
        ColNo: Integer;
        i: Integer;
        RCount: Integer;
        VitalInfo: Record "Value Posting";
        NISTFRate: Decimal;
        SalaryGrades: Record "Purchase Quote Line";
        CompanyInfo: Record "Company Information";
        PrintToExcel: Boolean;
        ExcelBuf: Record "Excel Buffer" temporary;
        HeaderCreated: Boolean;
        Employee_NameCaptionLbl: Label 'Employee Name';
        Employee_CodeCaptionLbl: Label 'Employee Code';
        CurrReport_PAGENOCaptionLbl: Label 'Page';
        NISTF_ScheduleCaptionLbl: Label 'NISTF Schedule';
        Prepared_by_CaptionLbl: Label 'Prepared by:';
        Authorised_by_CaptionLbl: Label 'Authorised by:';
        NameCaptionLbl: Label 'Name';
        EmptyStringCaptionLbl: Label '......................................................................................................................................................';
        EmptyStringCaption_Control1102755023Lbl: Label '......................................................................................................................................................';
        NameCaption_Control1102755024Lbl: Label 'Name';
        EmptyStringCaption_Control1102755025Lbl: Label '......................................................................................................................................................';
        Approved_by_CaptionLbl: Label 'Approved by:';
        NameCaption_Control1102755027Lbl: Label 'Name';
        Signature___DateCaptionLbl: Label 'Signature & Date';
        EmptyStringCaption_Control1102755029Lbl: Label '......................................................................................................................................................';
        Signature___DateCaption_Control1102755030Lbl: Label 'Signature & Date';
        EmptyStringCaption_Control1102755031Lbl: Label '......................................................................................................................................................';
        Signature___DateCaption_Control1102755034Lbl: Label 'Signature & Date';
        EmptyStringCaption_Control1102755035Lbl: Label '......................................................................................................................................................';
}
