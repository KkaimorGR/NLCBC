
table 52193512 "HR Leave Attachments"
{
    Caption = 'HR Leave Attachments';
    DataClassification = CustomerContent;
    fields
    {
        field(1; "Employee No"; Code[20])
        {
            NotBlank = true;
            TableRelation = "HR Leave Application"."Application Code";
            Caption = 'Employee No';
        }
        field(2; "Document Description"; Text[200])
        {
            NotBlank = true;
            Caption = 'Document Description';
        }
        field(3; "Document Link"; Text[200])
        {
            Caption = 'Document Link';
        }
        field(6; "Attachment No."; Integer)
        {
            AutoIncrement = true;
            Editable = false;
            Caption = 'Attachment No.';
        }
        field(7; "Language Code (Default)"; Code[10])
        {
            TableRelation = Language;
            Caption = 'Language Code (Default)';
        }
        field(8; Attachment; Option)
        {
            Editable = false;
            OptionMembers = No,Yes;
            Caption = 'Attachment';
        }
    }

    keys
    {
        key(Key1; "Employee No", "Document Description")
        {
            Clustered = true;
        }
    }

    fieldgroups { }

    var
        DocLink: Record "HR Employee Attachments";


    procedure PlaceFilter(prompt: Boolean; EmployeeNo: Code[10]): Boolean
    begin
        if prompt then
            SetFilter("Employee No", EmployeeNo);
    end;
}
