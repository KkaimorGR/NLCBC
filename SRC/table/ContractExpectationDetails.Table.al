
table 52193857 "Contract Expectation Details"
{
    Caption = 'Contract Expectation Details';
    DataClassification = CustomerContent;
    fields
    {
        field(1; "Contract No"; Code[10])
        {
            Caption = 'Contract No';
        }
        field(2; "Cycle Code"; Code[10])
        {
            Caption = 'Cycle Code';
        }
        field(3; "Cycle Stage"; Integer)
        {
            Caption = 'Cycle Stage';
        }
        field(4; Description; Text[30])
        {
            Caption = 'Description';
        }
        field(5; "Expectation Code"; Code[10])
        {
            TableRelation = "Contract Expectations"."Expectation Code";
            Caption = 'Expectation Code';
        }
        field(6; "Person Responsible"; Text[30])
        {
            Caption = 'Person Responsible';
        }
        field(7; "Due Date"; Date)
        {
            Caption = 'Due Date';
        }
        field(8; Done; Boolean)
        {
            Caption = 'Done';
        }
        field(9; "Date Done"; Date)
        {
            Caption = 'Date Done';
        }
        field(10; "Done By"; Text[30])
        {
            Caption = 'Done By';
        }
        field(11; "%age Paid"; Decimal)
        {
            Caption = '%age Paid';
        }
        field(12; Type; Option)
        {
            OptionCaption = ' ,Vendor,Customer';
            OptionMembers = " ",Vendor,Customer;
            Caption = 'Type';
        }
        field(13; "Contractor No"; Code[10])
        {
            Caption = 'Contractor No';
        }
        field(14; "Invoice No"; Code[10])
        {
            TableRelation = if (Type = const(Customer)) "Sales Invoice Header"."No." where("Contract No." = field("Contract No"))
            else
            if (Type = const(Vendor)) "Purch. Inv. Header"."No.";
            Caption = 'Invoice No';
        }
    }

    keys
    {
        key(Key1; "Contract No")
        {
            Clustered = true;
        }
    }

    fieldgroups { }
}
