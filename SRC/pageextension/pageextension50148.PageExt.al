
pageextension 52193475 pageextension50148 extends "Approval Comments"
{
    var
        NewTableId: Integer;
        NewDocumentType: Option;
        NewDocumentNo: Code[20];
        DocType: Option;
        DocNo: Code[20];
        "Approved DaysVisible": Boolean;
        "Approved Start DateVisible": Boolean;
        "Approved Return DateVisible": Boolean;
        ReasonVisible: Boolean;
        "Leave Allowance GrantedVisible": Boolean;

    procedure SetUpLine(TableId: Integer; DocumentType: Option Quote,"Order",Invoice,"Credit Memo","Blanket Order","Return Order",None,"Payment Voucher","Petty Cash",Imprest,Requisition,ImprestSurrender,Interbank,Receipt,"Staff Claim","Staff Advance",AdvanceSurrender,"Bank Slip",Grant,"Grant Surrender","Employee Requisition","Leave Application","Training Application"; DocumentNo: Code[20])
    begin
        NewTableId := TableId;
        NewDocumentType := DocumentType;
        NewDocumentNo := DocumentNo;
    end;

    procedure Setfilters(TableId: Integer; DocumentType: Option Quote,"Order",Invoice,"Credit Memo","Blanket Order","Return Order",None,"Payment Voucher","Petty Cash",Imprest,Requisition,ImprestSurrender,Interbank,Receipt,"Staff Claim","Staff Advance",AdvanceSurrender,"Bank Slip",Grant,"Grant Surrender","Employee Requisition","Leave Application","Training Application"; DocumentNo: Code[20])
    begin
        if TableId <> 0 then begin
            Rec.FilterGroup(2);
            Rec.SetCurrentKey(Rec."Table ID", Rec."Document Type", Rec."Document No.");
            Rec.SetRange(Rec."Table ID", TableId);
            Rec.SetRange(Rec."Document Type", DocumentType);
            if DocumentNo <> '' then
                Rec.SetRange(Rec."Document No.", DocumentNo);
            Rec.FilterGroup(0);
        end;

        DocType := DocumentType;
        DocNo := DocumentNo;
    end;
}
