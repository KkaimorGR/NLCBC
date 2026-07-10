report 52193489 "Applicant Detail Report1"
{
    ApplicationArea = All;
    Caption = 'Applicants Detail Report1';
    UsageCategory = ReportsAndAnalysis;
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/ApplicantsDetail1.rdlc';

    dataset
    {
        dataitem(HRJobApplications; "HR Job Applications")
        {
            RequestFilterFields = "Job Application No.", "Candidate No.";

            column(AdditionalLanguage; "Additional Language")
            {
            }
            column(AdditionalRead; "Additional Read")
            {
            }
            column(AdditionalSpeak; "Additional Speak")
            {
            }
            column(AdditionalWrite; "Additional Write")
            {
            }
            column(Age; Age)
            {
            }
            column(AlternativeContacts; "Alternative Contacts")
            {
            }
            column(ApplicantType; "Applicant Type")
            {
            }
            column(ApplicationStatus; "Application Status")
            {
            }
            column(ApprovalStatus; "Approval Status")
            {
            }
            column(CandidateNo; "Candidate No.")
            {
            }
            column(CellPhoneNumber; "Cell Phone Number")
            {
            }
            column(Citizenship; Citizenship)
            {
            }
            column(CitizenshipDetails; "Citizenship Details")
            {
            }
            column(City; City)
            {
            }
            column(Comment; Comment)
            {
            }
            column(CountryCode; "Country Code")
            {
            }
            column(County; County)
            {
            }
            column(CountyOfBirth; "County Of Birth")
            {
            }
            column(CountyOfResidence; "County Of Residence")
            {
            }
            column(CummulativeExperience; "Cummulative Experience")
            {
            }
            column(DateApplied; "Date Applied")
            {
            }
            column(DateOfBirth; "Date Of Birth")
            {
            }
            column(DateofInterview; "Date of Interview")
            {
            }
            column(DisabilityCertNo; "Disability CertNo")
            {
            }
            column(DisabilityGrade; "Disability Grade")
            {
            }
            column(Disabled; Disabled)
            {
            }
            column(DisablingDetails; "Disabling Details")
            {
            }
            column(DocumentComment; "Document Comment")
            {
            }
            column(DrivingLicence; "Driving Licence")
            {
            }
            column(EMail; "E-Mail")
            {
            }
            column(EmployeeNo; "Employee No")
            {
            }
            column(EmployeeNos; "Employee Nos")
            {
            }
            column(EmployeeRequisitionNo; "Employee Requisition No")
            {
            }
            column(EthnicOrigin; "Ethnic Origin")
            {
            }
            column(Expatriate; Expatriate)
            {
            }
            column(Ext; "Ext.")
            {
            }
            column(FaxNumber; "Fax Number")
            {
            }
            column(FirstLanguage; "First Language")
            {
            }
            column(FirstLanguageRWS; "First Language (R/W/S)")
            {
            }
            column(FirstLanguageRead; "First Language Read")
            {
            }
            column(FirstLanguageSpeak; "First Language Speak")
            {
            }
            column(FirstLanguageWrite; "First Language Write")
            {
            }
            column(FirstName; "First Name")
            {
            }
            column(FromTime; "From Time")
            {
            }
            column(FullName; "Full Name")
            {
            }
            column(Gender; Gender)
            {
            }
            column(HealthAssesmentDate; "Health Assesment Date")
            {
            }
            column(HealthAssesment; "Health Assesment?")
            {
            }
            column(HomePhoneNumber; "Home Phone Number")
            {
            }
            column(IDNumber; "ID Number")
            {
            }
            column(Initials; Initials)
            {
            }
            column(InterviewInvitationSent; "Interview Invitation Sent")
            {
            }
            column(InterviewType; "Interview Type")
            {
            }
            column(JobApplicationNo; "Job Application No.")
            {
            }
            column(JobAppliedFor; "Job Applied For")
            {
            }
            column(JobAppliedforDescription; "Job Applied for Description")
            {
            }
            column(LastName; "Last Name")
            {
            }
            column(Level; Level)
            {
            }
            column(MaritalStatus; "Marital Status")
            {
            }
            column(MiddleName; "Middle Name")
            {
            }
            column(NoSeries; "No. Series")
            {
            }
            column(PINNumber; "PIN Number")
            {
            }
            column(PassportNumber; "Passport Number")
            {
            }
            column(PhysicallyChallengedDescript; "Physically Challenged Descript")
            {
            }
            column(PhysicallyChallenged; "Physically Challenged?")
            {
            }
            // column(Picture; Picture)
            // {
            // }
            column(PostCode2; "Post Code2")
            {
            }
            column(PostalAddress; "Postal Address")
            {
            }
            column(PostalAddress2; "Postal Address2")
            {
            }
            column(PostalAddress3; "Postal Address3")
            {
            }
            column(PostalCode; "Postal Code")
            {
            }
            column(PrimarySkillsCategory; "Primary Skills Category")
            {
            }
            column(Qualified; Qualified)
            {
            }
            column(ReApplied; ReApplied)
            {
            }
            column(Region; Region)
            {
            }
            column(RegretNoticeSent; "Regret Notice Sent")
            {
            }
            column(RelativeRelation; "Relative Relation")
            {
            }
            column(RelativeWhoWork; "Relative Who Work?")
            {
            }
            column(ResidentialAddress; "Residential Address")
            {
            }
            column(ResidentialAddress2; "Residential Address2")
            {
            }
            column(ResidentialAddress3; "Residential Address3")
            {
            }
            column(ResponsibilityCenter; "Responsibility Center")
            {
            }
            column(SearchName; "Search Name")
            {
            }
            column(SecondLanguageRWS; "Second Language (R/W/S)")
            {
            }
            column(SecondLanguageRead; "Second Language Read")
            {
            }
            column(SecondLanguageSpeak; "Second Language Speak")
            {
            }
            column(SecondLanguageWrite; "Second Language Write")
            {
            }
            column(Shortlist; Shortlist)
            {
            }
            column(Status; Status)
            {
            }
            column(TScores; "T Scores")
            {
            }
            column(TerminationCategory; "Termination Category")
            {
            }
            column(ToTime; "To Time")
            {
            }
            column(TotalScore; "Total Score")
            {
            }
            column(TotalScoreAfterInterview; "Total Score After Interview")
            {
            }
            column(TotalScoreAfterShortlisting; "Total Score After Shortlisting")
            {
            }
            column(Tribe; Tribe)
            {
            }
            column(TypeofContractRequired; "Type of Contract Required")
            {
            }
            column(Uploaded; Uploaded)
            {
            }
            column(Venue; Venue)
            {
            }
            column(WorkPhoneNumber; "Work Phone Number")
            {
            }
            column(Picture; CI.Picture) { }
            column(Name; CI.Name)
            {

            }
            column(Address; CI.Address)
            {

            }
            column(Adress2; CI."Address 2")
            {

            }
            dataitem("Application Qualification"; "Application Qualification")//qualificatons
            {
                DataItemLink = "Candidate No." = field("Candidate No.");
                DataItemLinkReference = HRJobApplications;
                DataItemTableView = sorting("Application No.", "Line No.");
                column(Application_No_; "Application No.")
                {

                }
                column(Description; Description)
                {

                }
                column(Candidate_No_; "Candidate No.")
                {

                }
                column(Institution_Company; "Institution/Company")
                {

                }
                column(Attained_Score; "Attained Score")
                {

                }
                column(Specialization; Specialization)
                {

                }
                column(Education_Level1; "Education Level")
                {

                }
                column(From_DateI; "From Date")
                {

                }
                column(To_DateI; "To Date")
                {

                }
                column(Line_No_; "Line No.")
                {

                }
                trigger OnPreDataItem()

                begin
                    "Application Qualification".SetFilter("Qualification Type", '<>%1&<>%2', 'Work Experience', 'Professional Body');
                end;


            }
            dataitem("Job Applicants Qualification"; "Job Applicants Qualification")//workexperience
            {
                DataItemLink = "Candidate No." = field("Candidate No.");
                DataItemLinkReference = HRJobApplications;
                DataItemTableView = sorting("Candidate No.", "Line No.");
                column(Job_Description_Designation; "Job Description/Designation")
                {

                }
                column(Experience_Years; "Experience Years")
                {

                }
                column(Company; "Institution/Company")
                {

                }
                column(Education_Level; "Education Level")
                {

                }
                column(From_Date; "From Date")
                {

                }
                column(To_Date; "To Date")
                {

                }
                trigger OnPreDataItem()

                begin
                    "Job Applicants Qualification".SetRange("Job Applicants Qualification"."Qualification Category", 'Work Experience');
                end;



            }
            dataitem("Job Applicants Qualification1"; "Job Applicants Qualification")//proffessional bodies
            {
                DataItemLink = "Candidate No." = field("Candidate No.");
                DataItemLinkReference = HRJobApplications;
                DataItemTableView = sorting("Candidate No.", "Line No.");
                column(Institution_b; "Institution/Company")
                {

                }
                column(Attained_Scoreb; "Attained Score")
                {

                }
                column(Qualification_Code; "Qualification Code")
                {

                }
                column(Descriptionb; Description)
                {

                }

                column(From_Dateb; "From Date")
                {

                }
                column(To_Dateb; "To Date")
                {

                }
                column(Line_No_b; "Line No.")
                {

                }
                column(Membership_Registration_No; "Membership Registration No")
                {

                }
                trigger OnPreDataItem()

                begin
                    "Job Applicants Qualification".SetRange("Job Applicants Qualification"."Qualification Category", 'Professional Body');
                end;



            }
            dataitem("Application Referees"; "Application Referees")
            {
                DataItemLink = "Candidate No." = field("Candidate No.");
                DataItemLinkReference = HRJobApplications;
                DataItemTableView = sorting("Application No.", "Candidate No.", "Line No.");
                column(DesignationRef; "Designation/Title")
                {

                }
                column(RefInstitution; Institution)
                {

                }
                column(RefEMail; "E-Mail")
                {

                }
                column(RefName; Name)
                {

                }
                trigger OnPreDataItem()

                begin
                    HRJobApplications.SetRange(HRJobApplications."Employee Requisition No", "Application No.");


                end;

            }
            // dataitem("Survey Character"; "Survey Character")
            // {
            //     DataItemLink = "Candidate No." = field("Candidate No.");
            //     DataItemLinkReference = HRJobApplications;
            //     DataItemTableView = sorting("Line No.");
            //     column(Question; Question)
            //     {

            //     }
            //     column(Respose; Respose)
            //     {

            //     }
            // }
            trigger OnPreDataItem()

            begin
                hrApp.DeleteAll();
            end;

            trigger OnAfterGetRecord()

            begin
                if hrApp.Get("Job Application No.") then
                    CurrReport.Skip();
                hrApp.init;
                hrApp."Job Application No." := "Job Application No.";
                hrApp.Insert()

            end;
        }
    }
    requestpage
    {
        layout
        {
            area(Content)
            {
                group(GroupName)
                {
                }
            }
        }
        actions
        {
            area(Processing)
            {
            }
        }
    }
    trigger OnPreReport()
    begin
        CI.Get();
        CI.CalcFields(Picture);
    end;

    var
        CI: Record "Company Information";
        hrApp: Record "HR Job Applications" temporary;



}
