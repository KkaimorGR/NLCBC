
Page 52193509 "Acceptance Signature Item"
{
    DeleteAllowed = true;
    InsertAllowed = true;
    PageType = Card;
    SourceTable = "Store Requistion Headers";

    layout
    {
        area(content)
        {
            group(General)
            {
                field("No."; "No.")
                {
                    ApplicationArea = Basic;
                }
                // field("User Signature"; "User Signature")
                // {
                //     ApplicationArea = Basic;
                // }
            }
        }
    }

    actions
    {
        area(processing)
        {
            action("Sign Now")
            {
                ApplicationArea = Basic;
                Caption = 'Sign Now';
                Ellipsis = true;
                Image = Add;
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction()
                var
                    SalesInvHeader: Record 112;
                    i: Integer;
                    ExportDir: Text;
                begin

                    // ProcessStartInfo := ProcessStartInfo.ProcessStartInfo;
                    // ProcessStartInfo.FileName := '\\192.168.10.53\Signature\WindowsApplication2.exe';
                    // CmdFilePath := '\\192.168.10.53\Signature\WindowsApplication2.exe';
                    // ProcessStartInfo.Arguments := "No."; //STRSUBSTNO('-cmd %1',CmdFilePath);
                    // Process := Process.Process;
                    // Process.Start(ProcessStartInfo);
                end;
            }
        }
    }

    var
        TEst2: Text;


        CmdFilePath: Text;
        SignatureText: BigText;
        aaset: Codeunit testSEndEmail;
}

