
table 52193994 "Disciplinary Remarks"
{
    LookupPageId = "Employee Discplinary Documents";
    Caption = 'Disciplinary Remarks';
    DataClassification = CustomerContent;
    fields
    {
        field(1; Remark; Code[50])
        {
            NotBlank = true;
            Caption = 'Remark';
        }
        field(2; Description; Text[200])
        {
            Caption = 'Description';
        }
        field(3; Comments; Text[200])
        {
            Caption = 'Comments';
        }
    }

    keys
    {
        key(Key1; Remark)
        {
            Clustered = true;
        }
    }

    fieldgroups { }
}

