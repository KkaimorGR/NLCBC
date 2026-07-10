
tableextension 52193491 tableextension50165 extends "Item Budget Entry"
{
    fields
    {
        field(39003900; "Posted to GL Budget"; Boolean)
        {
            Caption = 'Posted to GL Budget';
            DataClassification = CustomerContent;
        }
        field(39003901; "Gen. Bus. Posting Group"; Code[50])
        {
            Caption = 'Gen. Bus. Posting Group';
            DataClassification = CustomerContent;
        }
        field(39003902; "Transferred By"; Code[50])
        {
            Caption = 'Transferred By';
            DataClassification = CustomerContent;
        }
        field(39003903; "Date Transferred"; Date)
        {
            Caption = 'Date Transferred';
            DataClassification = CustomerContent;
        }
    }
}
