
table 52193706 "Proc. Method Stage Duration"
{
    Caption = 'Proc. Method Stage Duration';
    DataClassification = CustomerContent;
    fields
    {
        field(1; "Proc. Method No."; Code[20])
        {
            Caption = 'Proc. Method No.';
        }
        field(2; Stage; Code[20])
        {
            Caption = 'Stage';

        }
        field(3; "Duration(Days)"; Integer)
        {
            Caption = 'Duration(Days)';
        }
        field(4; "Sorting No."; Integer)
        {
            Caption = 'Sorting No.';

        }
        field(5; Description; Text[50])
        {
            Caption = 'Description';
        }
    }

    keys
    {
        key(Key1; Stage, "Proc. Method No.")
        {
            Clustered = true;
        }
        key(Key2; "Sorting No.") { }
    }

    fieldgroups { }

    var
        me: Record "Proc. Method Stage Duration";
    // StagesRec: Record "Loader Group";
}
