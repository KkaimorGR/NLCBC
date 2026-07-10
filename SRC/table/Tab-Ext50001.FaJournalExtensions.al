tableextension 52193423 "Fa Journal Extensions" extends "FA Journal Line"
{
    fields
    {
        field(50000; "Model/Model"; Text[100])
        {
            Caption = 'Model/Model';
            DataClassification = ToBeClassified;
        }
        field(50001; "Quantity Allocated"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(50002; "Quantity Allocated2"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
    }
}
