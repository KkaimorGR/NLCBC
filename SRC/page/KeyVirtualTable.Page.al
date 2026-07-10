
page 50097 "Key Virtual Table"
{
    PageType = List;
    SourceTable = "Key";
    SourceTableView = where(TableNo = filter(39003900 .. 80000000),
                            "No." = const(1));
    ApplicationArea = All;
    Caption = 'Key Virtual Table';
    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field(TableNo; Rec.TableNo)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the TableNo field.';
                }
                field("No."; Rec."No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No. field.';
                }
                field(TableName; Rec.TableName)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the TableName field.';
                }
                field("Key"; Rec.Key)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Key field.';
                }
                field(Enabled; Rec.Enabled)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Enabled field.';
                }
            }
        }
    }

    actions { }
}
