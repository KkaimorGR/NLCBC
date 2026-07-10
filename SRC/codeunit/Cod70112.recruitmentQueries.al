codeunit 52193513 recruitmentQueries
{
    trigger OnRun()
    begin

    end;

    var
        //recruitmentRequisitionHeader: Record "Recruitment Requisition Header";
        tbl_dynasoftPortalUser: Record "Dynasoft Portal User";

        tbl_counties: Record "HR Lookup Values";
        tbl_applicant: Record Applicant;
        tbl_jobRequirements: Record "Recruitment Req Requirement";

        tbl_HRQualification: Record Qualification;
        tbl_countries: Record "Country/Region";
        //tbl_counties: Record County;
        tbl_ethnicity: Record "HR Lookup Values";
        tbl_postCodes: Record "Post Code";
        tbl_specializationAreas: Record "Domain Area";
        tbl_jobQualication: Record "Job Applicants Qualification";
        tbl_qualification: Record "HR Job Qualifications";
        tbl_referees: Record "Employee_Applicant Referees";
        tbl_jobResponsibility: Record "Recruitment Req Responsibility";
        tbl_requirementCheckList: Record "Requirements Checklist";
        tbl_workConditions: Record "Recruitment Req Work Condition";
        tbl_jobApplications: Record "Job Applications";

    //tbl_profile:Record "Applicant Profile";

    // procedure fnGetAdvertisedVacancies() data: Text
    // var
    //     HRemployeeRequistion: Record "HR Employee Requisitions";
    //     Datum: JsonObject;
    //     DataA: JsonArray;
    //     ResponseObject: JsonObject;
    //     Response: Text;
    // begin
    //     HRemployeeRequistion.Reset();
    //     HRemployeeRequistion.SetRange(Status, HRemployeeRequistion.Status::Approved);
    //     HRemployeeRequistion.SetRange(Advertised, true);
    //     HRemployeeRequistion.SetRange(Closed, false);
    //     if HRemployeeRequistion.FindSet() then
    //         repeat
    //             Datum.Add('Job_Id', HRemployeeRequistion."Job ID");
    //             Datum.Add('Requisition_no', HRemployeeRequistion."Requisition No.");
    //             Datum.Add('Requisition Date', Format(HRemployeeRequistion."Requisition Date"));
    //             Datum.Add('Job_Grade', HRemployeeRequistion."Job Grade");
    //             Datum.Add('Job_Title', HRemployeeRequistion."Job Description");
    //             Datum.Add('Date_Approved', Format(HRemployeeRequistion."Date Approved"));
    //             Datum.Add('Job_Supervisor', Format(HRemployeeRequistion."Job Supervisor/Manager"));
    //             Datum.Add('Closing_Date', Format(HRemployeeRequistion."Closing Date"));
    //             Datum.Add('Required_Positions', Format(HRemployeeRequistion."Required Positions"));
    //             Datum.Add('Responsibility_Center', HRemployeeRequistion."Responsibility Center");
    //             Datum.Add('Status', HRemployeeRequistion.Status);
    //             Datum.Add('Type_of_Contract', Format(HRemployeeRequistion."Type of Contract Required"));
    //             Datum.Add('Directorate', HRemployeeRequistion."Global Dimension 2 Code");
    //             Datum.Add('Reason_For_Request', HRemployeeRequistion."Reason For Request");
    //             Datum.Add('Advertised', HRemployeeRequistion.Advertised);
    //             DataA.Add(Datum);
    //             Datum.ReadFrom('{}');
    //         //data += HRemployeeRequistion."Vacancy Announcement ID" + '*' + recruitmentRequisitionHeader."Vacancy No" + '*' + Format(recruitmentRequisitionHeader."Vacancy Status") + '*' + Format(recruitmentRequisitionHeader."Approval Status") + '*' + Format(recruitmentRequisitionHeader."Duty Station ID") + '*' + Format(HRemployeeRequistion."Hierarchically Reports To") + '*' + Format(HRemployeeRequistion."Target Candidate Source") + '*' + Format(HRemployeeRequistion."Estimate Annual Salary") + '*' + Format(HRemployeeRequistion."No of Openings") + '*' + Format(HRemployeeRequistion."Target Candidate Source") + '*' + Format(HRemployeeRequistion."Position ID") + '*' + Format(HRemployeeRequistion.Directorate) + '*' + Format(HRemployeeRequistion.Department) + '*' + Format(HRemployeeRequistion."Default Terms of Service Code") + '*' + Format(HRemployeeRequistion."Seniority Level") + '*' + Format(HRemployeeRequistion."Application Procedure 1") + '*' + Format(HRemployeeRequistion."Application Procedure 2") + '*' + Format(HRemployeeRequistion."Application Procedure 3") + '::::';
    //         until HRemployeeRequistion.Next = 0;
    //     // ResponseObject.Add('status', 'SUCCESS');
    //     // ResponseObject.Add('description', 'Request is successful');
    //     ResponseObject.Add('data', DataA);
    //     AddDateTimeToResponse(ResponseObject);
    //     ResponseObject.WriteTo(Response);
    //     exit(Response);
    // end;
    procedure Getmonthlysalaryscale(JobId: Code[40]) data: text
    var
        myInt: Integer;
        MonthySalaey: Record "Monthly Salary Scale";
    begin
        MonthySalaey.Reset();
        MonthySalaey.SetRange("Job ID", JobId);
        if MonthySalaey.FindSet() then begin
            repeat
                data += Format(MonthySalaey."Entry No.") + '*' + MonthySalaey."Transaction Name" + '*' + Format(MonthySalaey.Amount) + '*' + Format(MonthySalaey."Job ID") + '*' + Format(MonthySalaey.Remarks) + '::::';
            until MonthySalaey.Next() = 0;
        end;

    end;

    procedure fnGetInternalAdvertisedVacancies() data: Text
    var
        HRemployeeRequistion: Record "HR Employee Requisitions";
    begin
        HRemployeeRequistion.Reset();
        HRemployeeRequistion.SetRange(Status, HRemployeeRequistion.Status::Approved);
        HRemployeeRequistion.SetFilter("Requisition Type", '<>%1', HRemployeeRequistion."Requisition Type"::External);
        HRemployeeRequistion.SetRange(Advertised, true);
        HRemployeeRequistion.SetRange(Closed, false);
        if HRemployeeRequistion.FindSet then begin
            repeat
                data += HRemployeeRequistion."Job ID" + '*' + HRemployeeRequistion."Requisition No." + '*' + Format(HRemployeeRequistion."Requisition Date") + '*' + HRemployeeRequistion."Job Grade" + '*' + HRemployeeRequistion."Job Description" + '*' + Format(HRemployeeRequistion."Date Approved") + '*' + Format(HRemployeeRequistion."Closing Date") + '*' + Format(HRemployeeRequistion."Vacant Positions") + '*' + HRemployeeRequistion."Requisition No." + '*' + Format(HRemployeeRequistion.status) + '*' + Format(HRemployeeRequistion.status) + '*' + Format(HRemployeeRequistion."Responsibility Center") + '*' + Format(HRemployeeRequistion."Type of Contract Required") + '*' + Format(HRemployeeRequistion."Requisition Type") + '::::';
            until HRemployeeRequistion.Next = 0;
        end;
        exit(data);
    end;

    procedure fnGetAdvertisedVacancies() data: Text
    var
        HRemployeeRequistion: Record "HR Employee Requisitions";
    begin
        HRemployeeRequistion.Reset();
        HRemployeeRequistion.SetRange(Status, HRemployeeRequistion.Status::Approved);
        HRemployeeRequistion.SetFilter("Requisition Type", '<>%1', HRemployeeRequistion."Requisition Type"::Internal);
        HRemployeeRequistion.SetRange(Advertised, true);
        HRemployeeRequistion.SetRange(Closed, false);
        if HRemployeeRequistion.FindSet then begin
            repeat
                data += HRemployeeRequistion."Job ID" + '*' + HRemployeeRequistion."Requisition No." + '*' + Format(HRemployeeRequistion."Requisition Date") + '*' + HRemployeeRequistion."Job Grade" + '*' + HRemployeeRequistion."Job Description" + '*' + Format(HRemployeeRequistion."Date Approved") + '*' + Format(HRemployeeRequistion."Closing Date") + '*' + Format(HRemployeeRequistion."Vacant Positions") + '*' + HRemployeeRequistion."Requisition No." + '*' + Format(HRemployeeRequistion.status) + '*' + Format(HRemployeeRequistion.status) + '*' + Format(HRemployeeRequistion."Responsibility Center") + '*' + Format(HRemployeeRequistion."Type of Contract Required") + '*' + Format(HRemployeeRequistion."Requisition Type") + '::::';
            until HRemployeeRequistion.Next = 0;
        end;
        exit(data);
    end;

    local procedure AddDateTimeToResponse(var ResponseObject: JsonObject)
    var
        GlobalFunctions: Codeunit "Global Functions";
    begin
        ResponseObject.Add('date_time', GlobalFunctions.FormatISODateTime(CurrentDateTime));
    end;

    procedure fnGetPortalUser(email: Text; password: Text; Type: text; Idnumber: Code[40]) data: Text
    begin
        tbl_applicant.Reset();
        tbl_dynasoftPortalUser.Reset();
        if Type = 'Member Email' then begin
            tbl_applicant.SetRange("E-Mail", email);
            tbl_dynasoftPortalUser.SetRange("Authentication Email", email);
        end else if Type = 'ID Number' then
                tbl_dynasoftPortalUser.SetRange("Id Number", Idnumber);
        tbl_dynasoftPortalUser.SetRange("Password Value", password);
        tbl_dynasoftPortalUser.SetRange("Record Type", tbl_dynasoftPortalUser."Record Type"::"Job Applicant");
        if tbl_dynasoftPortalUser.FindSet(true) and tbl_applicant.FindSet(true) then begin
            data := 'success*' + tbl_applicant."Full Names" + '*' + tbl_applicant."Mobile Phone No." + '*' + Format(tbl_applicant."Profile Completed") + '*' + tbl_dynasoftPortalUser."Authentication Email" + '*' + tbl_dynasoftPortalUser."Record ID" + '*' + Format(tbl_applicant."Passport No.") + '*' + tbl_applicant."First Name" + '*' + tbl_applicant."Middle Name" + '*' + tbl_applicant."Last Name" + '*' + Format(tbl_dynasoftPortalUser.State) + '*' + Format(tbl_dynasoftPortalUser."Change Password") + '::::';
            exit(data);

        end else begin
            data := 'danger* Sorry, You have entered the wrong password or userName. Kindly try again'
        end;

    end;

    procedure fnGetJobVacancyRequirements(var AppliNU: Code[30]) data: Text
    var
        JobReq: record "HR Job Requirements";
        JObAppli: Record "HR Employee Requisitions";
    begin
        JObAppli.Reset();
        JObAppli.SetRange("Requisition No.", AppliNU);
        if JObAppli.FindFirst() then begin
            JobReq.Reset();
            JobReq.SetRange(JobReq."Job ID", JObAppli."Job ID");
            // JobReq.SetRange("Document Type", JobReq."Document Type"::"Job Vacancy");
            if JobReq.FindSet(true) then begin
                repeat
                    data += Format(JobReq."Document Type") + '*' + Format(JobReq."Job ID") + '*' + Format(JobReq."Qualification Type") + '*' + Format(JobReq."Qualification Code") + '*' + JobReq."Qualification Description" + '::::';
                until JobReq.Next = 0;
            end;
            exit(data);
        end;
    end;

    procedure fnGetJobVacancyAcademicRequirements() data: Text
    begin
        tbl_jobRequirements.Reset();
        tbl_jobRequirements.SetRange("Document Type", tbl_jobRequirements."Document Type"::"Job Vacancy");
        tbl_jobRequirements.SetRange(tbl_jobRequirements."Qualification Category", tbl_jobRequirements."Qualification Category"::Academic);
        if tbl_jobRequirements.FindSet(true) then begin
            repeat
                data += Format(tbl_jobRequirements."Document Type") + '*' + Format(tbl_jobRequirements."Document No.") + '*' + Format(tbl_jobRequirements."Requirement Type") + '*' + Format(tbl_jobRequirements."Qualification Category") + '*' + tbl_jobRequirements.Description + '::::';
            until tbl_jobRequirements.Next = 0;
        end;
        exit(data);
    end;

    procedure fnGetHRQualifications() data: Text
    begin
        tbl_HRQualification.Reset();
        tbl_HRQualification.SetRange(tbl_HRQualification."Qualification Category", tbl_HRQualification."Qualification Category"::Professional);
        if tbl_HRQualification.FindSet(true) then begin
            repeat
                data += Format(tbl_HRQualification.Code) + '*' + Format(tbl_HRQualification.Description) + '::::';
            until tbl_HRQualification.Next = 0;
        end;
        exit(data);
    end;

    procedure fnGetJobVacancyProfessionalRequirements() data: Text
    begin
        tbl_jobRequirements.Reset();
        tbl_jobRequirements.SetRange("Document Type", tbl_jobRequirements."Document Type"::"Job Vacancy");
        tbl_jobRequirements.SetRange(tbl_jobRequirements."Qualification Category", tbl_jobRequirements."Qualification Category"::Professional);
        if tbl_jobRequirements.FindSet(true) then begin
            repeat
                data += Format(tbl_jobRequirements."Document Type") + '*' + Format(tbl_jobRequirements."Document No.") + '*' + Format(tbl_jobRequirements."Requirement Type") + '*' + Format(tbl_jobRequirements."Qualification Category") + '*' + tbl_jobRequirements.Description + '::::';
            until tbl_jobRequirements.Next = 0;
        end;
        exit(data);
    end;

    procedure fnGetJobVacancyCoreCompetenciesRequirements() data: Text
    begin
        tbl_jobRequirements.Reset();
        tbl_jobRequirements.SetRange("Document Type", tbl_jobRequirements."Document Type"::"Job Vacancy");
        tbl_jobRequirements.SetRange(tbl_jobRequirements."Qualification Category", tbl_jobRequirements."Qualification Category"::"Skills & Competencies");
        if tbl_jobRequirements.FindSet(true) then begin
            repeat
                data += Format(tbl_jobRequirements."Document Type") + '*' + Format(tbl_jobRequirements."Document No.") + '*' + Format(tbl_jobRequirements."Requirement Type") + '*' + Format(tbl_jobRequirements."Qualification Category") + '*' + tbl_jobRequirements.Description + '::::';
            until tbl_jobRequirements.Next = 0;
        end;
        exit(data);
    end;

    procedure fnGetJobVacancyEthicsRequirements() data: Text
    begin
        tbl_jobRequirements.Reset();
        tbl_jobRequirements.SetRange("Document Type", tbl_jobRequirements."Document Type"::"Job Vacancy");
        tbl_jobRequirements.SetRange(tbl_jobRequirements."Qualification Category", tbl_jobRequirements."Qualification Category"::"Ethics & Integrity");
        if tbl_jobRequirements.FindSet(true) then begin
            repeat
                data += Format(tbl_jobRequirements."Document Type") + '*' + Format(tbl_jobRequirements."Document No.") + '*' + Format(tbl_jobRequirements."Requirement Type") + '*' + Format(tbl_jobRequirements."Qualification Category") + '*' + tbl_jobRequirements.Description + '::::';
            until tbl_jobRequirements.Next = 0;
        end;
        exit(data);
    end;

    procedure fnGetCountries() data: Text
    begin
        tbl_countries.Reset();
        repeat
            data += tbl_countries.Code + '*' + tbl_countries.Name + '::::';
        until tbl_countries.Next = 0;
        exit(data);
    end;

    procedure fnGetSpecializationAreas() data: Text
    var
        tbl_specializationAreas: Record Qualification;
    // TableRelation = "HR Lookup Values".Code where(Type = filter("Qualification Type"));
    //         Caption = 'Qualification Type';
    begin
        tbl_specializationAreas.Reset();
        repeat
            data += tbl_specializationAreas.Code + '*' + tbl_specializationAreas.Description + '::::';
        until tbl_specializationAreas.Next = 0;
        exit(data);
    end;

    procedure fnGetPostCodes() data: Text
    begin
        tbl_postCodes.Reset();
        repeat
            data += tbl_postCodes.code + '*' + tbl_postCodes.City + '::::';
        until tbl_postCodes.Next = 0;
        exit(data);
    end;

    procedure fnGetCounties() data: Text
    begin
        tbl_counties.Reset();
        tbl_counties.SetRange(tbl_counties.type, tbl_counties.type::County);
        repeat
            data += tbl_counties.code + '*' + tbl_counties.Description + '::::';
        until tbl_counties.Next = 0;
        exit(data);
    end;

    procedure fnGetEthnicity() data: Text
    begin
        tbl_ethnicity.Reset();
        tbl_ethnicity.SetRange(tbl_ethnicity.type, tbl_ethnicity.type::Tribe);
        repeat
            data += tbl_ethnicity.Code + '*' + tbl_ethnicity.Description + '::::';
        until tbl_ethnicity.Next = 0;
        exit(data);
    end;

    procedure fnGetJobApplicantsQualification(applicantNumber: Code[20]) data: Text
    var
        JobApplicantsQualification: Record "Application Qualification";

    begin
        JobApplicantsQualification.Reset();
        JobApplicantsQualification.SetRange("Candidate No.", applicantNumber);
        if JobApplicantsQualification.FindSet(true) then begin
            repeat
                data += JobApplicantsQualification."Candidate No." + '*' + Format(JobApplicantsQualification."Qualification Type") + '*' + JobApplicantsQualification."Institution/Company" + '*' + JobApplicantsQualification.Country + '*' + JobApplicantsQualification."Specialized Domain Area" + '*' + Format(JobApplicantsQualification."Attained Score") + '*' + Format(JobApplicantsQualification."Graduation Year") + '*' + Format(JobApplicantsQualification."From Date") + '*' + Format(JobApplicantsQualification."To Date") + '*' + Format(JobApplicantsQualification."Line No.") + '*' + JobApplicantsQualification."Job Description/Designation" + '*' + Format(JobApplicantsQualification."Terms of Service") + '*' + Format(JobApplicantsQualification."Experience Years") + '*' + Format(JobApplicantsQualification."Duties and Resposibilities") + '*' + Format(JobApplicantsQualification."Membership Registration No") + '*' + Format(JobApplicantsQualification."Membership Type") + '*' + Format(JobApplicantsQualification."Member Renewal Date") + '*' + Format(JobApplicantsQualification."Licensing Number") + '*' + Format(JobApplicantsQualification."Licensing Renewal Date") + '*' + Format(JobApplicantsQualification."Education Level") + '*' + Format(JobApplicantsQualification."Proffessional Qualification") + '*' + JobApplicantsQualification.Description + '*' + Format(JobApplicantsQualification."Membership Type") + '::::';
            until JobApplicantsQualification.Next = 0;
        end;
        exit(data);
    end;

    procedure fnGetProffessionaBodiesQualification(applicantNumber: Code[20]) data: Text
    var
        JobApplicantsQualification: Record "Job Applicants Qualification";

    begin
        JobApplicantsQualification.Reset();
        JobApplicantsQualification.SetRange("Candidate No.", applicantNumber);
        JobApplicantsQualification.SetRange("Qualification Category", 'Professional Body');
        if JobApplicantsQualification.FindSet(true) then begin
            repeat
                data += JobApplicantsQualification."Candidate No." + '*' + Format(JobApplicantsQualification."Qualification Category") + '*' + JobApplicantsQualification."Institution/Company" + '*' + JobApplicantsQualification.Country + '*' + JobApplicantsQualification."Specialized Domain Area" + '*' + Format(JobApplicantsQualification."Attained Score") + '*' + Format(JobApplicantsQualification."Graduation Year") + '*' + Format(JobApplicantsQualification."From Date") + '*' + Format(JobApplicantsQualification."To Date") + '*' + Format(JobApplicantsQualification."Line No.") + '*' + JobApplicantsQualification."Job Description/Designation" + '*' + Format(JobApplicantsQualification."Terms of Service") + '*' + Format(JobApplicantsQualification."Experience Years") + '*' + Format(JobApplicantsQualification."Duties and Resposibilities") + '*' + Format(JobApplicantsQualification."Membership Registration No") + '*' + Format(JobApplicantsQualification."Membership Type") + '*' + Format(JobApplicantsQualification."Member Renewal Date") + '*' + Format(JobApplicantsQualification."Licensing Number") + '*' + Format(JobApplicantsQualification."Licensing Renewal Date") + '*' + Format(JobApplicantsQualification."Education Level") + '*' + Format(JobApplicantsQualification."Proffessional Qualifications") + '*' + JobApplicantsQualification."Qualification Code" + '*' + Format(JobApplicantsQualification."Membership Type") + '::::';
            until JobApplicantsQualification.Next = 0;
        end;
        exit(data);
    end;

    procedure FnInsertsurveycharacter(CandidateN: Code[40]; Queastio: Text; Response: Option; Explanation: Text) Status: Text
    var
        myInt: Integer;
        SurveyCode: Record "Survey Character";
    begin
        SurveyCode.Reset();
        SurveyCode.SetRange("Candidate No.", CandidateN);
        SurveyCode.SetRange(Question, Queastio);
        if SurveyCode.FindFirst() then begin
            SurveyCode.Respose := Response;
            SurveyCode.Explanation := Explanation;
            SurveyCode.Modify();
            Status := 'Success* Character changed successfully';
        end else begin
            SurveyCode.Reset();
            if SurveyCode.FindLast() then begin
                SurveyCode.Init();
                SurveyCode."Line No." := SurveyCode."Line No." + 1;
                SurveyCode."Candidate No." := CandidateN;
                SurveyCode.Question := Queastio;
                SurveyCode.Respose := Response;
                SurveyCode.Explanation := Explanation;
                if SurveyCode.Insert() then
                    Status := 'Success* Character Inserted successfully'
                else
                    Status := 'Danger*failed to insert';
            end else begin
                SurveyCode.Init();
                SurveyCode."Candidate No." := CandidateN;
                SurveyCode.Question := Queastio;
                SurveyCode.Respose := Response;
                SurveyCode.Explanation := Explanation;
                if SurveyCode.Insert() then
                    Status := 'Success* Character Inserted successfully'
                else
                    Status := 'Danger*failed to insert';

            end;
        end;
        exit(Status);
    end;

    procedure fnGetFnWorkExperienceQualification(applicantNumber: Code[20]) data: Text
    var
        JobApplicantsQualification: Record "Job Applicants Qualification";

    begin
        JobApplicantsQualification.Reset();
        JobApplicantsQualification.SetRange("Candidate No.", applicantNumber);
        JobApplicantsQualification.SetRange("Qualification Category", 'Work Experience');
        if JobApplicantsQualification.FindSet(true) then begin
            repeat
                data += JobApplicantsQualification."Candidate No." + '*' + Format(JobApplicantsQualification."Membership Type") + '*' + JobApplicantsQualification."Institution/Company" + '*' + JobApplicantsQualification.Country + '*' + JobApplicantsQualification."Specialized Domain Area" + '*' + Format(JobApplicantsQualification."Attained Score") + '*' + Format(JobApplicantsQualification."Graduation Year") + '*' + Format(JobApplicantsQualification."From Date") + '*' + Format(JobApplicantsQualification."To Date") + '*' + Format(JobApplicantsQualification."Line No.") + '*' + JobApplicantsQualification."Job Description/Designation" + '*' + Format(JobApplicantsQualification."Terms of Service") + '*' + Format(JobApplicantsQualification."Experience Years") + '*' + Format(JobApplicantsQualification."Duties and Resposibilities") + '*' + Format(JobApplicantsQualification."Membership Registration No") + '*' + Format(JobApplicantsQualification."Membership Type") + '*' + Format(JobApplicantsQualification."Member Renewal Date") + '*' + Format(JobApplicantsQualification."Licensing Number") + '*' + Format(JobApplicantsQualification."Licensing Renewal Date") + '*' + Format(JobApplicantsQualification."Education Level") + '*' + Format(JobApplicantsQualification."Proffessional Qualifications") + '*' + JobApplicantsQualification."Qualification Code" + '*' + Format(JobApplicantsQualification."Membership Type") + '::::';
            until JobApplicantsQualification.Next = 0;
        end;
        exit(data);
    end;


    procedure fnGetQualifications() data: Text
    var
        HrVlookups: Record "HR Lookup Values";
    begin
        HrVlookups.Reset();
        HrVlookups.SetRange(Type, HrVlookups.Type::"Qualification Type");
        repeat
            data += HrVlookups.Code + '*' + HrVlookups.Description + '*' + Format(HrVlookups.Level) + '::::';
        until HrVlookups.Next = 0;
        exit(data);
    end;

    procedure fnGetApplicantProfile(ApplicantNumber: Code[20]) data: Text
    begin
        tbl_applicant.Reset();
        tbl_applicant.SetRange("Candidate No.", ApplicantNumber);
        if tbl_applicant.FindSet(true) then begin
            repeat
                data += Format(tbl_applicant.Tittles) + '*' + Format(tbl_applicant.Disabled) + '*' + Format(tbl_applicant.City) + '*' + Format(tbl_applicant.Gender) + '*' + Format(tbl_applicant."E-Mail") + '*' + Format(tbl_applicant."First Name") + '*' + Format(tbl_applicant."County of Birth") + '*' + Format(tbl_applicant."Disability Description") + '*' + Format(tbl_applicant."Middle Name") + '*' + Format(tbl_applicant."Last Name") + '*' + Format(tbl_applicant."ID Number") + '*' + Format(tbl_applicant."Passport No.") + '*' + Format(tbl_applicant.Nationality) + '*' + Format(tbl_applicant.Religion) + '*' + Format(tbl_applicant."Post Code") + '*' + Format(tbl_applicant."Ethnic Group") + '*' + Format(tbl_applicant."Mobile Phone No.") + '*' + Format(tbl_applicant."Marital Status") + '*' + Format(tbl_applicant.Address) + '*' + Format(tbl_applicant."Disability Certificate No") + '*' + tbl_applicant."KRA Pin" + '*' + Format(tbl_applicant."Birth Date") + '*' + Format(tbl_applicant."NSSF No") + '*' + Format(tbl_applicant."NHIF No") + '*' + Format(tbl_applicant."Full Names") + '*' + Format(tbl_applicant."Specialization Area") + '*' + Format(tbl_applicant."Skills & Competences") + '*' + Format(tbl_applicant."Highest Academic Qualification") + '*' + Format(tbl_applicant."Management Experience (Years)") + '*' + Format(tbl_applicant."Work Experience (Years)") + '*' + Format(tbl_applicant."County of Residence") + '*' + Format(tbl_applicant."Marital Status") + '*' + Format(tbl_applicant.Nationality) + '*' + Format(tbl_applicant.Religion) + '*' + Format(tbl_applicant."County of Residence") + '*' + Format(tbl_applicant."Country/Region Code") + '*' + Format(tbl_applicant."Disability Certificate No") + '*' + Format(tbl_applicant."Disability Description") + '*' + Format(tbl_applicant."Disability Description") + '*' + Format(tbl_applicant."Phone No.") + '::::';
            until tbl_applicant.Next = 0;
        end;
        exit(data);

    end;

    procedure fnGetApplicantReferees(applicantNumber: Code[20]) data: Text
    begin
        tbl_referees.Reset();
        tbl_referees.SetRange("No.", applicantNumber);
        if tbl_referees.FindSet(true) then begin
            repeat
                data += Format(tbl_referees."Line No.") + '*' + Format(tbl_referees."Rererence Type") + '*' + Format(tbl_referees.Name) + '*' + Format(tbl_referees."Designation/Title") + '*' + Format(tbl_referees.Institution) + '*' + Format(tbl_referees."E-Mail") + '*' + Format(tbl_referees."Phone No.") + '*' + Format(tbl_referees.Relationship) + '*' + Format(tbl_referees."Country/Region Code") + '*' + Format(tbl_referees."Contact Years Known") + '*' + Format(tbl_referees.Salution) + '::::';
            until tbl_referees.Next = 0;
        end;
        exit(data);

    end;

    procedure fnGetJobResponsibility(var RequestNo: Code[30]) data: Text
    var
        HrRespo: Record "HR Job Responsiblities";
    begin
        HrRespo.Reset();
        HrRespo.SetRange(HrRespo."Job ID", RequestNo);
        // HrRespo.SetRange(HrRespo."Document Type", HrRespo."Document Type"::"Job Vacancy");
        if HrRespo.FindSet(true) then begin
            repeat
                data += Format(HrRespo."Request No") + '*' + Format(HrRespo."Document Type") + '*' + Format(HrRespo.Remarks) + '*' + Format(HrRespo."Responsibility Description") + '*' + Format(HrRespo."Responsibility Code") + '::::';
            until HrRespo.Next = 0;
        end;
        exit(data);
    end;

    procedure fnGetRequirementCheckList() data: Text
    begin
        tbl_requirementCheckList.Reset();
        repeat
            data += tbl_requirementCheckList."Vacancy No." + '*' + Format(tbl_requirementCheckList."Qualification Category") + '*' + Format(tbl_requirementCheckList.Description) + '*' + Format(tbl_requirementCheckList."Requirement Type") + '*' + Format(tbl_requirementCheckList."Rating Type") + '::::';
        until tbl_requirementCheckList.Next = 0;
        exit(data);
    end;

    procedure fnGetWorkConditions() data: Text
    begin
        tbl_workConditions.Reset();
        tbl_workConditions.SetRange("Document Type", tbl_workConditions."Document Type"::"Job Vacancy");
        if tbl_workConditions.FindSet(true) then begin
            repeat
                data += Format(tbl_workConditions."Document No") + '*' + Format(tbl_workConditions."Document Type") + '*' + Format(tbl_workConditions."Working Condition Category") + '*' + tbl_workConditions.Description + '::::';
            until tbl_workConditions.Next = 0;
        end;

    end;

    procedure fnGetMyJobApplications(applicantNumber: Code[30]) data: Text
    begin
        tbl_jobApplications.Reset();
        tbl_jobApplications.SetRange("Candidate No.", applicantNumber);
        if tbl_jobApplications.FindSet(true) then begin
            repeat
                data += format(tbl_jobApplications."Application No.") + '*' + Format(tbl_jobApplications."Application Status") + '*' + Format(tbl_jobApplications."Vacancy Id") + '*' + Format(tbl_jobApplications."Professional Summary") + '*' + Format(tbl_jobApplications."Job Title/Designation") + '::::';
            until tbl_jobApplications.Next = 0;
        end;
        exit(data);
    end;


}