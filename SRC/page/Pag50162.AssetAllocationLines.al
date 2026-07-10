
page 52193587 "Asset Allocation Lines"
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
                    TableRelation = "Fixed Asset"."No." where(Returned = const(false));

                }

                field(Description; "Asset Description")
                {
                    ApplicationArea = Basic;
                    Caption = 'Description';
                }
                field("Make/Model"; "Make/Model")
                {
                    ApplicationArea = all;
                    Editable = false;
                }
                field(SerialNo; "Asset Serial No")
                {
                    ApplicationArea = Basic;
                    Caption = 'Serial No';
                }
                field("Responsibility Center"; "Responsibility Center")
                {
                    ApplicationArea = all;
                }
                field("Department Name"; "Department Name")
                {
                    ApplicationArea = all;
                    Editable = false;
                }
                field("Quantity Allocated"; "Quantity Allocated")
                {
                    ApplicationArea = all;

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

                field(DirectorateName; "Dimension 2 Name")
                {
                    ApplicationArea = Basic;
                    Caption = 'Directorate Name';
                    Visible = false;
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

    trigger OnInsertRecord(BelowxRec: Boolean): Boolean
    begin

        CalcFields(Status);
        if Status <> Status::Open then
            Error('You are not allowed to insert at this level')
    end;

    trigger OnModifyRecord(): Boolean
    begin
        CalcFields(Status);
        if Status <> Status::Open then
            Error('You are not allowed to modify at this level')
    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        CalcFields(Status);
        if Status <> Status::Open then
            Error('You are not allowed to insert at this level')
    end;
}

