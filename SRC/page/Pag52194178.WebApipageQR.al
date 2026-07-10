 
  page 52194178 "QR Code View API"
{
    PageType = API;
    APIPublisher = 'yourcompany';
    APIGroup = 'qrcode';
    APIVersion = 'v1.0';
    EntityName = 'qrcodeview';
    EntitySetName = 'qrcodeview';
    SourceTable = "QR Code Data";
    DelayedInsert = false;
    Editable = false;
    
    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field(documentNo; Rec."Document No.") 
                { 
                    Caption = 'Document No.';
                }
                field(versionNo; Rec."Version No.") 
                { 
                    Caption = 'Version';
                }
                field(approverID; Rec."Approver ID") 
                { 
                    Caption = 'Approver';
                }
                field(approvalDateTime; Rec."Approval DateTime") 
                { 
                    Caption = 'Approval Date & Time';
                }
                field(otpCode; Rec."OTP Code") 
                { 
                    Caption = 'OTP Code';
                }
                field(location; Rec."Location") 
                { 
                    Caption = 'Location';
                }
                field(createdDateTime; Rec."Created DateTime") 
                { 
                    Caption = 'Created On';
                }
                field(isCurrent; Rec."Is Current") 
                { 
                    Caption = 'Is Current';
                }
                field(modifiedBy; Rec."Modified By") 
                { 
                    Caption = 'Modified By';
                }
                field(changeDescription; Rec."Change Description") 
                { 
                    Caption = 'Changes Made';
                }
            }
        }
    }

    trigger OnOpenPage()
    var
        DocumentNoFilter: Text;
    begin
        // Get the documentNo parameter from the URL
        DocumentNoFilter := GetFilter("Document No.");
        
        if DocumentNoFilter <> '' then begin
            // Show only current record by default
            SetRange("Is Current", true);
        end;
    end;
}