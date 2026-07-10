
tableextension 52193475 tableextension50148 extends "Approval Comment Line"
{
    fields
    {

        //Unsupported feature: Property Modification (OptionString) on ""Document Type"(Field 3)".


        //Unsupported feature: Property Deletion (OptionCaptionML) on ""Document Type"(Field 3)".

        field(39003900; "Approved Days"; Decimal)
        {
            Caption = 'Approved Days';
            DataClassification = CustomerContent;
        }
        field(39003901; "Approved Start Date"; Date)
        {
            Caption = 'Approved Start Date';
            DataClassification = CustomerContent;
        }
        field(39003902; "Approved Return Date"; Date)
        {
            Caption = 'Approved Return Date';
            DataClassification = CustomerContent;
        }
        field(39003903; Reason; Text[100])
        {
            Caption = 'Reason';
            DataClassification = CustomerContent;
        }
        field(39003904; "Leave Allowance Granted"; Boolean)
        {
            Caption = 'Leave Allowance Granted';
            DataClassification = CustomerContent;
        }

        field(39003906; "Vehicle Registration"; Text[30])
        {
            Caption = 'Vehicle Registration';
            DataClassification = CustomerContent;
        }
    }
}
