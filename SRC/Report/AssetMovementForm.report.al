report 50069 "Asset Movement Form"
{
    Caption = 'Asset Movement Form';
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/AssetMovement.rdlc';

    dataset
    {
        dataitem("HR Asset Transfer Lines"; "HR Asset Transfer Lines")

        {

            column(Date; Date)
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
            column(Asset_Description; "Asset Description")
            {

            }
            column(Category; Category)
            {

            }
            column(Make_Model; "Make/Model")
            {

            }
            column(Asset_Serial_No; "Asset Serial No")
            {

            }
            column(New_Asset_Location; "New Asset Location")
            {

            }
            column(FA_Location; "FA Location")
            {

            }
            column(Status; Status)
            {

            }
            column(Remarks; Remarks)
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
            column(ApprovedBy; ApprovedBy)
            {

            }
            column(Approved; Approved)
            {

            }
            trigger OnAfterGetRecord()
            var
                FixedAssets: Record "Fixed Asset";
                Header: Record "HR Asset Transfer Header";
            begin
                FixedAssets.Reset();
                FixedAssets.SetRange("No.", "Asset Code");
                if FixedAssets.FindFirst() then begin
                    Category := FixedAssets."FA Subclass Code";
                    condition := FixedAssets.Condition;

                end;

                Header.Reset();
                Header.SetRange("No.", "No.");
                If Header.FindFirst() THEN begin
                    Date := Header."Document Date";
                    ApprovedBy := Header."Approved By";
                end

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
        Date: Date;
        condition: Text;
        Category: Text;
        ApprovedBy: Text;
    //Typo: Text;
}