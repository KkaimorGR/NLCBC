
tableextension 52193482 tableextension50155 extends "Purchase Line Archive"
{
    fields
    {
        field(50000; Committed; Boolean)
        {
            Caption = 'Committed';
            DataClassification = CustomerContent;
        }
        field(50004; "Expense Code"; Code[10])
        {
            Caption = 'Expense Code';
            DataClassification = CustomerContent;
            //TableRelation = Table39005906;

            trigger OnValidate()
            begin
                //TestStatusOpen;
                Rec.TestField(Rec.Type, Rec.Type::"G/L Account");
            end;
        }
        field(50005; "RFQ No."; Code[20])
        {
            Caption = 'RFQ No.';
            DataClassification = CustomerContent;
        }
        field(50006; "RFQ Line No."; Integer)
        {
            Description = 'ADDED THIS FIELD';
            Caption = 'RFQ Line No.';
            DataClassification = CustomerContent;
            // //TableRelation = Table39006018.Field4;
        }
        field(50007; "Order No."; Code[20])
        {
            Caption = 'Order No.';
            DataClassification = CustomerContent;
        }
        /* field(50060;Copied;Boolean)
        {
            CalcFormula = exist(Table39006018 where (Field39004244=field("Document No."),
                                                     Field39004245=field("Line No.")));
            Description = 'Copied to rfq';
            FieldClass = FlowField;
        } */
        field(51000; "RFQ Remarks"; Text[50])
        {
            Caption = 'RFQ Remarks';
            DataClassification = CustomerContent;
        }
    }
}
