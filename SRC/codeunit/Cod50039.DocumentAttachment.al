codeunit 52193457 "Document Attachment"
{

    [EventSubscriber(ObjectType::Page, Page::"Document Attachment Factbox", 'OnBeforeDrillDown', '', false, false)]
    local procedure OnBeforeDrillDown(DocumentAttachment: Record "Document Attachment"; var RecRef: RecordRef);
    var
        HRLeaveApplication: Record "HR Leave Application";
        PCA: Record "prBasic pay PCA";
        PurchHeader: Record "Purchase Header";
        HrDiscipline: Record "HR Disciplinary Cases NCA";
        EmployeeReq: Record "HR Employee Requisitions";
        TransportRe: Record "HR Transport Requisition";
        ItemDoc: Record "Store Requistion Headers";
        HRJobs: Record "HR Jobs";
        HodlingArea: Record "Holding Area";
        AssetAllocation: Record "Asset Allocation";
        HrAssetHeader: Record "HR Asset Transfer Header";
    begin
        case DocumentAttachment."Table ID" of
            Database::"Holding Area":
                begin
                    RecRef.Open(Database::"Holding Area");
                    if HodlingArea.Get(DocumentAttachment."No.") then
                        RecRef.GetTable(HodlingArea);
                end;
            Database::"HR Jobs":
                begin
                    RecRef.Open(Database::"HR Jobs");
                    if HRJobs.Get(DocumentAttachment."No.") then
                        RecRef.GetTable(HRJobs);
                end;

            Database::"Store Requistion Headers":
                begin
                    RecRef.Open(Database::"Store Requistion Headers");
                    if ItemDoc.Get(DocumentAttachment."No.") then
                        RecRef.GetTable(ItemDoc);
                end;
            Database::"Asset Allocation":
                begin
                    RecRef.Open(Database::"Asset Allocation");
                    if ItemDoc.Get(DocumentAttachment."No.") then
                        RecRef.GetTable(AssetAllocation);
                end;

            Database::"HR Asset Transfer Header":
                begin
                    RecRef.Open(Database::"HR Asset Transfer Header");
                    if ItemDoc.Get(DocumentAttachment."No.") then
                        RecRef.GetTable(HrAssetHeader);
                end;

            Database::"HR Transport Requisition":
                begin
                    RecRef.Open(Database::"HR Transport Requisition");
                    if TransportRe.Get(DocumentAttachment."No.") then
                        RecRef.GetTable(TransportRe);
                end;
            Database::"HR Employee Requisitions":
                begin
                    RecRef.Open(Database::"HR Disciplinary Cases NCA");
                    if EmployeeReq.Get(DocumentAttachment."No.") then
                        RecRef.GetTable(EmployeeReq);
                end;
            Database::"HR Disciplinary Cases NCA":
                begin
                    RecRef.Open(Database::"HR Disciplinary Cases NCA");
                    if HrDiscipline.Get(DocumentAttachment."No.") then
                        RecRef.GetTable(HrDiscipline);
                end;
            Database::"HR Leave Application":
                begin
                    RecRef.Open(Database::"HR Leave Application");
                    if HRLeaveApplication.Get(DocumentAttachment."No.") then
                        RecRef.GetTable(HRLeaveApplication);
                end;

            Database::"prBasic pay PCA":
                begin
                    RecRef.Open(Database::"prBasic pay PCA");
                    //if PCA.Get(DocumentAttachment."No.") then
                    PCA.Reset();
                    PCA.SetRange("Change Advice Serial No.", DocumentAttachment."No.");
                    if PCA.FindFirst() then
                        RecRef.GetTable(PCA);
                end;
        end;
    end;

    [EventSubscriber(ObjectType::Page, Page::"Document Attachment Details", 'OnAfterOpenForRecRef', '', false, false)]
    local procedure OnAfterOpenForRecRef(var DocumentAttachment: Record "Document Attachment"; var RecRef: RecordRef);
    var
        FieldRef: FieldRef;
        RecNo: Code[20];
    begin
        case RecRef.Number of
            DATABASE::"Holding Area":
                begin
                    FieldRef := RecRef.Field(1);
                    RecNo := FieldRef.Value;
                    DocumentAttachment.SetRange("No.", RecNo);
                end;
            DATABASE::"HR Jobs":
                begin
                    FieldRef := RecRef.Field(1);
                    RecNo := FieldRef.Value;
                    DocumentAttachment.SetRange("No.", RecNo);
                end;

            DATABASE::"Store Requistion Headers":
                begin
                    FieldRef := RecRef.Field(1);
                    RecNo := FieldRef.Value;
                    DocumentAttachment.SetRange("No.", RecNo);
                end;

            DATABASE::"Asset Allocation":
                begin
                    FieldRef := RecRef.Field(1);
                    RecNo := FieldRef.Value;
                    DocumentAttachment.SetRange("No.", RecNo);
                end;
            DATABASE::"HR Asset Transfer Header":
                begin
                    FieldRef := RecRef.Field(1);
                    RecNo := FieldRef.Value;
                    DocumentAttachment.SetRange("No.", RecNo);
                end;

            DATABASE::"HR Transport Requisition":
                begin
                    FieldRef := RecRef.Field(1);
                    RecNo := FieldRef.Value;
                    DocumentAttachment.SetRange("No.", RecNo);
                end;

            DATABASE::"HR Employee Requisitions":
                begin
                    FieldRef := RecRef.Field(3);
                    RecNo := FieldRef.Value;
                    DocumentAttachment.SetRange("No.", RecNo);
                end;

            DATABASE::"HR Disciplinary Cases NCA":
                begin
                    FieldRef := RecRef.Field(3);
                    RecNo := FieldRef.Value;
                    DocumentAttachment.SetRange("No.", RecNo);
                end;

            //PurchHeader
            DATABASE::"Purchase Header":
                begin
                    FieldRef := RecRef.Field(3);
                    RecNo := FieldRef.Value;
                    DocumentAttachment.SetRange("No.", RecNo);
                end;

            Database::"HR Leave Application":
                begin
                    FieldRef := RecRef.Field(1);
                    RecNo := FieldRef.Value;
                    DocumentAttachment.SetRange("No.", RecNo);
                end;

            Database::"prBasic pay PCA":
                begin
                    FieldRef := RecRef.Field(9);
                    RecNo := FieldRef.Value;
                    DocumentAttachment.SetRange("No.", RecNo);
                end;
            Database::"Employee Transfers":
                begin
                    FieldRef := RecRef.Field(12);
                    RecNo := FieldRef.Value;
                    DocumentAttachment.SetRange("No.", RecNo);
                end;
        end;
    end;

    [EventSubscriber(ObjectType::Table, Database::"Document Attachment", 'OnAfterInitFieldsFromRecRef', '', false, false)]
    local procedure OnAfterInitFieldsFromRecRef(var DocumentAttachment: Record "Document Attachment"; var RecRef: RecordRef)
    var
        FieldRef: FieldRef;
        RecNo: Code[20];
    begin
        case RecRef.Number of
            DATABASE::"Holding Area":
                begin
                    FieldRef := RecRef.Field(1);
                    RecNo := FieldRef.Value;
                    DocumentAttachment.Validate("No.", RecNo);
                end;
            DATABASE::"HR Jobs":
                begin
                    FieldRef := RecRef.Field(1);
                    RecNo := FieldRef.Value;
                    DocumentAttachment.Validate("No.", RecNo);
                end;
            DATABASE::"Store Requistion Headers":
                begin
                    FieldRef := RecRef.Field(1);
                    RecNo := FieldRef.Value;
                    DocumentAttachment.Validate("No.", RecNo);
                end;
            DATABASE::"Asset Allocation":
                begin
                    FieldRef := RecRef.Field(1);
                    RecNo := FieldRef.Value;
                    DocumentAttachment.Validate("No.", RecNo);
                end;
            DATABASE::"HR Asset Transfer Header":
                begin
                    FieldRef := RecRef.Field(1);
                    RecNo := FieldRef.Value;
                    DocumentAttachment.Validate("No.", RecNo);
                end;

            DATABASE::"HR Transport Requisition":
                begin
                    FieldRef := RecRef.Field(1);
                    RecNo := FieldRef.Value;
                    DocumentAttachment.Validate("No.", RecNo);
                end;
            DATABASE::"HR Employee Requisitions":
                begin
                    FieldRef := RecRef.Field(3);
                    RecNo := FieldRef.Value;
                    DocumentAttachment.Validate("No.", RecNo);
                end;
            DATABASE::"HR Disciplinary Cases NCA":
                begin
                    FieldRef := RecRef.Field(3);
                    RecNo := FieldRef.Value;
                    DocumentAttachment.Validate("No.", RecNo);
                end;
            //PurchHeader
            DATABASE::"Purchase Header":
                begin
                    FieldRef := RecRef.Field(3);
                    RecNo := FieldRef.Value;
                    DocumentAttachment.Validate("No.", RecNo);
                end;

            Database::"HR Leave Application":
                begin
                    FieldRef := RecRef.Field(1);
                    RecNo := FieldRef.Value;
                    DocumentAttachment.Validate("No.", RecNo);
                end;

            Database::"prBasic pay PCA":
                begin
                    FieldRef := RecRef.Field(9);
                    RecNo := FieldRef.Value;
                    DocumentAttachment.Validate("No.", RecNo);
                end;

            Database::"Employee Transfers":
                begin
                    FieldRef := RecRef.Field(12);
                    RecNo := FieldRef.Value;
                    DocumentAttachment.Validate("No.", RecNo);
                end;
        end;
    end;
}


