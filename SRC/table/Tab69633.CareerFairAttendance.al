
Table 52194043 "Career Fair Attendance"
{

    fields
    {
        field(1; "Career Fair ID"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Vacancy Announcement" where("Posting Type" = filter("Career Fair"));
        }
        field(2; "Line No."; Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
        field(3; "Attendee Type"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Potential Candidate,HR Official';
            OptionMembers = "Potential Candidate","HR Official";
        }
        field(4; "Representative Name"; Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(5; "Representative Email"; Text[50])
        {
            DataClassification = ToBeClassified;
            ExtendedDatatype = EMail;
        }
        field(6; "Representative Tel No"; Text[30])
        {
            DataClassification = ToBeClassified;
            ExtendedDatatype = PhoneNo;
        }
        field(7; "Notified on Email"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(8; "Date/Time Notified"; DateTime)
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1; "Career Fair ID", "Line No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

