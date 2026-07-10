
pageextension 52193469 pageextension50142 extends "Dimension Values"
{
    layout
    {
        addafter("Map-to IC Dimension Value Code")
        {

            field("Transport Booking Period"; Rec."Transport Booking Period")
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the Transport Booking Period field.';
            }

            field("Transport Cancellation Period"; Rec."Transport Cancellation Period")
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the Transport Cancellation Period field.';
            }
        }
    }

    //Unsupported feature: Property Deletion (SaveValues).


    //Unsupported feature: Property Deletion (DelayedInsert).

}
