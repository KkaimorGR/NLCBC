
page 52193942 "RFQ Subform"
{
    PageType = ListPart;
    SourceTable = "Purchase Quote Line";
    ApplicationArea = All;
    Caption = 'RFQ Subform';
    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field(Type; Rec.Type)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Type field.';
                }
                field("Expense Code"; Rec."Expense Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Expense Code field.';
                }
                field("No."; Rec."No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No. field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Description 2"; Rec."Description 2")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description 2 field.';
                }
                field("Unit of Measure"; Rec."Unit of Measure")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Unit of Measure field.';
                }
                field(Quantity; Rec.Quantity)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Quantity field.';
                }
                field("Direct Unit Cost"; Rec."Direct Unit Cost")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Direct Unit Cost field.';
                }
                field(Amount; Rec.Amount)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Amount field.';
                }
                field("PRF No"; Rec."PRF No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the PRF No field.';
                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action("Set Specification")
            {
                ApplicationArea = Basic;
                Caption = 'Set Specification';
                ToolTip = 'Executes the Set Specification action.';
                trigger OnAction()
                var
                    PParams: Record "Purchase Quote Params";
                begin
                    PParams.Reset();
                    PParams.SetRange(PParams."Document Type", Rec."Document Type");
                    PParams.SetRange(PParams."Document No.", Rec."Document No.");
                    PParams.SetRange(PParams."Line No.", Rec."Line No.");
                    Page.Run(39006071, PParams);
                end;
            }
        }
    }
}
