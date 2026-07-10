
page 52193678 "HR Applicant Hobbies"
{
    PageType = List;
    SourceTable = "HR Applicant Hobbies";
    ApplicationArea = All;
    Caption = 'HR Applicant Hobbies';
    layout
    {
        area(Content)
        {
            repeater(Control1000000000)
            {
                field(Hobby; Rec.Hobby)
                {
                    ApplicationArea = Basic;
                    //Editable = false;
                    ToolTip = 'Specifies the value of the Hobby field.';
                }
            }
        }
    }

    actions { }
}
