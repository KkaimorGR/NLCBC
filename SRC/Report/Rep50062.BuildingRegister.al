report 50062 "Building Register"
{
    ApplicationArea = All;
    Caption = 'Building Register';
    UsageCategory = ReportsAndAnalysis;
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/BuidingRegisters.rdlc';
    dataset
    {
        dataitem("Fixed Asset"; "Fixed Asset")
        {
            // RequestFilterFields = "No.";
            DataItemTableView = where(Type = const(6));
            column(No_; "No.")
            {

            }
            column(Description; Description)
            {

            }
            column(Make_Model; "Make/Model")
            {

            }
            column(Building_Ownership; "Building Ownership")
            {

            }
            column(BuildingCategory; LandCategory)
            {

            }
            column(Institution_No_; "Institution No.")
            {

            }
            column(Street; Street)
            {

            }
            column(L_R__certifcate_No_; "L.R /certifcate No.")
            {

            }
            column(Size_Ha_; "Size(Ha)")
            {

            }
            column(Ownership_status; "Ownership status")
            {

            }

            column(Financed_By; "Financed By")
            {

            }
            column(Mode_of_Acquisition; "Mode of Acquisition")
            {

            }
            column(Type_Of_Building; "Type Of Building")
            {

            }
            column(Purpose; "Purpose of Land")
            {

            }

            column(Estimated_Useful_Life; "Estimated Useful Life")
            {

            }
            column(Number_Of_Floors; "Number Of Floors")
            {

            }
            column(Plinth_Area; "Plinth Area")
            {

            }
            column(Cost_of_Construction_Valuation; "Cost of Construction/Valuation")
            {

            }
            // column(Annual_rental_income;"Annual rental income";)
            // {

            // }
            column(Annual_rental_income; "Annual rental income")
            {

            }


            column(Condition; Condition)
            {

            }
            column(Search_Description; "Search Description")
            {

            }
            column(Serial_No_; "Serial No.")
            {

            }
            column(Description_2; "Description 2")
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
            column(Date_of_Delivery_Installation; "Date of Delivery/Installation")
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
            column(AnnualDep; AnnualDep)
            {

            }
            column(AccDepre; AccDepre)
            {

            }
            column(NetBookValue; NetBookValue)
            {

            }

            trigger OnAfterGetRecord()
            var
                FAdepBook: Record "FA Depreciation Book";
                LedgerEntries: Record "FA Ledger Entry";
            begin
                LedgerEntries.Reset();
                LedgerEntries.SetRange("FA No.", "No.");
                if LedgerEntries.FindFirst() then begin
                    Amount := LedgerEntries.Amount;
                    //YearOfPurchase := LedgerEntries."Posting Date";
                end;
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





                end;



            end;

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
        YearOfPurchase: Date;
}
