
tableextension 52193451 tableextension50124 extends "Purch. Rcpt. Header"
{
    fields
    {
        field(39003900; Status; Option)
        {
            Caption = 'Status';
            OptionCaption = 'Open,Released,Pending Approval,Pending Prepayment,Approved';
            OptionMembers = Open,Released,"Pending Approval","Pending Prepayment",Approved;
            DataClassification = CustomerContent;
        }
    }
}
