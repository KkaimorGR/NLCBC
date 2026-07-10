
tableextension 52193458 tableextension50131 extends "General Posting Setup"
{
    fields
    {
        field(39003900; "Indirect Cost Applied Account"; Code[20])
        {
            TableRelation = "G/L Account";
            Caption = 'Indirect Cost Applied Account';
            DataClassification = CustomerContent;
        }
    }
}
