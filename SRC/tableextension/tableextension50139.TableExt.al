
tableextension 52193466 tableextension50139 extends "Sales & Receivables Setup"
{
    fields
    {
        field(39003900; "Donor Nos"; Code[20])
        {
            TableRelation = "No. Series";
            Caption = 'Donor Nos';
            DataClassification = CustomerContent;
        }
    }
}
