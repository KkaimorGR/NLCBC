
tableextension 52193430 tableextension50103 extends "G/L Entry"
{
    fields
    {
        field(39003900; Paid; Boolean)
        {
            Caption = 'Paid';
            DataClassification = CustomerContent;
            trigger OnValidate()
            begin
                //Update the sales invoice------
                objSalesLine.Reset();
                //objSalesLine.SETRANGE(objSalesLine."No.","G/L Account No.");
                objSalesLine.SetRange(objSalesLine."Document No.", Rec."Sales Line No.");
                objSalesLine.SetRange(objSalesLine."Line No.", Rec."Sales Line Line No.");
                if objSalesLine.Find('-') then
                    if Rec.Paid = true then begin
                        objSalesLine.Quantity := 1;
                        objSalesLine."Unit Price" := objSalesLine."Unit Price" + Rec.Amount;
                        objSalesLine.Modify();
                    end else begin
                        objSalesLine."Unit Price" := objSalesLine."Unit Price" - Rec.Amount;
                        objSalesLine.Modify();

                    end;
            end;
        }
        field(39003901; "Sales Line No."; Code[20])
        {
            Caption = 'Sales Line No.';
            DataClassification = CustomerContent;
        }
        field(39003902; "Sales Line Line No."; Integer)
        {
            Caption = 'Sales Line Line No.';
            DataClassification = CustomerContent;
        }
    }

    var
        objSalesLine: Record "Sales Line";
}
