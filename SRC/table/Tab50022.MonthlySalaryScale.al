table 52193445 "Monthly Salary Scale"
{
    Caption = 'Monthly Salary Scale';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Entry No."; Integer)
        {
            Caption = '';
        }
        field(2; "Transaction Name"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(3; Amount; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(4; "Job ID"; Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(5; Remarks; Text[300])
        {
            DataClassification = ToBeClassified;
        }

    }
    keys
    {
        key(PK; "Entry No.", "Job ID")
        {
            Clustered = true;
        }
    }
    trigger OnInsert()
    var
        myInt: Integer;
        CharSetup: Record "Monthly Salary Scale";
        LastLineNo: Integer;
    begin
        CharSetup.Reset();
        if CharSetup.FindLast() then
            LastLineNo := CharSetup."Entry No.";
        "Entry No." := LastLineNo + 1;

    end;
}
