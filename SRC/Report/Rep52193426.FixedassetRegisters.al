report 52193426 "Fixed Asset Registers"
{
    Caption = 'Fixed Asset Register';
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    DefaultLayout = RDLC;
    RDLCLayout = './SRC/Report/FixedAssetRegisters.report.rdl';

    dataset
    {
        dataitem("Fixed Asset"; "Fixed Asset")
        {
            //RequestFilterFields = "No.";
            //DataItemTableView = where(Type = const(4));
            column(No_; "No.") { }
            column(Description; Description) { }
            column(Make_Model; "Make/Model") { }
            column(Search_Description; "Search Description") { }
            column(Description_2; "Description 2") { }
            column(FA_Class_Code; "FA Class Code") { }
            column(Date_of_Delivery_Installation; "Date of Delivery/Installation") { }
            column(Serial_No_; "Serial No.") { }
            column(Condition; Condition) { }
            column(Financed_By; "Financed By") { }
            column(Global_Dimension_1_Code; "Global Dimension 1 Code") { }
            column(Global_Dimension_2_Code; "Global Dimension 2 Code") { }
            column(Vendor_No_; "Vendor No.") { }
            column(Warranty_Date; "Warranty Date") { }
            column(Responsible_Employee; EmployeeName) { }
            column(Insured; Insured) { }
            column(Acquired; Acquired) { }
            column(Donated; Donated) { }
            column(Asset_Type; "Asset Type") { }
            column(Fixed_Asset_Type; Type) { }
            column(Tagging_No; "Tagging No") { }
            column(Location_Name; "Location Name") { }
            column(FA_Location_Code; "FA Location Code") { }
            column(County_Name; "County Name") { }
            column(Notes_Remarks; "Notes/Remarks") { }
            column(Amount; Amount) { }
            column(DepRate; DepRate) { }
            column(AnnualDep; AnnualDep) { }
            column(AccDepre; AccDepre) { }
            column(NetBookValue; NetBookValue) { }
            column(Picture; CI.Picture) { }
            column(Name; CI.Name) { }
            column(Address; CI.Address) { }
            column(Adress2; CI."Address 2") { }
            column(YearOfPurchase; "Date of Delivery/Installation") { }
            column(DisposalDate; DisposalDate) { }
            column(DisposalValue; DisposalValue) { }
            column(EmployeeName; EmployeeName) { }
            column(Category_Name; "Category Name")
            {

            }
            column(Prelocation; Prelocation)
            {

            }
            trigger OnPreDataItem()

            begin
                if FixedTypeOption <> FixedTypeOption::" " then
                    "Fixed Asset".SetRange(Type, FixedTypeOption);
            end;

            trigger OnAfterGetRecord()
            var
                FAdepBook: Record "FA Depreciation Book";
                LedgerEntries: Record "FA Ledger Entry";
                EmployeeRec: Record "HR Employees";
                Line: Record "Disposal plan table line";
                Line1: Record "Disposal plan table line";
                Header1: Record "Disposal Plan Header";
                Transfer: Record "HR Asset Transfer Lines";
                Falocations: Record "FA Location";

            begin
                DepRate := 0;
                AnnualDep := 0;
                Prelocation := '';

                FAdepBook.Reset();
                FAdepBook.SetRange("FA No.", "No.");
                if FAdepBook.FindFirst() THEN begin
                    Amount := FAdepBook."Acquisition Cost";
                    if (FAdepBook."No. of Depreciation Years" > 0) and (Amount > 0) then begin
                        AnnualDep := Amount / FAdepBook."No. of Depreciation Years";
                        DepRate := Amount / AnnualDep;

                        AccDepre := FAdepBook.Depreciation;
                        FAdepBook.CalcFields("Book Value");
                        NetBookValue := FAdepBook."Book Value";
                        YearOfPurchase := FAdepBook."Acquisition Date";
                    end
                    else begin
                        AnnualDep := 0;
                        AccDepre := 0;
                        DepRate := 0;
                        NetBookValue := 0;
                        YearOfPurchase := 0D;
                        Amount := 0;
                        EmployeeName := '';

                    end;
                    Transfer.Reset();
                    Transfer.SetRange("Asset No.", "Fixed Asset"."No.");
                    if Transfer.FindLast() then begin
                        Prelocation := Transfer."FA Location";
                        Falocations.Reset();
                        Falocations.SetRange(Code, Prelocation);
                        if Falocations.FindFirst() then
                            Prelocation := Falocations.Name;
                    end;
                    if Prelocation = '' then
                        Prelocation := "Fixed Asset"."Location Name";
                    Line.Reset();
                    Line.SetRange("No.", "No.");
                    if Line.FindFirst() then begin
                        DisposalValue := Line."Value Of Purchase";
                    end else
                        DisposalValue := 0;
                    Line1.Reset();
                    Line1.SetRange("No.", "No.");
                    if Line1.FindFirst() then begin
                        Header1.SetRange("No.", Line1."Ref. No.");
                        if Header1.FindFirst() then
                            DisposalDate := Header1.Date
                        else
                            DisposalDate := 0D;


                    end;

                    EmployeeRec.Reset();
                    EmployeeRec.SetRange("No.", "Staff No");
                    If EmployeeRec.FindFirst() then begin
                        EmployeeName := EmployeeRec."First Name" + ' ' + EmployeeRec."Last Name";
                    end Else
                        EmployeeName := '';



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
                group(Filter)

                {
                    field(FixedTypeOption; FixedTypeOption)
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'Fixed Asset Type';
                        ShowMandatory = true;
                    }
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
        Prelocation: Text;
        AnnualDep: Decimal;
        Typo: Text;
        CI: Record "Company Information";
        YearOfPurchase: Date;
        DisposalDate: Date;
        DisposalValue: Decimal;
        FASubClass: Text;
        FixedTypeOption: Option " ",Chair,Tables,"Laptops/Computers",Vehicles,Land,Building,"Office Quipment";
        EmployeeName: Text;
}