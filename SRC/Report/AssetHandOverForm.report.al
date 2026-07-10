report 50071 "Asset HandOver Form"
{
    Caption = 'Asset HandOver Form';
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/AssetHandover.rdlc';

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

            column(Category; Category)
            {

            }
            column(New_Asset_Location; "New Asset Location")
            {

            }

            column(Status; Status)
            {

            }
            column(Remarks; Remarks)
            {

            }
            column(Responsible_Employee_Code; "Responsible Employee Code")
            {

            }
            column(StaffName; StaffName)
            {

            }
            column(Department; Department)
            {

            }
            column(Designation; Designation)
            {

            }
            column(Employee_Name; "Employee Name")
            {

            }
            trigger OnPreDataItem()

            begin
                "HR Asset Transfer Lines".SetFilter(Status, 'Approved');
                "HR Asset Transfer Lines".SetFilter(Type, 'Return');

            end;

            trigger OnAfterGetRecord()
            var
                FixedAssets: Record "Fixed Asset";
                EmpRec: Record "HR Employees";
            begin
                FixedAssets.Reset();
                FixedAssets.SetRange("No.", "Asset Code");
                if FixedAssets.FindFirst() then begin
                    Category := FixedAssets."FA Subclass Code";
                    condition := FixedAssets.Condition;

                end;
                EmpRec.Reset();
                EmpRec.SetRange("No.", "Responsible Employee Code");
                if EmpRec.Find('-') then begin
                    StaffName := EmpRec.FullName();
                    Designation := EmpRec.Position;
                    Department := EmpRec.Office;
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
        Category: Text;
        condition: Text;
        CI: Record "Company Information";
        StaffName, Designation, Department : Text;
    //Typo: Text;
}