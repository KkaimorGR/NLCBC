
tableextension 52193455 tableextension50128 extends Resource
{
    fields
    {
        field(39003900; "Employee No"; Code[20])
        {
            TableRelation = "FA Budget Entry"."Entry No.";
            Caption = 'Employee No';
            DataClassification = CustomerContent;
        }
        field(39003901; Email; Text[30])
        {
            Caption = 'Email';
            DataClassification = CustomerContent;
        }
        field(39003902; Telephone; Text[30])
        {
            Caption = 'Telephone';
            DataClassification = CustomerContent;
        }
        field(39003903; Institution; Option)
        {
            OptionCaption = ' ,MTRH,MU,Others';
            OptionMembers = " ",MTRH,MU,Others;
            Caption = 'Institution';
            DataClassification = CustomerContent;
        }
    }
}
