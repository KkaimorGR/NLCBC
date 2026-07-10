
table 52193947 "Seconded Table"
{
    Caption = 'Seconded Table';
    DataClassification = CustomerContent;
    fields
    {
        field(1; "Seconded Start Date"; Date)
        {
            Caption = 'Seconded Start Date';
            trigger OnValidate()
            begin


                "Seconded End Date" := 0D;

                //IF ("Contract Type" = "Contract Type"::seconded/Contract) AND ("Contract Duration" <> '') THEN

                //IF ("Contract Type" = "Contract Type"::seconded/Contract) AND ("Contract Duration" <> '') THEN

                "Seconded End Date" := CalcDate("Seconded Duration", "Seconded Start Date");
            end;
        }
        field(2; "Seconded Duration"; Code[10])
        {
            Caption = 'Seconded Duration';
            trigger OnValidate()
            begin
                "Seconded End Date" := 0D;

                //IF ("Contract Type" = "Contract Type"::Seconded/Contract) AND ("Seconded Duration" <> '') THEN

                //IF ("Contract Type" = "Contract Type"::Seconded/Contract) AND ("Seconded Duration" <> '') THEN

                "Seconded End Date" := CalcDate("Seconded Duration", "Seconded Start Date");
            end;
        }
        field(3; "Seconded End Date"; Date)
        {
            Caption = 'Seconded End Date';
        }
    }

    keys
    {
        key(Key1; "Seconded Start Date")
        {
            Clustered = true;
        }
    }

    fieldgroups { }
}
