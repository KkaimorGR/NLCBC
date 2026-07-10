table 52193443 "Character Setup"
{
    Caption = 'Character Setup';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Line No"; Integer)
        {
            Caption = '';
            Editable = false;
            // AutoIncrement = true;
        }
        field(2; Question; Text[300])
        {
            DataClassification = ToBeClassified;
        }
        field(3; Response; Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = " ",No,yes;
        }
        field(4; Explanation; Text[400])
        {
            DataClassification = ToBeClassified;
        }
    }
    keys
    {
        key(PK; "Line No")
        {
            Clustered = true;
        }
    }
    trigger OnInsert()
    var
        CharSetup: Record "Character Setup";
        LastLineNo: Integer;
    begin
        CharSetup.Reset();
        if CharSetup.FindLast() then
            LastLineNo := CharSetup."Line No";
        "Line No" := LastLineNo + 1;  // Or any other increment value
    end;
}
