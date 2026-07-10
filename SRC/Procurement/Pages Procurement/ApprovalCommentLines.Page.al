
Page 52193521 "Approval Comment Lines"
{
    PageType = List;
    SourceTable = "HR Comment Lines";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Application Code"; "Application Code")
                {
                    ApplicationArea = Basic;
                }
                field("Approver Comments"; "Approver Comments")
                {
                    ApplicationArea = Basic;
                }
            }
        }
    }

    actions
    {
    }
}

