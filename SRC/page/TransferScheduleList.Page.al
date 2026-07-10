
page 52193710 "Transfer Schedule List"
{
    ApplicationArea = Basic;
    CardPageId = "Transfer Schedule Card";
    DeleteAllowed = false;
    Editable = true;
    PageType = List;
    SourceTable = "Transfer Schedule 1";
    UsageCategory = Lists;
    Caption = 'Transfer Schedule List';
    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                Editable = false;
                field("Code"; Rec.Code)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Code field.';
                }
                field("Transfer Type"; Rec."Transfer Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Transfer Type field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Curent Branch"; Rec."Curent Branch")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Curent Branch field.';
                }
                field("New Branch"; Rec."New Branch")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the New Branch field.';
                }
                field("Transfer Status"; Rec."Transfer Status")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Transfer Status field.';
                }
                field(Posted; Rec.Posted)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Posted field.';
                }
            }
        }
    }

    actions { }
}
