pageextension 52193454 "Item Journal EXT" extends "Item Journal"
{
    layout
    {
        modify("Gen. Bus. Posting Group")
        {
            ApplicationArea = all;
            visible = true;
        }
        modify("Gen. Prod. Posting Group")
        {
            ApplicationArea = all;
            Visible = true;
        }

        moveafter(Quantity; "Gen. Prod. Posting Group")
        moveafter("Gen. Prod. Posting Group"; "Gen. Bus. Posting Group")

    }
}
