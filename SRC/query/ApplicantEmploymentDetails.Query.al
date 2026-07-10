
query 50000 "Applicant Employment Details"
{
    Caption = 'Applicant Employment Details';
    elements
    {
        dataitem(Applicant_Employment_Details; "Applicant Employment Details")
        {
            column(No; No) { }
            column(ApplicantNo; ApplicantNo) { }
            column(Employer; Employer) { }
            column(Contacts; Contacts) { }
            column(Current_Salary; "Current Salary") { }
            column(Addtional_Benefits; "Addtional Benefits") { }
            column(Acceptable_Salary; "Acceptable Salary") { }
            column(Leaving_Reason; "Leaving Reason") { }
            column(Contact_Employer; "Contact Employer") { }
            column(Phone_Number; "Phone Number") { }
            column(Department; Department) { }
            column(Position; Position) { }
            column(Type_Of_Position; "Type Of Position") { }
            column(Staff_No; "Staff No") { }
            column(Date_Employed; "Date Employed") { }
        }
    }
}
