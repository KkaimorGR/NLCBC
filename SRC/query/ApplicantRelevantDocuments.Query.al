
query 50002 "Applicant Relevant Documents"
{
    Caption = 'Applicant Relevant Documents';
    elements
    {
        dataitem(Applicant_Relevant_Documents; "Applicant Relevant Documents")
        {
            column(Applicant_No; "Applicant No") { }
            column(Job_Application_No; "Job Application No") { }
            column(Helb_Certificate; "Helb Certificate") { }
            column(Good_Conduct_Certificate; "Good Conduct Certificate") { }
            column(CRB_Certificate; "CRB Certificate") { }
            column(EACC_Certificate; "EACC Certificate") { }
            column(KRA_Pin_Certificate; "KRA Pin Certificate") { }
            column(Date_Modified; "Date Modified") { }
            column(Entry_No; "Entry No") { }
        }
    }
}
