
pageextension 52193434 pageextension50107 extends "Vendor Card"
{
    Caption = 'Supplier Card';

    //Unsupported feature: Property Insertion (InsertAllowed) on ""Vendor Card"(Page 26)".

    actions
    {
        addafter("Purchase Journal")
        {
            action("Vendor Evaluation Parameters")
            {
                ApplicationArea = Basic;
                Caption = 'Vendor Evaluation Parameters';
                Image = Excise;
                RunObject = page "Evaluation Parameter";
                RunPageLink = "Vendor No." = field("No.");
                ToolTip = 'Executes the Vendor Evaluation Parameters action.';
            }
            action(Test)
            {
                ApplicationArea = Basic;
                Caption = 'Vendor Evaluation Parameters';
                Image = TestFile;
                Visible = false;
                ToolTip = 'Executes the Vendor Evaluation Parameters action.';
                trigger OnAction()
                var
                    PWS: Codeunit PortalWebService;
                    app: Codeunit "Approvals Mgmt.";
                begin
                    PWS.SendLeaveForApproval('LV_05042');

                end;
            }
        }
    }

    var
        Vendor: Record Vendor;
        Text003: Label 'Vendor [%1 - %2] has not attached documents';

    procedure RecordLinkCheck(job: Record Vendor) RecordLnkExist: Boolean
    var
        objRecordLnk: Record "Record Link";
        TableCaption: RecordId;
        objRecord_Link: RecordRef;
    begin
        objRecord_Link.GetTable(job);
        TableCaption := objRecord_Link.RecordId;
        objRecordLnk.Reset();
        objRecordLnk.SetRange(objRecordLnk."Record ID", TableCaption);
        if objRecordLnk.Find('-') then
            exit(true)
        else
            exit(false);
    end;
}
