
page 52194150 "Evaluation Parameter"
{
    PageType = List;
    SourceTable = "Evaluation Parameters Areas";
    ApplicationArea = All;
    Caption = 'Evaluation Parameter';
    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field("Vendor No."; Rec."Vendor No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Vendor No. field.';
                    trigger OnValidate()
                    begin
                        Vend.Reset();
                        Vend.SetRange(Vend."No.", Rec."Vendor No.");
                        if Vend.Find('-') then
                            Rec."Vendor Name" := Vend.Name;
                    end;
                }
                field("Evaluation Year"; Rec."Evaluation Year")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Evaluation Year field.';
                }
                field("Parameter Code"; Rec."Parameter Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Parameter Code field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Expected Min.Value"; Rec."Expected Min.Value")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Expected Min.Value field.';
                }
                field("Expected Max.Value"; Rec."Expected Max.Value")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Expected Max.Value field.';
                }
                field("Vendor Name"; Rec."Vendor Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Vendor Name field.';
                    trigger OnValidate()
                    begin
                        Vend.Reset();
                        Vend.SetRange(Vend."No.", Rec."Vendor No.");
                        if Vend.Find('-') then
                            Rec."Vendor Name" := Vend.Name;
                    end;
                }
            }
        }
        area(FactBoxes)
        {
            systempart(Control9; Outlook) { }
            systempart(Control10; Notes) { }
        }
    }

    actions { }

    var
        Vend: Record Vendor;
}
