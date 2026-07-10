page 52193532 "Hodling List Area"
{
    ApplicationArea = All;
    Caption = 'Holding List Area';
    PageType = List;
    SourceTable = "Holding Area";
    CardPageId = "Hodling Area";
    UsageCategory = Lists;
    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("H Code"; Rec."H Code")
                {
                    ToolTip = 'Specifies the value of the No. field.', Comment = '%';
                }
                field("Date Captured"; Rec."Date Captured")
                {
                    ToolTip = 'Specifies the value of the Date Captured field.', Comment = '%';
                }
                field(Description; Rec.Description)
                {
                    ToolTip = 'Specifies the value of the Description field.', Comment = '%';
                }
                field(Suplier; Rec.Suplier)
                {
                    ToolTip = 'Specifies the value of the Suplier field.', Comment = '%';
                }
                field("Supplier Name"; Rec."Supplier Name")
                {
                    ToolTip = 'Specifies the value of the Supplier Name field.', Comment = '%';
                }
                field(Status; Status)
                {
                    ApplicationArea = all;
                    Editable = false;
                }
            }
        }
    }
}
