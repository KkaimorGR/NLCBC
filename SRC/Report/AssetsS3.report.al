report 50073 "Asset S3 Report"
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    Caption = 'Asset S3 Report';
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/AssetS3Report.rdlc';


    dataset
    {
        dataitem("Store Requisition TT Line"; "Store Requisition TT Line")
        {


            column(No; "No.") { }
            column(Picture; CI.Picture) { }
            column(Name; CI.Name) { }
            column(No_Rec; NoRec) { }
            column(Quantity; Quantity) { }
            column(QuantityRec; QuantityRec) { }
            column(Unit_Cost; "Unit Cost") { }
            column(Unit_CostRec; UnitCostRec) { }
            column(Line_Amount; "Line Amount") { }
            column(Line_AmountRec; LineAmountRec) { }
            column(Supplier_Name; "Supplier Name") { }
            column(FA_In_StoreRec; "FA In Store") { }
            column(Suplier; Suplier) { }
            column(No_Iss; NoIss) { }//Sharks@2671Hk
            column(Issued; Issued) { }
            column(QuantityIssued; QuantityIssued) { }
            column(Unit_CostIss; UnitCostIss) { }
            column(FA_In_StoreIssue; "FA In Store") { }
            column(Line_AmountIssue; LineAmountIssue) { }
            column(IssueCenter; IssueCenter) { }
            column(Make_Model; "Make/Model") { }
            column(Type; Type) { }
            column(Document_Date; "Document Date") { }
            dataitem(Item; Item)
            {
                DataItemLink = "No." = field("No.");
            }

            trigger OnPreDataItem()

            begin
                "Store Requisition TT Line".SetFilter(Type, 'Asset');
                "Store Requisition TT Line".SetFilter("Make/Model", Model);

            end;

            trigger OnAfterGetRecord()
            var
                Header: Record "Store Requistion Headers";
                Header1: Record "HR Asset Transfer Header";
            begin
                if ("Store Requisition TT Line".Issue = false) and ("Store Requisition TT Line"."Unit Cost" > 0) then begin
                    Clear(NoIss);
                    Clear(QuantityIssued);
                    Clear(UnitCostIss);
                    Clear(LineAmountIssue);
                    //Clear(issueDate);
                    Clear(IssueCenter);
                    NoRec := "No.";
                    QuantityRec := Quantity;
                    LineAmountRec := "Line Amount";
                    UnitCostRec := "Unit Cost";
                    Header.Reset();
                    Header.SetRange("No.", "Requistion No");
                    if Header.FindFirst() then begin
                        //ReceiveDate := Header."Posting Date";
                        Suplier := Header."Vendor Name";
                    end;
                end;

                if ("Store Requisition TT Line".Issue = true) and ("Store Requisition TT Line"."Unit Cost" = 0) then begin
                    Clear(NoRec);
                    Clear(QuantityRec);
                    Clear(UnitCostRec);
                    Clear(LineAmountRec);
                    //Clear(ReceiveDate);
                    Clear(Suplier);
                    NoIss := "No.";
                    QuantityIssued := -Quantity;
                    UnitCostIss := -"Unit Cost";
                    LineAmountIssue := -"Line Amount";
                    Header1.Reset();
                    Header1.SetRange("No.", "Requistion No");
                    if Header1.FindFirst() then begin
                        //IssueDate := Header1."Document Date";
                        IssueCenter := Header1."Responsibility Center";
                    end;

                end;


            end;



        }
        // dataitem("HR Asset Transfer Lines"; "HR Asset Transfer Lines")
        // {
        //     DataItemTableView = where(Type = const(5), Status = const(2));
        //     column(No_All; "Asset No.")
        //     {

        //     }
        //     column(Department_Name; "Department Name")
        //     {

        //     }
        //     column(Quantity_Allocated; "Quantity Allocated")
        //     {

        //     }
        //     column(AllocationDate; AllocationDate)
        //     {

        //     }
        //     trigger OnPreDataItem()

        //     begin
        //         "HR Asset Transfer Lines".SetFilter("Make/Model", Model);
        //     end;

        //     trigger OnAfterGetRecord()
        //     var
        //         Header: Record "HR Asset Transfer Header";
        //     begin
        //         Header.Reset();
        //         Header.SetRange("No.", "No.");
        //         if Header.FindFirst() then begin
        //             AllocationDate := Header."Document Date";
        //         end;


        //     end;


        // }

    }

    requestpage
    {
        AboutTitle = 'Teaching tip title';
        AboutText = 'Teaching tip content';
        layout
        {
            area(Content)
            {
                group(GroupName)
                {
                    field(Model; Model)
                    {
                        ApplicationArea = All;
                        Caption = 'Make/Model';
                        TableRelation = "Make/Model".Description;

                    }


                }
            }
        }

        actions
        {
            area(processing)
            {
                action(LayoutName)
                {

                }
            }
        }
    }
    trigger OnPreReport()
    begin
        CI.Get();
        CI.CalcFields(Picture);
    end;



    var
        Model: Text;
        CI: Record "Company Information";
        // ReceiveDate: Date;
        AllocationDate: Date;
        //issueDate: Date;
        IssueCenter: Text;
        Suplier: Text;
        NoIss: Text;
        NoRec: Text;
        QuantityRec: Integer;
        UnitCostRec: Decimal;
        LineAmountRec: Decimal;
        QuantityIssued: Integer;
        UnitCostIss: Decimal;
        LineAmountIssue: Decimal;
}
