

pageextension 52193448 UserSetupExtension extends "User Setup"
{
    layout
    {
        addafter("Allow Posting To")
        {
            field(Substitute; Rec.Substitute)
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the User ID of the user who acts as a substitute for the original approver.';
            }

            field("E-Mail"; Rec."E-Mail")
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the email address of the user in the User ID field.';
            }
            field("Approver ID"; Rec."Approver ID")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the user ID of the person who must approve records that are made by the user in the User ID field before the record can be released.';
            }
            field("User Signature"; Rec."User Signature")
            {
                ApplicationArea = all;
                Editable = true;

            }

            field("Transport Manager"; Rec."Transport Manager")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Transport Manager field.';
            }
            field("Employee No."; Rec."Employee No.")
            {
                ApplicationArea = All;
            }
            field("Close Payroll Period"; Rec."Close Payroll Period")
            {
                ApplicationArea = all;
                ToolTip = 'Specifies that can close payroll period';
            }
            field("Payroll Access"; Rec."Payroll Access")
            {
                ApplicationArea = all;
                ToolTip = 'Specifies the value of the Payroll Access field.';
            }
            field("Modify payroll"; Rec."Modify payroll")

            {
                ApplicationArea = all;
            }
            field("Edit Basic Salary"; Rec."Edit Basic Salary")
            {
                ApplicationArea = all;
            }
            field("Edit HR Setup"; Rec."Edit HR Setup")
            {
                ApplicationArea = all;
            }
            field("Adjust Leave Days"; Rec."Adjust Leave Days")
            {
                ApplicationArea = all;
                ToolTip = 'Specifies the value of the Adjust Leave Days field.';
            }
            field("Modify Jobs"; Rec."Modify Jobs")
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the Modify Jobs field.';
            }
            field("Can Issue Asset"; "Can Issue Asset")
            {
                ApplicationArea = Basic;
            }
            field("Can recceive"; "Can recceive")
            {
                ApplicationArea = all;
            }
            field("Can View Contracts"; "Can View Contracts")
            {
                ApplicationArea = all;
            }


        }
        modify("Sales Resp. Ctr. Filter")
        {
            Visible = false;
        }
        modify("Purchase Resp. Ctr. Filter")
        {
            Visible = false;
        }
        modify("Service Resp. Ctr. Filter")
        {
            Visible = false;
        }
        //moveafter("User ID"; "Time Sheet Admin.")
    }
    actions
    {
        addfirst(Processing)
        {
            action("Capture Signature")
            {
                ApplicationArea = Basic;
                Caption = 'Capture Signature';
                Ellipsis = true;
                Image = Add;
                Promoted = true;
                PromotedCategory = Process;
                RunObject = page "User Signature";
                RunPageLink = "User ID" = field("User ID");
                ToolTip = 'Executes the Capture Signature action.';

            }
        }
    }

    var
        User: Record User;


    //Unsupported feature: Code Insertion on "OnInsertRecord".

    //trigger OnInsertRecord(BelowxRec: Boolean): Boolean
    //begin
    /*
    "Max. No. of Active Sessions":=1;
    */
    //end;
}

#pragma implicitwith restore
