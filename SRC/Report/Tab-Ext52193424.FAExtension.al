tableextension 52193424 "FA Extension" extends "FA Register"
{
    fields
    {

        field(20; "FA Location Code"; Code[10])
        {
            Caption = 'FA Location Code';
            TableRelation = "FA Location";
        }
        field(21; "Responsible Employee"; Code[20])
        {
            Caption = 'Responsible Employee';
            TableRelation = Employee;
        }
        field(22; Remarks; Text[200])
        {
            DataClassification = ToBeClassified;
        }

    }
}
