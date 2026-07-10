
page 52194000 "Online Users Card"
{
    PageType = Card;
    SourceTable = "Online Users";
    ApplicationArea = All;
    Caption = 'Online Users Card';
    layout
    {
        area(Content)
        {
            group(General)
            {
                field("User Name"; Rec."User Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the User Name field.';
                }
                field(Password; Rec.Password)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Password field.';
                }
                field(Email; Rec.Email)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Email field.';
                }
                field("Date Created"; Rec."Date Created")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Date Created field.';
                }
                field("Changed Password"; Rec."Changed Password")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Changed Password field.';
                }
                field("Number Of Logins"; Rec."Number Of Logins")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Number Of Logins field.';
                }
                field("Line No"; Rec."Line No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Line No field.';
                }
                field(Password2; Rec.Password2)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Password2 field.';
                }
                field("User Image"; Rec."User Image")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the User Image field.';
                }
            }
        }
    }

    actions { }
}
