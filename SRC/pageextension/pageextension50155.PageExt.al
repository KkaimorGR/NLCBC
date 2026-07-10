
pageextension 52193482 pageextension50155 extends "Fixed Asset List"
{
    layout
    {
        modify("Vendor No.")
        {
            Visible = false;
        }
        modify("Maintenance Vendor No.")
        {
            Visible = false;
        }
        modify("Responsible Employee")
        {
            Visible = false;
        }
        modify("FA Location Code")
        {
            Visible = false;
        }
        modify(Description)
        {
            Visible = false;
        }
        modify("Budgeted Asset")
        {
            Visible = false;
        }
        modify("Search Description")
        {
            Visible = false;
        }
        modify("FA Subclass Code")
        {
            Caption = 'FA Category';
        }
        addafter(Description)
        {
            field("Make/Model"; "Make/Model")
            {
                ApplicationArea = all;
            }
            field("Supplier Name"; Rec."Supplier Name")
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the Supplier Name field.';
            }

            field("Location Name"; Rec."Location Name")
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the Location Name field.';
            }
            field("FA Q in Store"; "FA Q in Store")
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the FA Q in Store field.';
            }
            field("Responsible Office/Officer"; "Responsible Office/Officer")
            {
                ApplicationArea = all;
                // Visible = false;
            }
            field("Staff No"; "Staff No")
            {
                ApplicationArea = all;

            }
            field("Staff Name"; "Staff Name")
            {
                ApplicationArea = all;
            }
            field("Purchase Amount"; "Purchase Amount")
            {
                ApplicationArea = all;
            }


        }
        moveafter(Description; "Search Description")

    }
    actions
    {
        addlast(Processing)
        {
            action("ICT/Computer Register")
            {
                ApplicationArea = All;
                Caption = 'ICT/Computer Register';
                Image = Print;

                trigger OnAction()

                begin

                    REPORT.RUN(50067);
                end;
            }
            action("Furniture & Fitting Register")
            {
                ApplicationArea = All;
                Caption = 'Furniture & Fitting Register';
                Image = Print; // Icon for the action

                trigger OnAction()

                begin

                    REPORT.RUN(50068);
                end;
            }
            action("Motor Vehicle Register")
            {
                ApplicationArea = All;
                Caption = 'Motor Vehicle Register';
                Image = Print; // Icon for the action

                trigger OnAction()

                begin

                    REPORT.RUN(50065);
                end;
            }
            action("Office Equipment Register")
            {
                ApplicationArea = All;
                Caption = 'Office Equipment Register';
                Image = Print; // Icon for the action

                trigger OnAction()

                begin

                    REPORT.RUN(50066);
                end;
            }
            action("Land Register")
            {
                ApplicationArea = All;
                Caption = 'Land Register';
                Image = Print;

                trigger OnAction()

                begin

                    REPORT.RUN(50064);
                end;
            }
            action("Building Register")
            {
                ApplicationArea = All;
                Caption = 'Building Register';
                Image = Print; // Icon for the action

                trigger OnAction()

                begin

                    REPORT.RUN(50062);
                end;
            }
            action("Asset Transfer Form")
            {
                ApplicationArea = All;
                Caption = 'Asset Transfer Form';
                Image = Print;

                trigger OnAction()

                begin

                    REPORT.RUN(50070);
                end;
            }
            action("Asset Movement Form")
            {
                ApplicationArea = All;
                Caption = 'Asset Movement Form';
                Image = Print;

                trigger OnAction()

                begin

                    REPORT.RUN(50069);
                end;
            }
            action("Asset Handover Form")
            {
                ApplicationArea = All;
                Caption = 'Asset Handover Form';
                Image = Print;

                trigger OnAction()

                begin

                    REPORT.RUN(50071);
                end;
            }
            action("S3 Asset Report")
            {
                ApplicationArea = All;
                Caption = 'S3 Asset Report';
                Image = Print;

                trigger OnAction()

                begin

                    REPORT.RUN(50073);
                end;
            }
        }
    }


}

