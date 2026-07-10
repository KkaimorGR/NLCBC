
report 52193791 "Quotation Analysis Weighing"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/Quotation Analysis Weighing.rdlc';
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    Caption = 'Quotation Analysis Weighing';
    dataset
    {
        dataitem("Purchase Quote Header"; "Purchase Quote Header")
        {
            DataItemTableView = sorting("Document Type", "No.");
            column(ReportForNavId_1; 1) { }
            dataitem("Purchase Quote Line"; "Purchase Quote Line")
            {
                DataItemLink = "Document Type" = field("Document Type"), "Document No." = field("No.");
                column(ReportForNavId_2; 2) { }
                dataitem("Purchase Quote Params"; "Purchase Quote Params")
                {
                    DataItemLink = "Document Type" = field("Document Type"), "Document No." = field("Document No."), "Line No." = field("Line No.");
                    column(ReportForNavId_3; 3) { }
                    dataitem("Quotation Specification Lines"; "Quotation Specification Lines")
                    {
                        column(ReportForNavId_4; 4) { }
                    }
                }
            }

            trigger OnPreDataItem()
            begin
                LastFieldNo := "Purchase Quote Header".FieldNo("Purchase Quote Header"."No.");
            end;
        }
    }

    requestpage
    {

        layout { }

        actions { }
    }

    labels { }

    var
        LastFieldNo: Integer;
        FooterPrinted: Boolean;
        Vend: Record Vendor;
}
