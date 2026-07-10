 
  table 52193449 "Signature Record"
{
    DataClassification = CustomerContent;
    
    fields
    {
        field(1; "Entry No."; Integer)
        {
            AutoIncrement = true;
        }
        field(2; Signature; Blob)
        {
            DataClassification = CustomerContent;
        }
        field(3; "Created At"; DateTime)
        {
            DataClassification = CustomerContent;
        }
    }
    
    keys
    {
        key(PK; "Entry No.")
        {
            Clustered = true;
        }
    }
    
    trigger OnInsert()
    begin
        "Created At" := CurrentDateTime;
    end;
}