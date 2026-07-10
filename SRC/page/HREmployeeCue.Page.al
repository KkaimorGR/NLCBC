

page 52194337 "HR Employee Cue"
{
    PageType = CardPart;
    SourceTable = "HR Employee Role Center Cue";
    ApplicationArea = All;
    Caption = 'HR Employee Cue';
    layout
    {
        area(Content)
        {
            cuegroup(Control4)
            {
                Caption = 'Employee Statistics';
                field(Active; Rec.Active)
                {
                    ApplicationArea = all;
                    Caption = 'Active With Gender';
                    ToolTip = 'Specifies the value of the Active Employees With Gender field having a value.';
                }
                field(Female; Rec.Female)
                {
                    ApplicationArea = all;
                    ToolTip = 'Specifies the value of the Active Female Employee.';
                }
                field(Male; Rec.Male)
                {
                    ApplicationArea = all;
                    ToolTip = 'Specifies the value of the Male field.';
                }
                field("Active Employees"; Rec."Active Employees")
                {
                    ApplicationArea = all;
                    Caption = 'All Active Employees';
                    ToolTip = 'Specifies the value of the Active Employees';
                }
            }
        }
    }
    trigger OnOpenPage()
    var
        myInt: Integer;
    begin
        // rec.code := '';
        Rec.Reset();
        if not Rec.Get() then begin
            Rec.Init();
            Rec.Insert();
        end;
        rec.CalcFields(Active, Female, Male, "Active Employees");
    end;

    // trigger OnAfterGetRecord()
    // var
    //     myInt: Integer;
    // begin
    //     rec.CalcFields(Active, Female, Male);
    // end;

    // trigger OnAfterGetCurrRecord()
    // var
    //     myInt: Integer;
    // begin
    //     rec.CalcFields(Active, Female, Male);

    // end;

}

#pragma implicitwith restore
