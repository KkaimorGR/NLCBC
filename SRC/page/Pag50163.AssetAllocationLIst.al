 
   
page 52193588 "Asset Allocation LIst"
{
    CardPageID = "Asset Allocation Card";
    DeleteAllowed = false;
    PageType = List;
    SourceTable = "HR Asset Transfer Header";
    SourceTableView = where("Document Type" = const("Department Allocation"));

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("No."; "No.")
                {
                    ApplicationArea = Basic;
                }
                field("Request Description";"Request Description")
                {
                    ApplicationArea = Basic;
                }
                field("Document Date"; "Document Date")
                {
                    ApplicationArea = Basic;
                }
                field("User ID"; "User ID")
                {
                    ApplicationArea = Basic;
                }
                field("Responsibility Center"; "Responsibility Center")
                {
                    ApplicationArea = Basic;
                }

            

                field(Type; Type)
                {
                    ApplicationArea = Basic;
                }
                field(Status; Status)
                {
                    ApplicationArea = Basic;
                }
                field("Document Type"; "Document Type")
                {
                    ApplicationArea = Basic;
                }
                 field("Approval Comments"; "Approval Comments")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Approval Comments field.';
                }
            }
        }
        area(factboxes)
        {
            part(Control4; "Approval Comments")
            {
                SubPageLink = "Document No." = field("No.");
            }
            part(Control3; "Approval Comment Lines")
            {
                SubPageLink = "Application Code" = field("No.");
            }
            systempart(Control2; Notes)
            {
            }
            systempart(Control1; MyNotes)
            {
            }
        }
    }

    actions
    {
    }

    trigger OnInsertRecord(BelowxRec: Boolean): Boolean
    begin
        "Document Type" := "document type"::"Department Allocation";
        rec.Type:=rec.Type::Allocation;
    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        "Document Type" := "document type"::"Department Allocation";
        rec.Type:=rec.Type::Allocation;
    end;
}

