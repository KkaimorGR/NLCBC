
page 52193807 "Record Link View"
{
    PageType = List;
    SourceTable = "Record Link";
    ApplicationArea = All;
    Caption = 'Record Link View';
    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field("Link ID"; Rec."Link ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Link ID field.';
                }
                field("FORMAT(""Record ID"")"; Format(Rec."Record ID"))
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Record ID) field.';
                }
                field(URL1; Rec.URL1)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the URL1 field.';
                }
                /* field(URL2;Rec.URL2)
                {
                    ApplicationArea = Basic;
                }
                field(URL3;Rec.URL3)
                {
                    ApplicationArea = Basic;
                }
                field(URL4;Rec.URL4)
                {
                    ApplicationArea = Basic;
                } */
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field(Type; Rec.Type)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Type field.';
                }
                field(Note; Rec.Note)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Note field.';
                }
                field(Created; Rec.Created)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Created field.';
                }
                field("User ID"; Rec."User ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the User ID field.';
                }
                field(Company; Rec.Company)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Company field.';
                }
                field(Notify; Rec.Notify)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Notify field.';
                }
                field("To User ID"; Rec."To User ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the To User ID field.';
                }
                /* field("Document No";"Document No")
                {
                    ApplicationArea = Basic;
                } */
            }
        }
    }

    actions { }
}
