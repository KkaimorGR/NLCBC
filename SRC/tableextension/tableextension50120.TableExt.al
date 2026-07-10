
tableextension 52193447 tableextension50120 extends "G/L Budget Name"
{
    fields
    {
        field(50002; Status; Option)
        {
            OptionCaption = 'Open,Pending Approval,Approved';
            OptionMembers = Open,"Pending Approval",Approved;
            Caption = 'Status';
            DataClassification = CustomerContent;
        }
        field(50005; "Responsibility Center"; Code[20])
        {
            Caption = 'Responsibility Center';
            DataClassification = CustomerContent;
            // //TableRelation = Table39005929;
        }
    }


    //Unsupported feature: Code Modification on "OnDelete".

    //trigger OnDelete()
    //>>>> ORIGINAL CODE:
    //begin
    /*
    GLBudgetEntry.SETCURRENTKEY("Budget Name");
    GLBudgetEntry.SETRANGE("Budget Name",Name);
    GLBudgetEntry.DELETEALL(TRUE);

    AnalysisViewBudgetEntry.SETRANGE("Budget Name",Name);
    AnalysisViewBudgetEntry.DELETEALL(TRUE);
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*

    GLBudgetEntry.SETCURRENTKEY("Budget Name");
    GLBudgetEntry.SETRANGE("Budget Name",Name);
    IF GLBudgetEntry.FINDFIRST THEN
        ERROR('The Budget '+Name+' has Entries, Cannot be deleted');
    #3..6
    */
    //end;
}
