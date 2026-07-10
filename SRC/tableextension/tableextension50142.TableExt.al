
tableextension 52193469 tableextension50142 extends "Jobs Setup"
{
    fields
    {
        field(39004240; "Default Customer"; Code[20])
        {
            TableRelation = Customer;
            Caption = 'Default Customer';
            DataClassification = CustomerContent;
        }
        field(39004241; "FA WIP Nos."; Code[10])
        {
            Caption = 'FA WIP Nos.';
            TableRelation = "No. Series";
            DataClassification = CustomerContent;
        }
    }
}
