
pageextension 52193490 pageextension50163 extends "User Settings List"
{
    actions
    {
        addfirst(Processing)
        {
            action(Reset)
            {
                ApplicationArea = Basic;
                Caption = 'Reset';
                ToolTip = 'Executes the Reset action.';
            }
        }
    }

    var
        UserPersonalization: Record "User Personalization";
}
