
page 52194207 "Contract Expectation Details-L"
{
    PageType = List;
    SourceTable = "Contract Expectation Details";
    ApplicationArea = All;
    Caption = 'Contract Expectation Details-L';
    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field("Contract No"; Rec."Contract No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Contract No field.';
                }
                field("Cycle Code"; Rec."Cycle Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Cycle Code field.';
                }
                field("Cycle Stage"; Rec."Cycle Stage")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Cycle Stage field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Expectation Code"; Rec."Expectation Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Expectation Code field.';
                }
                field("Person Responsible"; Rec."Person Responsible")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Person Responsible field.';
                }
                field("Due Date"; Rec."Due Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Due Date field.';
                }
                field(Done; Rec.Done)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Done field.';
                }
                field("Date Done"; Rec."Date Done")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Date Done field.';
                }
                field("Done By"; Rec."Done By")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Done By field.';
                }
                field("%age Paid"; Rec."%age Paid")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the %age Paid field.';
                }
                field(Type; Rec.Type)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Type field.';
                }
                field("Contractor No"; Rec."Contractor No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Contractor No field.';
                }
                field("Invoice No"; Rec."Invoice No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Invoice No field.';
                }
            }
        }
    }

    actions { }
}
