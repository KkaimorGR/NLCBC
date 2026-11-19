
page  50064 "HR Job Qualifications"
{
    ApplicationArea = Basic;
    PageType = List;
    PromotedActionCategories = 'New,Process,Reports,Qualifications';
    SourceTable = "HR Job Qualifications";
    UsageCategory = Lists;
    Caption = 'HR Job Qualifications';
    layout
    {
        area(Content)
        {
            repeater(Control1)
            {
                field("Qualification Type"; Rec."Qualification Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Qualification Type field.';
                }
                field("Code"; Rec.Code)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Code field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field(Category; Rec.Category)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Category field.';
                }
            }
        }
    }

    actions
    {
        area(Navigation)
        {
            group(Qualification)
            {
                Caption = 'Qualification';
                action("Q&ualification Overview")
                {
                    ApplicationArea = Basic;
                    Caption = 'Q&ualification Overview';
                    Image = QualificationOverview;
                    Promoted = true;
                    PromotedCategory = Category4;
                    RunObject = page "Qualification Overview";
                    ToolTip = 'Executes the Q&ualification Overview action.';
                }
            }
        }
    }

    trigger OnOpenPage()
    begin
        // Page is also the LookupPageId for "HR Job Qualifications", so lookups must keep working for everyone.
        if not CurrPage.LookupMode() then
            if not HasHRAccess() then
                Error('You do not have permission to HR Qualification.');
    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        CheckHRAccess();
    end;

    trigger OnInsertRecord(BelowxRec: Boolean): Boolean
    begin
        CheckHRAccess();
        exit(true);
    end;

    trigger OnModifyRecord(): Boolean
    begin
        CheckHRAccess();
        exit(true);
    end;

    trigger OnDeleteRecord(): Boolean
    begin
        CheckHRAccess();
        exit(true);
    end;

    local procedure HasHRAccess(): Boolean
    var
        UserSet: Record "User Setup";
    begin
        UserSet.Reset();
        UserSet.SetRange("User ID", UserId);
        UserSet.SetRange("Edit HR Setup", true);
        exit(not UserSet.IsEmpty());
    end;

    local procedure CheckHRAccess()
    begin
        if not HasHRAccess() then
            Error('You do not have permission to HR Qualification.');
    end;
}
