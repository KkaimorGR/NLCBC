
page 50065 "HR Objectives Targets SF"
{
    PageType = List;
    SourceTable = "HR Objectives Targets";
    Caption = 'HR Objectives Targets';
    // DelayedInsert = true;
    UsageCategory = Lists;
    Editable = true;
    InsertAllowed = true;
    ApplicationArea = all;
    DeleteAllowed = true;

    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field("Appraisal Code"; "Appraisal Code")
                {
                    ApplicationArea = all;

                }
                field(Type; Rec.Type)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Type field.';
                }
                field(Objectives; Rec.Objectives)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Objectives field.';
                }
                field("Performance Indicator"; Rec."Performance Indicator")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Performance Indicator field.';
                }
                field(Criteria; Rec.Criteria)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Criteria field.';
                }
                field(Period; Rec.Period)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Period field.';
                }
                field("For Next Period"; Rec."For Next Period")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the For Next Period field.';
                }
                field(Performance; Rec.Performance)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Performance field.';
                }
                field("Achievements Reviewed"; Rec."Achievements Reviewed")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Achievements Reviewed field.';
                }
                field("Target Changed Or Added"; Rec."Target Changed Or Added")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Target Changed Or Added field.';
                }
                field(Ratings; Rec.Ratings)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Ratings field.';
                }
                field("Supervisor Ratings"; Rec."Supervisor Ratings")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Supervisor Ratings field.';
                }
                field("Agreed Ratings"; Rec."Agreed Ratings")
                {
                    ApplicationArea = Basic;
                    Editable = true;
                    ToolTip = 'Specifies the value of the Agreed Ratings field.';
                }
                field("Appraisee Comments"; Rec."Appraisee Comments")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Appraisee Comments field.';
                }
                field("Supervisor Comments"; Rec."Supervisor Comments")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Supervisor Comments field.';
                }
                field("Second Supervisor Comments"; Rec."Second Supervisor Comments")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Second Supervisor Comments field.';
                }
                field(Remarks; Rec.Remarks)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Remarks field.';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Status field.';
                }
            }
        }
    }

    actions { }
}
