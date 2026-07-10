table 52193453 "Make/Model"
{
    Caption = 'Make/Model';
    DataClassification = ToBeClassified;
    DrillDownPageId = "Make /model";
    LookupPageId = "Make /model";


    fields
    {
        field(1; "Entry No"; Integer)
        {
            Caption = 'Entry No';
            AutoIncrement = true;
            Editable = false;
        }
        field(2; Type; Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = " ",Chair,Tables,"Laptops/Computers",Vehicles,Land,Building,"Office Quipment";
        }
        field(3; "Description"; Text[300])
        {
            DataClassification = ToBeClassified;
        }
    }
    keys
    {
        key(PK; "Entry No", Description)
        {
            Clustered = true;
        }
    }
    fieldgroups
    {
        fieldgroup(DropDown; Type, Description)
        {
        }
    }
}
