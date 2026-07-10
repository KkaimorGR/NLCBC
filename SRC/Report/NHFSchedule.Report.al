
report 52193716 "NHF Schedule"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/NHF Schedule.rdlc';
    ApplicationArea = All;
    Caption = 'NHF Schedule';
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
        Employee_NameCaptionLbl: Label 'Employee Name';
        Employee_CodeCaptionLbl: Label 'Employee Code';
        CurrReport_PAGENOCaptionLbl: Label 'Page';
        NHF_ScheduleCaptionLbl: Label 'NHF Schedule';
        Prepared_by_CaptionLbl: Label 'Prepared by:';
        NameCaptionLbl: Label 'Name';
        EmptyStringCaptionLbl: Label '......................................................................................................................................................';
        Authorised_by_CaptionLbl: Label 'Authorised by:';
        EmptyStringCaption_Control1102755018Lbl: Label '......................................................................................................................................................';
        NameCaption_Control1102755020Lbl: Label 'Name';
        EmptyStringCaption_Control1102755021Lbl: Label '......................................................................................................................................................';
        Approved_by_CaptionLbl: Label 'Approved by:';
        EmptyStringCaption_Control1102755023Lbl: Label '......................................................................................................................................................';
        Signature___DateCaptionLbl: Label 'Signature & Date';
        EmptyStringCaption_Control1102755025Lbl: Label '......................................................................................................................................................';
        Signature___DateCaption_Control1102755026Lbl: Label 'Signature & Date';
        EmptyStringCaption_Control1102755027Lbl: Label '......................................................................................................................................................';
        NameCaption_Control1102755028Lbl: Label 'Name';
        Signature___DateCaption_Control1102755029Lbl: Label 'Signature & Date';
}
