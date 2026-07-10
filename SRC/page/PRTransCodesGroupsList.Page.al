
page 52194379 "PR Trans Codes Groups - List"
{
    ApplicationArea = Basic;
    Caption = 'PR Transaction Codes Groups';
    CardPageId = "PR Trans Codes Groups - Card";
    Editable = false;
    PageType = List;
    SourceTable = "PR Trans Codes Groups";
    UsageCategory = Lists;

    layout
    {
        area(Content)
        {
            repeater(Control1102756000)
            {
                field("Group Code"; Rec."Group Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Group Code field.';
                }
                field("Group Description"; Rec."Group Description")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Group Description field.';
                }
            }
        }
    }

    actions { }
}
