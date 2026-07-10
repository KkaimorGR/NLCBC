
Page 52193551 "Asset Return Request Lines"
{
    Caption = 'Asset Return Request Lines';
    DeleteAllowed = true;
    PageType = ListPart;
    SourceTable = "HR Asset Transfer Lines";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Asset No."; "Asset No.")
                {
                    ApplicationArea = Basic;
                    // TableRelation = "Fixed Asset"."No." where ("Asset Movement Status"=filter(Available),
                    //                                            "Responsible Officer"=field("Responsible Employee Code"));
                }
                field("Asset Description"; "Asset Description")
                {
                    ApplicationArea = Basic;
                }
                field("Responsible Employee Code"; "Responsible Employee Code")
                {
                    ApplicationArea = Basic;
                    Caption = 'Responsible Staff No';
                }
                field("Employee Name"; "Employee Name")
                {
                    ApplicationArea = Basic;
                    Caption = 'Responsible Staff Name';
                }
                field("Global Dimension 1 Code"; "Global Dimension 1 Code")
                {
                    ApplicationArea = Basic;
                    Caption = 'Current County Code';
                }
                field("Dimension 1 Name"; "Dimension 1 Name")
                {
                    ApplicationArea = Basic;
                    Caption = 'Current County Name';
                }
                field("Global Dimension 2 Code"; "Global Dimension 2 Code")
                {
                    ApplicationArea = Basic;
                }
                field("Dimension 2 Name"; "Dimension 2 Name")
                {
                    ApplicationArea = Basic;
                }
                field("Asset Serial No"; "Asset Serial No")
                {
                    ApplicationArea = Basic;
                }
                field(Type; Type)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(Store; Store)
                {
                    ApplicationArea = Basic;
                }
                field("No."; "No.")
                {
                    ApplicationArea = Basic;
                }
                field("User Status"; "User Status")
                {
                    ApplicationArea = Basic;
                }
                field(Status; Status)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Line No"; "Line No")
                {
                    ApplicationArea = Basic;
                }
                field(Remarks; Remarks)
                {
                    ApplicationArea = Basic;
                }
                field(Approved; Approved)
                {
                    ApplicationArea = Basic;
                }
            }
        }
    }

    actions
    {
    }

    trigger OnInsertRecord(BelowxRec: Boolean): Boolean
    begin
        RecHdr.Reset;
        RecHdr.SetRange(RecHdr."No.", "No.");
        if RecHdr.Find('-') then
            "Global Dimension 2 Code" := RecHdr."Responsibility Center";
        "Responsible Employee Code" := RecHdr."Issuing Admin/Asst";
        "Employee Name" := RecHdr."Issuing Admin/Asst Name";
        "Global Dimension 1 Code" := RecHdr."Global Dimension 1 Code";
    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        RecHdr.Reset;
        RecHdr.SetRange(RecHdr."No.", "No.");
        if RecHdr.Find('-') then
            "Global Dimension 2 Code" := RecHdr."Responsibility Center";
        "Responsible Employee Code" := RecHdr."Issuing Admin/Asst";
        "Employee Name" := RecHdr."Issuing Admin/Asst Name";
        "Global Dimension 1 Code" := RecHdr."Global Dimension 1 Code";
    end;

    var
        RecHdr: Record "HR Asset Transfer Header";
}

