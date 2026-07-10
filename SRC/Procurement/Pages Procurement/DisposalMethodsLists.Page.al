
Page 52193560 "Disposal Methods Lists"
{
    PageType = List;
    SourceTable = "Disposal Methods";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Entry No."; "Entry No.")
                {
                    ApplicationArea = Basic;
                }
                field("Disposal Methods"; "Disposal Methods")
                {
                    ApplicationArea = Basic;
                }
                field("Disposal Description"; "Disposal Description")
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

