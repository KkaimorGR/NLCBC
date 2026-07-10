report 50066 "Office Equipment Registers"
{
    Caption = 'Office Equipment Registers';
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/OfficeEquipmentRegister.rdlc';

    dataset
    {
        dataitem("Fixed Asset"; "Fixed Asset")
        {
            //RequestFilterFields = "No.";
            DataItemTableView = where(Type = const(7));
            column(No_; "No.")
            {

            }
            column(Description; Description)
            {

            }
            column(Make_Model; "Make/Model")
            {

            }
            column(Search_Description; "Search Description")
            {

            }
            column(Serial_No_; "Serial No.")
            {

            }
            column(Date_of_Delivery_Installation; "Date of Delivery/Installation")
            {

            }

            column(Description_2; "Description 2")
            {

            }
            column(Condition; Condition)
            {

            }
            column(Financed_By; "Financed By")
            {

            }
            column(FA_Class_Code; "FA Class Code")
            {

            }
            column(Global_Dimension_1_Code; "Global Dimension 1 Code")
            {

            }
            column(Global_Dimension_2_Code; "Global Dimension 2 Code")
            {

            }
            column(Vendor_No_; "Vendor No.")
            {

            }
            column(Warranty_Date; "Warranty Date")
            {

            }
            column(Responsible_Employee; "Responsible Employee")
            {

            }
            column(Insured; Insured)
            {


            }
            column(Acquired; Acquired)
            {

            }
            column(Budget_Name; "Budget Name")
            {

            }
            column(Budget_Qty; "Budget Qty")
            {

            }
            column(Donated; Donated)
            {

            }
            column(Asset_Type; "Asset Type")
            {

            }
            column(Tagging_No; "Tagging No")
            {

            }
            column(Supplier_Name; "Supplier Name")
            {

            }
            column(Location_Name; "Location Name")
            {

            }
            column(FA_Location_Code; "FA Location Code")
            {

            }
            column(County_Name; "County Name")
            {

            }
            column(Responsible_Office_Officer; "Staff Name")
            {

            }
            column(Notes_Remarks; "Notes/Remarks")
            {

            }
            column(Asset_Movement_Status; "Asset Movement Status")
            {

            }
            column(Type; Type)
            {

            }
            column(Card_No_; "Card No.")
            {

            }
            column(Unit_Of_Measure; "Unit Of Measure")
            {

            }
            column(Amount; Amount)
            {

            }
            column(DepRate; DepRate)
            {

            }
            column(AnnualDep; AnnualDep)
            {

            }
            column(AccDepre; AccDepre)
            {

            }
            column(NetBookValue; NetBookValue)
            {

            }
            column(Picture; CI.Picture) { }
            column(Name; CI.Name)
            {

            }
            column(Address; CI.Address)
            {

            }
            column(Adress2; CI."Address 2")
            {

            }
            column(DisposalDate; DisposalDate)
            {

            }
            column(DisposalValue; DisposalValue)
            {

            }
            column(Pv_Number; "Pv Number")
            {

            }
            column(Replacement_Date__if_applicable_; "Replacement Date (if applicable)")
            {

            }

            trigger OnAfterGetRecord()
            var
                FAdepBook: Record "FA Depreciation Book";
                LedgerEntries: Record "FA Ledger Entry";
            begin
                LedgerEntries.Reset();
                LedgerEntries.SetRange("FA No.", "No.");
                if LedgerEntries.FindFirst() then
                    Amount := LedgerEntries.Amount;

                FAdepBook.Reset();
                FAdepBook.SetRange("FA No.", "No.");
                if FAdepBook.FindFirst() THEN begin
                    if (FAdepBook."No. of Depreciation Years" > 0) and (Amount > 0) then begin
                        AnnualDep := Amount / FAdepBook."No. of Depreciation Years";
                        DepRate := Amount / AnnualDep;
                        //TODO
                        AccDepre := AnnualDep;
                    end
                    else begin
                        AnnualDep := 0;
                        AccDepre := 0;
                        DepRate := 0;

                    end;
                    LedgerEntries.Reset();
                    LedgerEntries.SetRange("FA No.", "No.");
                    if LedgerEntries.FindSet() then begin
                        LedgerEntries.CalcSums(Amount);
                        NetBookValue := LedgerEntries.Amount;
                    end else
                        NetBookValue := 0;
                    LedgerEntries.Reset();
                    LedgerEntries.SetFilter("FA Posting Category", 'Disposal');
                    LedgerEntries.SetRange("FA No.", "No.");
                    if LedgerEntries.FindFirst() then begin
                        DisposalDate := LedgerEntries."Posting Date";
                        DisposalValue := LedgerEntries.Amount;
                    end
                    else begin
                        DisposalDate := 0D;
                        DisposalValue := 0;
                    end;




                end;



            end;


        }
    }

    requestpage
    {
        layout
        {
            area(Content)
            {
                group(GroupName)
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
        Amount: Decimal;
        NetBookValue: Decimal;
        DepRate: Decimal;
        AccDepre: Decimal;
        AnnualDep: Decimal;
        Typo: Text;
        CI: Record "Company Information";
        DisposalDate: Date;
        DisposalValue: Decimal;
}