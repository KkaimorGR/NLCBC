
table 52193691 "prSalary Scale"
{
    Caption = 'prSalary Scale';
    DataClassification = CustomerContent;
    fields
    {
        field(1; Grade; Code[20])
        {
            Caption = 'Grade';
        }
        field(2; Description; Text[100])
        {
            Caption = 'Description';
        }
        field(3; "Minimum Pay"; Decimal)
        {
            Caption = 'Minimum Pay';
            trigger OnValidate()
            begin
                SalaryScale.Reset();
                SalaryScale.SetRange(SalaryScale."Minimum Pay", "Minimum Pay");
                if SalaryScale.Find('-') then
                    Error(Txt001);

                SalaryScale.Reset();
                SalaryScale.SetRange(SalaryScale."Maximum Pay", "Minimum Pay");
                if SalaryScale.Find('-') then
                    Error(Txt001);
            end;
        }
        field(4; "Maximum Pay"; Decimal)
        {
            Caption = 'Maximum Pay';
            trigger OnValidate()
            begin
                SalaryScale.Reset();
                SalaryScale.SetRange(SalaryScale."Minimum Pay", "Maximum Pay");
                if SalaryScale.Find('-') then
                    Error(Txt001);

                SalaryScale.Reset();
                SalaryScale.SetRange(SalaryScale."Maximum Pay", "Maximum Pay");
                if SalaryScale.Find('-') then
                    Error(Txt001);
            end;
        }
    }

    keys
    {
        key(Key1; Grade)
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
        fieldgroup(DropDown; Grade, Description, "Minimum Pay", "Maximum Pay") { }
    }

    var
        SalaryScale: Record "prSalary Scale";
        Txt001: Label 'Scale already exists';
}
