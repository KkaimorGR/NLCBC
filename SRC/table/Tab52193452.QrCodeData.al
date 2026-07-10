 
   table 52193452 "QR Code Data"
{
    fields
    {
        field(1; "Entry No."; Integer) { AutoIncrement = true; }
        field(2; "Document No."; Code[20]) { }
        field(3; "Version No."; Integer) { }
        field(4; "Approver ID"; Code[300]) { }
        field(5; "Approval DateTime"; DateTime) { }
        field(6; "OTP Code"; Code[30]) { }
        field(7; "Location"; Text[100]) { }
        field(8; "Created DateTime"; DateTime) { }
        field(9; "Is Current"; Boolean) { }
        field(10; "Modified By"; Code[50]) { }
        field(11; "Change Description"; Text[250]) { }
    }
    keys
    {
        key(PK; "Entry No.") { Clustered = true; }
        key(DocVersion; "Document No.", "Version No.") { }
        key(Current; "Document No.", "Is Current") { }
    }
}