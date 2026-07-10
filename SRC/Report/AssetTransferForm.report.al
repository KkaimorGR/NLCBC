report 50070 "Asset Transfer Form"
{
    Caption = 'Asset Transfer Form';
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/AssetTransfer.rdlc';

    dataset
    {
        dataitem("HR Asset Transfer Lines"; "HR Asset Transfer Lines")

        {

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
            column(Asset_Description; "Asset Description")
            {

            }
            column(Asset_Serial_No; "Asset Serial No")
            {

            }

            column(condition; condition)
            {

            }
            column(Type; Type)
            {

            }
            column(Asset_No_; "Asset No.")
            {

            }
            column(Tag_No; "Tag No")
            {

            }
            column(Employee_Name; "Employee Name")
            {

            }
            column(Category; Category)
            {

            }
            column(New_Employee_Name; "New Employee Name")
            {

            }
            column(Quantity_Allocated; "Quantity Allocated")
            {

            }
            column(Status; Status)
            {

            }
            column(New_Asset_Location; "New Asset Location")
            {

            }
            column(Reason_for_Transfer; "Reason for Transfer")
            {

            }
            column(Responsible_Employee_Code; "Responsible Employee Code")
            {

            }
            column(New_Responsible_Employee_Code; "New Responsible Employee Code")
            {

            }
            column(TagNo; TagNo) { }
            column(Description; Description) { }
            column(Fa_Type; "Fa Type") { }
            column(OldUserSIg; UserSetup."User Signature") { }
            column(NewUserSIg; UserSetup1."User Signature") { }
            trigger OnPreDataItem()

            begin
                "HR Asset Transfer Lines".SetFilter(Status, 'Approved');
                "HR Asset Transfer Lines".SetFilter("FA Type", '%1|%2', "FA Type"::"Laptops/Computers", "FA Type"::"Office Quipment");


            end;

            trigger OnAfterGetRecord()
            var
                FixedAssets: Record "Fixed Asset";
                FixedAssets1: Record "Fixed Asset";
            begin
                FixedAssets1.Reset();
                FixedAssets1.SetRange(Type, FixedAssets1.Type::"Laptops/Computers");
                if FixedAssets1.Find('-') then
                    FixedAssets.Reset();
                FixedAssets.SetRange("No.", "Asset Code");
                if FixedAssets.FindFirst() then begin
                    Category := FixedAssets."FA Subclass Code";
                    condition := FixedAssets.Condition;

                end;

                EmpRec.Reset();
                EmpRec.SetRange("No.", "Responsible Employee Code");
                if EmpRec.FindFirst() then begin
                    UserSetup.SetRange("User ID", EmpRec."User ID");
                    if UserSetup.FindFirst() then
                        UserSetup.CalcFields("User Signature");
                end;

                EmpRec.Reset();
                EmpRec.SetRange("No.", "New Responsible Employee Code");
                if EmpRec.FindFirst() then begin
                    UserSetup1.SetRange("User ID", EmpRec."User ID");
                    if UserSetup1.FindFirst() then
                        UserSetup1.CalcFields("User Signature");
                end;
                TagNo := '';
                Description := '';
                if "Fa Type" = "Fa Type"::"Laptops/Computers" then begin
                    TagNo := "Tag No";
                    Description := "Asset Description"
                end;
                if "Fa Type" = "Fa Type"::"Office Quipment" then begin
                    TagNo := "Tag No";
                    Description := "Asset Description"
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
                    // field(Typo; Typo)
                    // {
                    //     Caption = 'Asset Type';
                    //     ApplicationArea = Basic, Suite;
                    //     TableRelation = "Fixed Asset"."Type";


                    // }


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
        Category: Text;
        condition: Text;
        EmpRec: Record "HR Employees";
        UserSetup: Record "User Setup";
        UserSetup1: Record "User Setup";
        TagNo, Description : Text;
}