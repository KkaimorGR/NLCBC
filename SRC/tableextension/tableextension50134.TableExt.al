
tableextension 52193461 tableextension50134 extends "Bank Acc. Reconciliation Line"
{
    fields
    {
        field(50000; Reconciled; Boolean)
        {
            Caption = 'Reconciled';
            DataClassification = CustomerContent;

        }
        field(50004; "Open Type"; Option)
        {
            OptionCaption = ' ,Unpresented Cheques List,Uncredited Cheques List';
            OptionMembers = " ",Unpresented,Uncredited;
            Caption = 'Open Type';
            DataClassification = CustomerContent;
        }
        field(50005; "Bank Ledger Entry Line No"; Integer)
        {
            Caption = 'Bank Ledger Entry Line No';
            DataClassification = CustomerContent;
        }
        field(50006; "Bank Statement Entry Line No"; Integer)
        {
            Caption = 'Bank Statement Entry Line No';
            DataClassification = CustomerContent;
        }
    }

    //Unsupported feature: Property Deletion (Local) on "RemoveApplication(PROCEDURE 1)".

}
