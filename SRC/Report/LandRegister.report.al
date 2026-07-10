report 50064 "Land Register"
{

    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/LandRegister.rdlc';
    ApplicationArea = All;
    Caption = 'Land Register';
    UsageCategory = ReportsAndAnalysis;


    dataset
    {
        dataitem("Fixed Asset"; "Fixed Asset")
        {
            //RequestFilterFields = "No.";
            DataItemTableView = where(Type = const(5));
            column(No_; "No.")
            {

            }
            column(Description; Description)
            {

            }
            column(Mode_of_Acquisition; "Mode of Acquisition")
            {

            }
            column(LandCategory; LandCategory)
            {

            }
            column(GPS; GPS1)
            {

            }
            column(A; A1)
            {

            }
            column(B; B1)
            {

            }
            column(C; C1)
            {

            }
            column(D; D1)
            {

            }
            column(L_R__certifcate_No_; "L.R /certifcate No.")
            {

            }
            column(Document_of_ownership; "Document of ownership")
            {

            }
            column(Proprietorship__ownership; "Proprietorship/ ownership")
            {

            }
            column(Size_Ha_; "Size(Ha)")
            {

            }
            column(Ownership_status; "Ownership status")
            {

            }
            column(Reg__Date; "Reg. Date")
            {

            }
            column(Disputed; Disputed1)
            {

            }
            column(Encumberances; Encumberances)
            {

            }
            column(Planned; Planned1)
            {

            }
            column(Purpose_of_Land; "Purpose of Land")
            {

            }
            column(Surveyed; Surveyed1)
            {

            }

            column(Fair_value_Land_index; "Fair value/Land index")
            {

            }
            column(DisposalDAte; DisposalDAte)
            {

            }
            column(DisposalValue; DisposalValue)
            {

            }
            column(Annual_rental_income; "Annual rental income")
            {

            }


            column(FA_Class_Code; "FA Class Code")
            {

            }


            column(Serial_No_; "Serial No.")
            {

            }
            column(Date_of_Delivery_Installation; "Date of Delivery/Installation")
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

            column(Notes_Remarks; "Notes/Remarks")
            {

            }
            column(Asset_Movement_Status; "Asset Movement Status")
            {

            }
            column(Type; Type)
            {

            }
            column(Amount; Amount)
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
            trigger OnAfterGetRecord()
            var
                LedgerEntries: Record "FA Ledger Entry";
            begin
                LedgerEntries.Reset();
                LedgerEntries.SetRange("FA No.", "No.");
                if LedgerEntries.FindFirst() then begin
                    Amount := LedgerEntries.Amount;
                end;

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




        }

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
        CI: Record "Company Information";
        DisposalDAte: Date;
        DisposalValue: Decimal;
        Amount: Decimal;
}