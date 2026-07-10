
tableextension 52193495 "Bank Account Stat Line" extends "Bank Account Statement Line"
{
    fields
    {
        field(50000; Reconciled; Boolean)
        {
            Caption = 'Reconciled';
            DataClassification = CustomerContent;
        }
        field(50001; "Document Date"; Date)
        {
            Caption = 'Document Date';
            DataClassification = CustomerContent;
        }
        field(50002; Debit; Decimal)
        {
            CalcFormula = sum("Bank Account Statement Line"."Statement Amount" where("Statement Amount" = filter(> 0),
                                                                                      "Bank Account No." = field("Bank Account No."),
                                                                                      "Statement Line No." = field("Statement Line No.")));
            FieldClass = FlowField;
            Caption = 'Debit';
            Editable = false;
        }
        field(50003; Credit; Decimal)
        {
            CalcFormula = sum("Bank Account Statement Line"."Statement Amount" where("Statement Amount" = filter(< 0),
                                                                                      "Bank Account No." = field("Bank Account No."),
                                                                                      "Statement Line No." = field("Statement Line No.")));
            FieldClass = FlowField;
            Caption = 'Credit';
            Editable = false;
        }
        field(50004; "Open Type"; Option)
        {
            OptionCaption = ' ,Unpresented Cheques List,Uncredited Cheques List';
            OptionMembers = " ",Unpresented,Uncredited;
            Caption = 'Open Type';
            DataClassification = CustomerContent;
        }
    }
}
