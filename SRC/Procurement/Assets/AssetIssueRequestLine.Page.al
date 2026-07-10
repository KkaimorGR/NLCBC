
Page 52193496 "Asset Issue Request Line"
{
    DeleteAllowed = true;
    Editable = true;
    PageType = ListPart;
    SourceTable = "HR Asset Transfer Lines";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(AssetNo; "Asset No.")
                {
                    ApplicationArea = Basic;
                    TableRelation = "Fixed Asset"."No." where("Asset Movement Status" = filter(Issued),
                                                               "Global Dimension 2 Code" = field("Global Dimension 2 Code"));
                }
                field(Description; "Asset Description")
                {
                    ApplicationArea = Basic;
                    Caption = 'Description';
                }
                field(SerialNo; "Asset Serial No")
                {
                    ApplicationArea = Basic;
                    Caption = 'Serial No';
                }
                field(UserStatus; "User Status")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Fa Type"; "Fa Type")
                {
                    ApplicationArea = all;
                }
                field(Status; Status)
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    Caption = 'Approval Status';
                }
                field(StaffNo; "Responsible Employee Code")
                {
                    ApplicationArea = Basic;
                    Caption = 'Staff No';
                }
                field(StaffName; "Employee Name")
                {
                    ApplicationArea = Basic;
                    Caption = 'Staff Name';
                    Editable = false;
                }
                field(CountyCode; "Global Dimension 1 Code")
                {
                    ApplicationArea = Basic;
                    Caption = 'County Code';
                    Editable = false;
                }
                field(CountyName; "Dimension 1 Name")
                {
                    ApplicationArea = Basic;
                    Caption = 'County Name';
                    Editable = false;
                }
                field(DirectorateCode; "Global Dimension 2 Code")
                {
                    ApplicationArea = Basic;
                    Caption = 'Directorate Code';
                }
                field(DirectorateName; "Dimension 2 Name")
                {
                    ApplicationArea = Basic;
                    Caption = 'Directorate Name';
                }

                field(Remarks; Remarks)
                {
                    ApplicationArea = Basic;
                }
                field("New Asset Location"; "New Asset Location")
                {
                    ApplicationArea = all;
                }
                field(Type; Type)
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field(NewResponsibleEmployeeCode; "New Responsible Employee Code")
                {
                    ApplicationArea = Basic;
                }
                field(Approved; Approved)
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field(NewEmployeeName; "New Employee Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }

                field(NewGlobalDimension2Code; "New Global Dimension 2 Code")
                {
                    ApplicationArea = Basic;
                }
                field(NewDimension1Name; "New  Dimension 1 Name")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field(NewDimension2Name; "New  Dimension 2 Name")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field(No; "No.")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field(LineNo; "Line No")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("FA Location"; "FA Location")
                {
                    ApplicationArea = all;
                }

            }
        }
    }

    actions
    {
    }

    trigger OnDeleteRecord(): Boolean
    begin
        CalcFields(Status);
        if Status <> Status::Open then
            Error('You are not allowed to delete at this level')
    end;

    // trigger OnInsertRecord(BelowxRec: Boolean): Boolean
    // begin

    //     CalcFields(Status);
    //     if Status <> Status::Open then
    //         Error('You are not allowed to insert at this level')
    // end;

    trigger OnModifyRecord(): Boolean
    begin
        CalcFields(Status);
        // if Status <> Status::Open then
        //     Error('You are not allowed to modify at this level')
    end;

    // trigger OnNewRecord(BelowxRec: Boolean)
    // begin
    //     CalcFields(Status);
    //     if Status <> Status::Open then
    //         Error('You are not allowed to insert at this level')
    // end;
}

