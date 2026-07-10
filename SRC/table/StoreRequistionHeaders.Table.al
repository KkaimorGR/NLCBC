
Table 52193901 "Store Requistion Headers"
{
    Caption = 'Store Requistion Headers';
    DrillDownPageID = "Store Reuisition Cr";
    LookupPageID = "Store Reuisition Cr";

    fields
    {
        field(1; "No."; Code[20])
        {
            Editable = true;
            NotBlank = false;

            trigger OnValidate()
            begin
                //IF "No." = '' THEN BEGIN
                if "No." <> xRec."No." then begin
                    GenLedgerSetup.Get();
                    NoSeriesMgt.TestManual(GenLedgerSetup."Store Requisition Nos.");
                    "No." := '';
                end;
                //END;
            end;
        }
        field(2; "Request date"; Date)
        {

            Caption = 'Request date';
            trigger onValidate()
            begin
                if "Requester ID" = '' then begin
                    "User ID" := UserId;
                    "Requester ID" := UserId;
                    // "Date Received" := Today;
                    "Required Date" := Today;
                end;
            end;
        }
        field(5; "Required Date"; Date)
        {
            Caption = 'Order Date';

            trigger OnValidate()
            begin
                //IF "Required Date" > TODAY THEN ERROR('Order date cannot be a future Date');
            end;
        }
        field(6; "Requester ID"; Code[50])
        {
            Caption = 'Requester ID';
            Editable = false;
            //This property is currently not supported
            //TestTableRelation = false;
            //The property 'ValidateTableRelation' can only be set if the property 'TableRelation' is set
            //ValidateTableRelation = false;

            trigger OnLookup()
            var
            // LoginMgt: Codeunit 418;
            begin
            end;

            trigger OnValidate()
            var
                LoginMgt: Codeunit 418;
            begin
                "Request date" := Today;
                "Posting Date" := Today;


                if UsersRec.Get("Requester ID") then begin
                    Empl.SetRange(Empl."User ID", UsersRec."User ID");
                    if Empl.Find('-') then begin
                        // Empl.CalcFields("County Name", "Department Name");
                        "Employee Code" := Empl."No.";
                        "Employee Name" := Empl."First Name" + ' ' + Empl."Last Name";
                        "Global Dimension 1 Code" := Empl."Global Dimension 1 Code";
                        "Shortcut Dimension 2 Code" := Empl."Global Dimension 2 Code";
                        "Responsibility Center" := Empl."Responsibility Center";
                        "Function Name" := Empl."County Name";
                        "Budget Center Name" := Empl."Department Name";
                    end else begin
                        Empl.Reset();
                        Empl.SetRange("No.", UsersRec."Employee No.");
                        if Empl.Find('-') then begin
                            "Employee Code" := Empl."No.";
                            "Employee Name" := Empl."First Name" + ' ' + Empl."Last Name";
                            "Global Dimension 1 Code" := Empl."Global Dimension 1 Code";
                            "Shortcut Dimension 2 Code" := Empl."Global Dimension 2 Code";
                            "Responsibility Center" := Empl."Responsibility Center";
                            "Function Name" := Empl."County Name";
                            "Budget Center Name" := Empl."Department Name";

                        end;
                    end;
                end;
            end;
        }
        field(7; "Request Description"; Text[150])
        {
            trigger OnValidate()
            begin
                if "Card No" = '' then begin
                    GenLedgerSetup.Get;
                    GenLedgerSetup.TestField("Card No");
                    NoSeriesMgt.InitSeries(GenLedgerSetup."Card No", xRec."Card No", 0D, "Card No", "No. Series");
                    //NoSeriesMgt.InitSeries(GenLedgerSetup."File Movement Numbers", xRec."File Movement Code", 0D, "File Movement Code", "No. Series");
                end;


            end;
        }
        field(9; "No. Series"; Code[10])
        {
            Caption = 'No. Series';
            Editable = false;
            TableRelation = "No. Series";

            trigger OnValidate()
            begin
                if "Card No" = '' then begin
                    GenLedgerSetup.Get;
                    GenLedgerSetup.TestField("Card No");
                    NoSeriesMgt.InitSeries(GenLedgerSetup."Card No", xRec."Card No", 0D, "Card No", "No. Series");
                    //NoSeriesMgt.InitSeries(GenLedgerSetup."File Movement Numbers", xRec."File Movement Code", 0D, "File Movement Code", "No. Series");
                end;
                /*
                IF PurchaseLine.Quantity > 0 THEN BEGIN
                  Item.RESET;
                  FOR i := 1 TO PurchaseLine.Quantity DO BEGIN
                    Item.INIT;
                    Item."No." := 'New Item ' + i;
                    Item."Description" := 'Description of new item ' + i;
                    Item.INSERT;
                  END;
                END;
                */

            end;
        }
        field(10; Status; Option)
        {
            OptionCaption = 'Open,Released,Pending Approval,Pending Prepayment,Cancelled,Posted,Rejected';
            OptionMembers = Open,Released,"Pending Approval","Pending Prepayment",Cancelled,Posted,Rejected;

            trigger OnValidate()
            var
                FSetup: Record "FA Setup";
                ApprovalEntry: Record "Approval Entry";
                ItemsRec: Record Item;
                TLed: Integer;
                GenJ: Codeunit "Gen. Jnl.-Post";
                GenJnlineREC: Record "Item Journal Line";
                PostEntry: Record "Post Value Entry to G/L";
            begin

                //if not GuiAllowed then exit;
                if rec.Status = rec.Status::Released then begin
                    ApprovalEntry.Reset();
                    ApprovalEntry.SetRange("Document No.", rec."No.");
                    if ApprovalEntry.Find('-') then
                        rec."Issued By" := ApprovalEntry."Approver ID";
                end;
                if "Action Type" = "action type"::Asset then begin
                    if Status = Status::Released then begin

                        // SReqLines.SetRange(SReqLines./"Requistion No", "No.");
                        //SReqLines.SETRANGE("Asset Code",SReqLines."Asset Code");

                        //MESSAGE( SReqLines."Requistion No");
                        //Insert PO Header
                        StoreRequistionHeaders.Reset;
                        StoreRequistionHeaders.SetRange("No.", rec."No.");
                        if StoreRequistionHeaders.Find('-') then begin
                            //kkaimor
                            // NextCodeRec := NoSeriesMgnt.GetNextNo('ASSETREC', WorkDate, true);
                            // StoreRequistionHeaders."No." := NextCodeRec;
                            // rec."Document Type" := StoreRequistionHeaders."Document Type"::ASSET;
                            rec."Action Type" := StoreRequistionHeaders."action type"::Asset;
                            rec."Purchase Order No" := "Purchase Order No";
                            rec."Request date" := Today;
                            // rec."Requester ID" := UserId;
                            // rec.Validate("Requester ID");
                            rec."Order Date" := "Order Date";
                            rec."Purchasing Store" := "Purchasing Store";
                            rec."Purchase Order No" := "Purchase Order No";
                            rec."Vendor No." := "Vendor No.";
                            rec."Vendor Name" := "Vendor Name";
                            rec.Currency := Currency;
                            rec.Received := true;
                            rec.Status := Status::Posted;
                            rec."Received By" := "Requester ID";
                            rec."Received Date" := Today;
                            rec."Required Date" := "Required Date";
                            // StoreRequistionHeaders.Modify();
                            SReqLines.Reset();
                            SReqLines.SetRange("Requistion No", rec."No.");
                            if SReqLines.Find('-') then begin
                                repeat
                                    if SReqLines.Quantity > 0 then begin

                                        fasset.Reset;
                                        with SReqLines
                                         do begin
                                            ItemsRec.Reset();
                                            ItemsRec.SetRange("No.", SReqLines."No.");
                                            if ItemsRec.Find('-') then begin
                                                ItemsRec.Status := ItemsRec.Status::Approved;
                                                ItemsRec.Modify();
                                            end;
                                            FSetup.get();
                                            fasset.Init;
                                            fasset.Reset();
                                            fasset.SetRange("No.", SReqLines."No.");
                                            if fasset.Find('-') then begin
                                                NextCode := NoSeriesMgnt.GetNextNo(FSetup."Fixed Asset Nos.", WorkDate, true);
                                                // fasset."No." := NextCode;
                                                fasset.Description := PadStr(SReqLines.Description, 50);
                                                fasset."Supplier Name" := SReqLines."Supplier Name";
                                                // fasset."IFMIS Order No" := SReqLines."Approved IFMIS No.";
                                                // fasset."IFMIS Code" := SReqLines."Approved Assset Code";
                                                //fasset."Asset Movement Status" := fasset."asset movement status"::New;
                                                fasset."FA Class Code" := 'TANGIBLE';

                                                fasset."Supplier Name" := SReqLines."Supplier Name";
                                                // fasset."IFMIS Order No" := SReqLines."Approved IFMIS No.";
                                                fasset."FA Location Code" := 'HEADOFFICE';

                                                // fasset."Location Code" := 'MAIN';
                                                // fasset.Modify();
                                                Deprec.Reset();
                                                Deprec.SetRange("FA No.", fasset."No.");
                                                Deprec.SetRange("Depreciation Book Code", 'NLC');
                                                if Deprec.Find('-') then begin
                                                    Deprec."FA No." := fasset."No.";
                                                    Deprec."Depreciation Book Code" := 'NLC';
                                                    Deprec."FA Posting Group" := 'OFFICEQUIP';
                                                    Deprec."Book Value" := SReqLines."Line Amount";
                                                    Deprec."Depreciation Method" := Deprec."depreciation method"::"Straight-Line";
                                                    Deprec."Depreciation Starting Date" := StoreRequistionHeaders."Order Date";
                                                    Deprec.Modify();
                                                end else begin
                                                    Deprec.Init();
                                                    Deprec."FA No." := fasset."No.";
                                                    Deprec."Depreciation Book Code" := 'NLC';
                                                    Deprec."FA Posting Group" := 'OFFICEQUIP';
                                                    Deprec."Book Value" := SReqLines."Line Amount";
                                                    Deprec."Depreciation Method" := Deprec."depreciation method"::"Straight-Line";
                                                    Deprec."Depreciation Starting Date" := StoreRequistionHeaders."Order Date";
                                                    Deprec.Insert(true);
                                                end;
                                            end;
                                            //Insert PO Lines
                                            StoreRequistionLine.Reset;
                                            StoreRequistionLine.SetRange("Requistion No", SReqLines."No.");
                                            StoreRequistionLine.SetRange("Line No.", SReqLines."Line No.");
                                            if StoreRequistionLine.Find('-') then begin
                                                // StoreRequistionLine."Requistion No" := StoreRequistionHeaders."No.";
                                                StoreRequistionLine.Type := SReqLines.Type::Asset;
                                                StoreRequistionLine."No." := fasset."No.";
                                                StoreRequistionLine."Quantity Requested" := SReqLines.Quantity;
                                                StoreRequistionLine."Asset Quantity" := SReqLines.Quantity;
                                                StoreRequistionLine.Quantity := SReqLines.Quantity;
                                                GenJnline."Posting Date" := Today;
                                                StoreRequistionLine."Unit Cost" := SReqLines."Unit Cost";
                                                // StoreRequistionLine."Unit of Measure" := SReqLines."Unit of Measure";
                                                StoreRequistionLine."IFMIS Nos" := "Purchase Order No";
                                                // StoreRequistionLine."Line No." := GetLastEntryNo;
                                                StoreRequistionLine."Asset Code" := fasset."No.";
                                                StoreRequistionLine.Description := fasset.Description;
                                                StoreRequistionLine."Line Amount" := SReqLines."Unit Cost";
                                                StoreRequistionLine."Shortcut Dimension 1 Code" := SReqLines."Shortcut Dimension 1 Code";
                                                StoreRequistionLine."Shortcut Dimension 2 Code" := SReqLines."Shortcut Dimension 2 Code";
                                                StoreRequistionLine."Purchasing Store" := SReqLines."Purchasing Store";
                                                StoreRequistionLine.Modify();
                                            end;
                                            // Post to Asset Ledgers
                                            LineNoRec := LineNoRec + 1000;
                                            GenJnlines.Reset();
                                            if GenJnlines.Find('-') then
                                                TLed := GenJnlines.Count;
                                            LineNoRec := TLed + 1;
                                            // GenJnlines.Reset();
                                            // GenJnlines.SetRange(GenJnlines."Journal Template Name", 'ASSETS');
                                            // GenJnlines.SetRange(GenJnlines."Journal Batch Name", 'ACQ');
                                            // if GenJnlines.Find('-') then
                                            //     GenJnlines.DeleteAll();
                                            GenJnlines.Init;
                                            GenJnlines."Journal Template Name" := 'ASSETS';
                                            GenJnlines."Journal Batch Name" := 'ACQ';
                                            GenJnlines."Line No." := LineNoRec;
                                            //GenJnline."Account Type":=GenJnline."Account Type"::"Fixed Asset";
                                            GenJnlines."Document No." := "No.";
                                            if StoreRequistionLine.Quantity = 0 then
                                                StoreRequistionLine.Quantity := 1;
                                            GenJnlines."Posting Date" := Today;
                                            // GenJnlines."FA Posting Type" := SReqLines.Quantity;
                                            // GenJnlines."Output Quantity (Base)" := SReqLines.Quantity;
                                            // GenJnlines."Invoiced Qty. (Base)" := Quantity;
                                            GenJnlines.Quantity := SReqLines.Quantity;
                                            GenJnlines."Quantity Allocated2" := SReqLines.Quantity;
                                            // GenJnlines."FA Posting Type" := GenJnlines."FA Posting Type"::Disposal;
                                            GenJnlines."FA No." := SReqLines."No.";
                                            GenJnlines."Model/Model" := SReqLines."Make/Model";
                                            GenJnlines.Description := SReqLines."Make/Model";
                                            ////GenJnlines.VALIDATE(StoreRequistionLine."No.");
                                            GenJnlines."FA Posting Date" := "Request date";

                                            // GenJnlines.Description := SReqLines.Description;
                                            GenJnlines.Amount := SReqLines."Line Amount";
                                            GenJnlines."External Document No." := StoreRequistionHeaders."Purchase Order No";
                                            GenJnlines."Shortcut Dimension 1 Code" := "Global Dimension 1 Code";
                                            GenJnlines.Validate("Shortcut Dimension 1 Code");
                                            GenJnlines."Shortcut Dimension 2 Code" := "Shortcut Dimension 2 Code";
                                            GenJnlines.Validate("Shortcut Dimension 2 Code");
                                            GenJnlines."Depreciation Book Code" := 'NLC';
                                            GenJnlines.Insert(true);
                                            fasset.Reset;
                                            fasset.SetRange(fasset."No.", SReqLines."No.");
                                            if fasset.Find('-') then
                                                //  fasset."Asset Movement Status" := fasset."asset movement status"::Available;
                                                fasset."Supplier Name" := StoreRequistionHeaders."Vendor Name";
                                            //  fasset."IFMIS Code" := StoreRequistionLine."IFMIS Nos";
                                            fasset.Modify;
                                            ////Status:=Status::Posted;
                                            // Modify;


                                            //Post Entries
                                            GenJnlines.Reset;
                                            GenJnlines.SetRange(GenJnlines."Journal Template Name", 'ASSETS');
                                            GenJnlines.SetRange(GenJnlines."Journal Batch Name", 'ACQ');
                                            Codeunit.Run(Codeunit::"FA Jnl.-Post Batch", GenJnlines);
                                            //End Post to Ledgers


                                        end;
                                    end;
                                until SReqLines.Next = 0;
                            end;
                        end;
                    end;
                end;


                if Status = Status::Released then begin
                    if "Document Type" = "document type"::PR then begin
                        if "Action Type" = "action type"::Item then
                            if Status = Status::Released then
                                //
                                if InventorySetup.Get then begin
                                    InventorySetup.TestField(InventorySetup."Item Jnl Template");
                                    InventorySetup.TestField(InventorySetup."Item Jnl Batch");
                                    GenJnline.Reset;
                                    GenJnline.SetRange(GenJnline."Journal Template Name", InventorySetup."Item Jnl Template");
                                    GenJnline.SetRange(GenJnline."Journal Batch Name", InventorySetup."Item Jnl Batch");
                                    if GenJnline.Find('-') then GenJnline.DeleteAll;
                                    ReqLine.Reset;
                                    ReqLine.SetRange(ReqLine."Requistion No", "No.");
                                    if ReqLine.Find('-') then begin
                                        repeat
                                            ItemsRec.Reset();
                                            ItemsRec.SetRange("No.", ReqLine."No.");
                                            if ItemsRec.Find('-') then begin
                                                ItemsRec.Status := ItemsRec.Status::Approved;
                                                ItemsRec.Modify();
                                            end;
                                            //Receive
                                            ReqLine.CalcFields("Issuing Store");
                                            LineNo := LineNo + 1000;
                                            // GenJnlines.Reset();
                                            // if GenJnlines.FindSet() then
                                            //     TLed := GenJnlines.Count;
                                            // LineNoRec := TLed + 1;
                                            TLed := 0;
                                            GenJnlineREC.Reset();
                                            // if GenJnline.FindSet() then
                                            TLed := GenJnlineREC.Count;
                                            TLed := TLed + 1;
                                            GenJnline.Init;
                                            GenJnline."Journal Template Name" := InventorySetup."Item Jnl Template";
                                            GenJnline."Journal Batch Name" := InventorySetup."Item Jnl Batch";
                                            GenJnline."Line No." := TLed;
                                            GenJnline."Posting Date" := Today;
                                            GenJnline."Entry Type" := GenJnline."entry type"::"Positive Adjmt.";
                                            GenJnline."Document No." := "No.";
                                            GenJnline."Item No." := ReqLine."No.";
                                            if ReqLine.Quantity = 0 then
                                                ReqLine.Quantity := 1;
                                            GenJnline."Invoiced Qty. (Base)" := ReqLine.Quantity;
                                            GenJnline."Output Quantity (Base)" := ReqLine.Quantity;
                                            GenJnline."Quantity (Base)" := ReqLine.Quantity;
                                            GenJnline."Unit of Measure Code" := ReqLine."Unit of Measure";
                                            // GenJnline.Validate("Item No.");
                                            GenJnline.Quantity := ReqLine.Quantity;
                                            GenJnline."Location Code" := ReqLine."Issuing Store";
                                            GenJnline."Bin Code" := ReqLine."Bin Code";
                                            // GenJnline.Validate("Location Code");
                                            GenJnline."Posting Date" := Today;
                                            GenJnline.Description := "Request Description";
                                            GenJnline.Quantity := ReqLine.Quantity;
                                            GenJnline."Gen. Bus. Posting Group" := 'LOCAL';
                                            GenJnline."Gen. Prod. Posting Group" := 'GOODS';

                                            GenJnline."Order No." := "Purchase Order No";
                                            GenJnline."Invoice No." := "Invoice No";
                                            GenJnline."Vendor No" := "Vendor No.";
                                            GenJnline."Vendor Name" := "Vendor Name";
                                            GenJnline."Employee No" := "Employee Code";
                                            GenJnline."Employee Name" := "Employee Name";
                                            GenJnline."Order No" := "Order No";
                                            GenJnline."User ID" := "Requester ID";
                                            GenJnline."Unit Amount" := ReqLine."Unit Cost";
                                            GenJnline.Amount := ReqLine."Line Amount";

                                            GenJnline."Shortcut Dimension 1 Code" := "Global Dimension 1 Code";
                                            GenJnline.Validate("Shortcut Dimension 1 Code");
                                            GenJnline."Shortcut Dimension 2 Code" := "Shortcut Dimension 2 Code";
                                            GenJnline.Validate("Shortcut Dimension 2 Code");
                                            GenJnline.ValidateShortcutDimCode(3, "Shortcut Dimension 3 Code");
                                            GenJnline.ValidateShortcutDimCode(4, "Shortcut Dimension 4 Code");
                                            // GenJnline.Validate(Quantity);
                                            GenJnline.Validate("Unit Amount");

                                            //GenJnline."Reason Code":='221';
                                            //GenJnline.VALIDATE("Reason Code");
                                            GenJnline.Insert(true);

                                        //ReqLine."Request Status":=ReqLine."Request Status"::Closed;

                                        until ReqLine.Next = 0;
                                        GenJnline.Reset;
                                        GenJnline.SetRange(GenJnline."Journal Template Name", InventorySetup."Item Jnl Template");
                                        GenJnline.SetRange(GenJnline."Journal Batch Name", InventorySetup."Item Jnl Batch");
                                        Codeunit.Run(Codeunit::"Item Jnl.-Post Batch", GenJnline);
                                        // Codeunit.Run(Codeunit::"Gen. Jnl.-Post", GenJnline);
                                        rec.Status := rec.Status::Posted;
                                        rec.Received := true;
                                        rec."Received By" := UserId;
                                        rec."Received Date" := Today;
                                        // Modify;
                                    end;
                                end;
                    end;
                end;
                // if Status = Status::Released then begin
                //     if "Document Type" = "document type"::PR then begin
                //         if "Action Type" = "action type"::Item then
                //             if Status = Status::Released then
                //                 //
                //                 if InventorySetup.Get then begin
                //                     InventorySetup.TestField(InventorySetup."Item Jnl Template");
                //                     InventorySetup.TestField(InventorySetup."Item Jnl Batch");
                //                     GenJnline.Reset;
                //                     GenJnline.SetRange(GenJnline."Journal Template Name", InventorySetup."Item Jnl Template");
                //                     GenJnline.SetRange(GenJnline."Journal Batch Name", InventorySetup."Item Jnl Batch");
                //                     if GenJnline.Find('-') then GenJnline.DeleteAll;
                //                     ReqLine.Reset;
                //                     ReqLine.SetRange(ReqLine."Requistion No", "No.");
                //                     if ReqLine.Find('-') then begin
                //                         repeat
                //                             ItemsRec.Reset();
                //                             ItemsRec.SetRange("No.", ReqLine."No.");
                //                             if ItemsRec.Find('-') then begin
                //                                 ItemsRec.Status := ItemsRec.Status::Approved;
                //                                 ItemsRec.Modify();
                //                             end;
                //                             //Receive
                //                             ReqLine.CalcFields("Issuing Store");
                //                             LineNo := LineNo + 1000;
                //                             GenJnline.Init;
                //                             GenJnline."Journal Template Name" := InventorySetup."Item Jnl Template";
                //                             GenJnline."Journal Batch Name" := InventorySetup."Item Jnl Batch";
                //                             GenJnline."Line No." := LineNo;
                //                             GenJnline."Entry Type" := GenJnline."entry type"::"Positive Adjmt.";
                //                             GenJnline."Document No." := "No.";
                //                             GenJnline."Item No." := ReqLine."No.";
                //                             GenJnline."Unit of Measure Code" := ReqLine."Unit of Measure";
                //                             // GenJnline.Validate("Item No.");
                //                             GenJnline."Location Code" := ReqLine."Issuing Store";
                //                             GenJnline."Bin Code" := ReqLine."Bin Code";
                //                             // GenJnline.Validate("Location Code");
                //                             GenJnline."Posting Date" := Today;
                //                             GenJnline.Description := "Request Description";
                //                             GenJnline.Quantity := ReqLine.Quantity;
                //                             GenJnline."Gen. Bus. Posting Group" := 'LOCAL';
                //                             GenJnline."Gen. Prod. Posting Group" := 'GOODS';

                //                             GenJnline."Order No." := "Purchase Order No";
                //                             GenJnline."Invoice No." := "Invoice No";
                //                             GenJnline."Vendor No" := "Vendor No.";
                //                             GenJnline."Vendor Name" := "Vendor Name";
                //                             GenJnline."Employee No" := "Employee Code";
                //                             GenJnline."Employee Name" := "Employee Name";
                //                             GenJnline."Order No" := "Order No";
                //                             GenJnline."User ID" := "Requester ID";
                //                             GenJnline."Unit Amount" := ReqLine."Unit Cost";
                //                             GenJnline.Amount := ReqLine."Line Amount";

                //                             GenJnline."Shortcut Dimension 1 Code" := "Global Dimension 1 Code";
                //                             GenJnline.Validate("Shortcut Dimension 1 Code");
                //                             GenJnline."Shortcut Dimension 2 Code" := "Shortcut Dimension 2 Code";
                //                             GenJnline.Validate("Shortcut Dimension 2 Code");
                //                             GenJnline.ValidateShortcutDimCode(3, "Shortcut Dimension 3 Code");
                //                             GenJnline.ValidateShortcutDimCode(4, "Shortcut Dimension 4 Code");
                //                             //  GenJnline.Validate(Quantity);
                //                             GenJnline.Validate("Unit Amount");

                //                             //GenJnline."Reason Code":='221';
                //                             //GenJnline.VALIDATE("Reason Code");
                //                             GenJnline.Insert(true);

                //                         //ReqLine."Request Status":=ReqLine."Request Status"::Closed;

                //                         until ReqLine.Next = 0;

                //                         //Post Entries
                //                         GenJnline.Reset;
                //                         GenJnline.SetRange(GenJnline."Journal Template Name", InventorySetup."Item Jnl Template");
                //                         GenJnline.SetRange(GenJnline."Journal Batch Name", InventorySetup."Item Jnl Batch");
                //                         Codeunit.Run(Codeunit::"Item Jnl.-Post", GenJnline);
                //                         //End Post entries

                //                         //Modify All
                //                         //Post:=FALSE;
                //                         //Post:=JournlPosted.PostedSuccessfully();
                //                         //IF Post THEN BEGIN
                //                         //ReqLine.MODIFYALL(ReqLine."Request Status",ReqLine."Request Status"::Closed);
                //                         // Status := Status::Posted;
                //                         rec.Status := rec.Status::Posted;
                //                         rec.Received := true;
                //                         rec."Received By" := "Requester ID";
                //                         rec."Received Date" := Today;
                //                         // Modify;
                //                     end;
                //                 end;
                //     end;
                //end;





            end;
        }
        field(11; Supplier; Code[20])
        {
            TableRelation = Vendor;
        }
        field(12; "Action Type"; Option)
        {
            OptionCaption = 'Item,Asset';
            OptionMembers = Item,Asset;

            trigger OnValidate()
            begin
                /*
                IF Type=Type::"G/L Account" THEN BEGIN
                   IF "Action Type"="Action Type"::Issue THEN
                            ERROR('You cannot Issue a G/L Account please order for it')
                END;


               //Compare Quantity in Store and Qty to Issue
                IF Type=Type::Item THEN BEGIN
                   IF "Action Type"="Action Type"::Issue THEN BEGIN
                    IF Quantity>"Qty in store" THEN
                      ERROR('You cannot Issue More than what is available in store')
                   END;
                END;
                */

            end;
        }
        field(29; Justification; Text[250])
        {
        }
        field(30; "User ID"; Code[50])
        {
        }
        field(31; "Global Dimension 1 Code"; Code[20])
        {
            CaptionClass = '1,1,1';
            Caption = 'Global Dimension 1 Code';
            Description = 'Stores the reference to the first global dimension in the database';
            NotBlank = false;
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(1));

            trigger OnValidate()
            begin
                Dimval.Reset;
                Dimval.SetRange(Dimval."Global Dimension No.", 1);
                Dimval.SetRange(Dimval.Code, "Global Dimension 1 Code");
                if Dimval.Find('-') then
                    "Function Name" := Dimval.Name;

                ValidateShortcutDimCode(1, "Global Dimension 1 Code");
            end;
        }
        field(56; "Shortcut Dimension 2 Code"; Code[20])
        {
            CaptionClass = '1,2,2';
            // Caption = 'Shortcut Dimension 2 Code';
            Description = 'Stores the reference of the second global dimension in the database';
            NotBlank = false;
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(2));

            trigger OnValidate()
            begin
                Dimval.Reset;
                Dimval.SetRange(Dimval."Global Dimension No.", 2);
                Dimval.SetRange(Dimval.Code, "Shortcut Dimension 2 Code");
                if Dimval.Find('-') then
                    "Budget Center Name" := Dimval.Name;

                ValidateShortcutDimCode(2, "Shortcut Dimension 2 Code");
            end;
        }
        field(57; "Function Name"; Text[100])
        {
            Description = 'Stores the name of the function in the database';
        }
        field(58; "Budget Center Name"; Text[100])
        {
            Description = 'Stores the name of the budget center in the database';
        }
        field(81; "Shortcut Dimension 3 Code"; Code[20])
        {
            CaptionClass = '1,2,3';
            Caption = 'Shortcut Dimension 3 Code';
            Description = 'Stores the reference of the Third global dimension in the database';

            trigger OnLookup()
            begin
                LookupShortcutDimCode(3, "Shortcut Dimension 3 Code");
                Validate("Shortcut Dimension 3 Code");
            end;

            trigger OnValidate()
            begin
                Dimval.Reset;
                //Dimval.SETRANGE(Dimval."Global Dimension No.",3);
                Dimval.SetRange(Dimval.Code, "Shortcut Dimension 3 Code");
                if Dimval.Find('-') then
                    Dim3 := Dimval.Name;

                ValidateShortcutDimCode(3, "Shortcut Dimension 3 Code");
            end;
        }
        field(82; "Shortcut Dimension 4 Code"; Code[20])
        {
            CaptionClass = '1,2,4';
            Caption = 'Shortcut Dimension 4 Code';
            Description = 'Stores the reference of the Third global dimension in the database';

            trigger OnLookup()
            begin
                LookupShortcutDimCode(4, "Shortcut Dimension 4 Code");
                Validate("Shortcut Dimension 4 Code");
            end;

            trigger OnValidate()
            begin
                Dimval.Reset;
                //Dimval.SETRANGE(Dimval."Global Dimension No.",4);
                Dimval.SetRange(Dimval.Code, "Shortcut Dimension 4 Code");
                if Dimval.Find('-') then
                    Dim4 := Dimval.Name;

                ValidateShortcutDimCode(4, "Shortcut Dimension 4 Code");
            end;
        }
        field(83; Dim3; Text[250])
        {
        }
        field(84; Dim4; Text[250])
        {
        }
        field(85; "Responsibility Center"; Code[10])
        {
            Caption = 'Responsibility Center';
            TableRelation = "Responsibility Center BR NEW".Code;

            trigger OnValidate()
            begin
                /*
                TESTFIELD(Status,Status::Open);
                IF NOT UserMgt.CheckRespCenter(1,"Responsibility Center") THEN
                  ERROR(
                    Text001,
                    RespCenter.TABLECAPTION,UserMgt.GetPurchasesFilter)
                "Location Code" := UserMgt.GetLocation(1,'',"Responsibility Center");
                IF "Location Code" = '' THEN BEGIN
                  IF InvtSetup.GET THEN
                    "Inbound Whse. Handling Time" := InvtSetup."Inbound Whse. Handling Time";
                END ELSE BEGIN
                  IF Location.GET("Location Code") THEN;
                  "Inbound Whse. Handling Time" := Location."Inbound Whse. Handling Time";
                END;
                
                UpdateShipToAddress;
                   */

                /*
             CreateDim(
               DATABASE::"Responsibility Center","Responsibility Center",
               DATABASE::Vendor,"Pay-to Vendor No.",
               DATABASE::"Salesperson/Purchaser","Purchaser Code",
               DATABASE::Campaign,"Campaign No.");

             IF xRec."Responsibility Center" <> "Responsibility Center" THEN BEGIN
               RecreatePurchLines(FIELDCAPTION("Responsibility Center"));
               "Assigned User ID" := '';
             END;
               */

            end;
        }
        field(86; TotalAmount; Decimal)
        {
            CalcFormula = sum("Store Requisition TT Line"."Line Amount" where("Requistion No" = field("No.")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(87; "Issuing Store"; Code[10])
        {
            TableRelation = Location;

            trigger OnValidate()
            begin

                ReqLines.Reset;
                ReqLines.SetRange(ReqLines."Requistion No", "No.");
                if ReqLines.Find('-') then begin
                    repeat
                        ReqLines."Issuing Store" := "Issuing Store";
                    until ReqLines.Next = 0;
                end;
            end;
        }
        field(88; "Job No"; Code[20])
        {
            TableRelation = "HR Employee Qualifications"."Employee No.";
        }
        field(89; "Posting Date"; Date)
        {
        }
        field(90; "Document Type"; Option)
        {
            OptionCaption = 'PR,SR,MEMO,ASSET';
            OptionMembers = PR,SR,MEMO,ASSET;
            Editable = false;
        }
        field(91; "No. Printed"; Integer)
        {
            Caption = 'No. Printed';
            Editable = false;
        }
        field(480; "Dimension Set ID"; Integer)
        {
            Caption = 'Dimension Set ID';
            Editable = false;
            TableRelation = "Dimension Set Entry";

            trigger OnLookup()
            begin
                ShowDimensions;
            end;
        }
        field(481; "Employee Code"; Code[20])
        {
            Editable = false;
            //TableRelation = "HR Employees"."No.";
            // trigger OnValidate()
            // var
            //     myInt: Integer;
            //     HrEmployee: Record "HR Employees";
            // begin
            //     HrEmployee.Reset();
            //     HrEmployee.SetRange("No.", rec."Employee Code");
            //     if HrEmployee.FindFirst() then
            //         rec."Employee Name" := HrEmployee."Full Name";

            // end;
        }
        field(482; "Employee Name"; Text[100])
        {
            Editable = false;
        }
        field(483; Received; Boolean)
        {
            Editable = false;
        }
        field(484; "Received By"; Code[80])
        {
            Editable = false;
        }
        field(485; "Received Date"; Date)
        {
            //Editable = false;
        }
        field(486; "Invoice No"; Code[50])
        {
        }
        field(487; "Order No"; Code[50])
        {
        }
        field(488; "Vendor No."; Code[20])
        {
            TableRelation = Vendor;

            trigger OnValidate()
            begin
                if Vend.Get("Vendor No.") then begin
                    "Vendor Name" := Vend.Name
                end
                else
                    "Vendor Name" := '-';
            end;
        }
        field(489; "Vendor Name"; Text[100])
        {
        }
        field(490; "Purchasing Store"; Code[20])
        {
            TableRelation = Location;
            Caption = 'Store location';
        }
        field(491; "Date Received"; Date)
        {
        }
        field(492; Rejected; Boolean)
        {
            Editable = false;
        }
        field(493; "Rejected By"; Code[80])
        {
            Editable = false;
        }
        field(494; "Rejected Date"; Date)
        {
            Editable = false;
        }
        field(495; "Purchase Order No"; Code[50])
        {
            Caption = 'PO No.';
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin
                /*
                PurchH.RESET;
                PurchH.SETRANGE(PurchH.IFMIS_No,"Purchase Order No");
                IF PurchH.FIND('-') THEN
                   BEGIN
                   REPEAT
                  "Vendor Name":=PurchH."Supplier Name";
                   Currency:=PurchH.Currency;
                   "Order Date":=PurchH.Date;
                    "Rejected PO No.":=PurchH.IFMIS_No;
                     Rec.MODIFY;
                    UNTIL PurchH.NEXT=0;
                END;
                //Insert the Asset Lines
                PurchLines.RESET;
                PurchLines.SETRANGE(PurchLines."IFMIS No","Purchase Order No");
                PurchLines.SETRANGE(PurchLines.Type,PurchLines.Type::Asset);
                IF PurchLines.FIND('-') THEN
                  BEGIN
                      REPEAT
                    SReqLines."Requistion No":="No.";
                    SReqLines.Type:=PurchLines.Type;
                    SReqLines."Asset Code":=PurchLines."Asset Code";
                    SReqLines."No.":=PurchLines."Asset No.";
                    SReqLines.Description:=PurchLines.Description;
                    SReqLines."Quantity Requested":=PurchLines.Quantity;
                    SReqLines."Unit Cost":=PurchLines.Price;
                    SReqLines."Unit of Measure":=PurchLines."Unit of Measure";
                    SReqLines."Line Amount":=PurchLines."Line Total";
                    SReqLines.LineNo:=PurchLines."Line No";
                    SReqLines.Category:=PurchLines.Category;
                    SReqLines."Account Combination":=PurchLines."Account Combination";
                    SReqLines."Req No":=PurchLines."Req No";
                    SReqLines."Quot No":=PurchLines."Quot No";
                    SReqLines."Contr. No":=PurchLines."Contr. No";
                    SReqLines.Currency:= PurchLines.Currency;
                    SReqLines."Line No.":=GetLastEntryNo;
                    SReqLines."Purchasing Store":="Purchasing Store";
                    SReqLines."Shortcut Dimension 1 Code":="Global Dimension 1 Code";
                    SReqLines."Shortcut Dimension 2 Code":="Shortcut Dimension 2 Code";
                    SReqLines."Supplier Name":=PurchH."Supplier Name";
                    SReqLines."Approved IFMIS No.":= "Purchase Order No";
                    SReqLines.INSERT;
                    UNTIL PurchLines.NEXT=0;
                END;
                
                
                //Insert the Item Lines
                PurchLines.RESET;
                PurchLines.SETRANGE(PurchLines."IFMIS No","Purchase Order No");
                PurchLines.SETRANGE(PurchLines.Type,PurchLines.Type::Item);
                IF PurchLines.FIND('-') THEN
                  BEGIN
                      REPEAT
                    SReqLines."Requistion No":="No.";
                    SReqLines.Type:=PurchLines.Type;
                    //SReqLines."Asset Code":=PurchLines."Asset Code";
                    SReqLines."No.":=PurchLines."Item No";
                    SReqLines.Description:=PurchLines.Description;
                    SReqLines."Quantity Requested":=PurchLines.Quantity;
                    SReqLines."Unit Cost":=PurchLines.Price;
                    SReqLines."Unit of Measure":=PurchLines."Unit of Measure";
                    SReqLines."Line Amount":=PurchLines."Line Total";
                    SReqLines.LineNo:=PurchLines."Line No";
                    SReqLines.Category:=PurchLines.Category;
                    SReqLines."Account Combination":=PurchLines."Account Combination";
                    SReqLines."Req No":=PurchLines."Req No";
                    SReqLines."Quot No":=PurchLines."Quot No";
                    SReqLines."Contr. No":=PurchLines."Contr. No";
                    SReqLines.Currency:= PurchLines.Currency;
                    SReqLines."Line No.":=GetLastEntryNo;
                    SReqLines."Purchasing Store":="Purchasing Store";
                    SReqLines."Shortcut Dimension 1 Code":="Global Dimension 1 Code";
                    SReqLines."Shortcut Dimension 2 Code":="Shortcut Dimension 2 Code";
                    SReqLines."Supplier Name":=PurchH."Supplier Name";
                    SReqLines."Approved IFMIS No.":= "Purchase Order No";
                     SReqLines."IFMIS Nos":= "Purchase Order No";
                    IF Item.GET(SReqLines."No.") THEN
                       SReqLines."Unit of Measure":=Item."Base Unit of Measure";
                
                    SReqLines.INSERT;
                    UNTIL PurchLines.NEXT=0;
                END;
                  */

            end;
        }
        field(496; "Approval Status"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Open,Approved,Pending Approval,Pending Recommendation,Cancelled,Posted,Rejected';
            OptionMembers = Open,Approved,"Pending Approval","Pending Recommendation",Cancelled,Posted,Rejected;
        }
        field(497; "Booking Type"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Ticket,Hotel';
            OptionMembers = Ticket,Hotel;

            trigger OnValidate()
            begin
                SReqLines.Reset;
                SReqLines.SetRange(SReqLines."Requistion No", "No.");
                if SReqLines.Find('-') then begin
                    repeat
                        SReqLines."Booking Type" := "Booking Type";
                        SReqLines.Modify;
                    until SReqLines.Next = 0;
                end;
            end;
        }
        field(498; "No of Lines"; Integer)
        {
            CalcFormula = count("Store Requisition TT Line" where("Requistion No" = field("No.")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(499; Currency; Text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(500; "Order Date"; Date)
        {
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin
                //IF "Order Date" <> 0D THEN BEGIN
                //  IF "Order Date" > TODAY THEN
                //ERROR('Order Date cannot be a future Date',"Order Date");

                //END;
            end;
        }
        field(501; "Approved IFMIS Order"; Code[50])
        {
            Caption = 'Approved PO ';
            TableRelation = "Store Requisition TT Line"."Requistion No" where("Request Status" = const(Released));

            trigger OnValidate()
            begin

                PurchH.Reset;
                //PurchH.SetRange(PurchH.IFMIS_No, "Approved IFMIS Order");
                if PurchH.Find('-') then begin
                    repeat
                        // "Vendor Name" := PurchH."Supplier Name";
                        // Currency := PurchH.Currency;
                        // "Order Date" := PurchH.Date;
                        Rec.Modify;
                    until PurchH.Next = 0;
                end;
            end;
        }
        field(502; "Rejected PO No."; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(503; Allocated; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(504; "User Signature"; Blob)
        {
            DataClassification = ToBeClassified;
            SubType = Bitmap;
        }
        field(505; "Date Signed"; DateTime)
        {
            DataClassification = ToBeClassified;
        }
        field(506; Open; Integer)
        {
            CalcFormula = count("Store Requistion Headers" where(Status = const(Open)));
            Editable = false;
            FieldClass = FlowField;
        }
        field(507; "Pending Approval"; Integer)
        {
            CalcFormula = count("Store Requistion Headers" where(Status = const("Pending Approval")));
            FieldClass = FlowField;
        }
        field(508; Approved; Integer)
        {
            CalcFormula = count("Store Requistion Headers" where(Status = const(Released)));
            FieldClass = FlowField;
        }
        field(509; "File Movement Code"; code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(510; "Delivery Note"; code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(511; "Current Location Store"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(512; "Serial No."; Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(513; "Reopened By"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(514; Barcode; Text[100])
        {
            DataClassification = ToBeClassified;
            // ExtendedDatatype =;
        }
        field(515; "Issued By"; Text[200])
        {
            DataClassification = ToBeClassified;
        }
        field(516; "Card No"; Code[40])
        {
            DataClassification = ToBeClassified;
            trigger OnValidate()
            var
                myInt: Integer;
            begin
                if "Card No" <> xRec."Card No" then begin
                    GenLedgerSetup.Get();
                    NoSeriesMgt.TestManual(GenLedgerSetup."Card No");
                    "No. Series" := '';
                end;

            end;
        }
        field(517; "Approval Comments"; Text[500])
        {
            DataClassification = ToBeClassified;
        }
        field(518; "HOD Comments"; Text[500])
        {
            DataClassification = ToBeClassified;
        }
        field(519; "Objective"; Blob)
        {
            SubType = Memo;
        }

    }

    keys
    {
        key(Key1; "No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
        fieldgroup(Required; "No.", "Required Date", "Request Description", Status)
        {
        }
    }

    trigger OnDelete()
    begin
        if Status <> Status::Open then
            Error('You Cannot DELETE an already released Requisition')
    end;

    trigger OnInsert()
    var
        SerialIn: Record "Serial No. Information";
    begin

        if "No." = '' then begin
            if "Document Type" = "document type"::PR then begin
                PurchSetup.Get;
                PurchSetup.TestField("Purchase Req No");
                NoSeriesMgt.InitSeries(PurchSetup."Purchase Req No", xRec."No.", 0D, "No.", "No. Series");
                //NoSeriesMgt.InitSeries(PurchSetup."File Movement Numbers", xRec."File Movement Code", 0D, "File Movement Code", "No. Series");
            end;

            if "Document Type" = "document type"::SR then begin
                PurchSetup.Get;
                PurchSetup.TestField(PurchSetup."Store Requisition Nos.");
                NoSeriesMgt.InitSeries(PurchSetup."Store Requisition Nos.", xRec."No.", 0D, "No.", "No. Series");
            end;

            if "Document Type" = "document type"::MEMO then begin
                PurchSetup.Get;
                PurchSetup.TestField(PurchSetup."Internal Memo Nos.");
                NoSeriesMgt.InitSeries(PurchSetup."Internal Memo Nos.", xRec."No.", 0D, "No.", "No. Series");
            end;


            if "Document Type" = "document type"::ASSET then begin
                PurchSetup.Get;
                PurchSetup.TestField(PurchSetup."Asset Receiving No");
                NoSeriesMgt.InitSeries(PurchSetup."Asset Receiving No", xRec."No.", 0D, "No.", "No. Series");
            end;
        end;



        if UsersRec.Get(UserId) then begin
            // if UsersRec."Can recceive" = false then
            //     Error('Insufficient rights to receive items/assets');
            Empl.Reset();
            Empl.SetRange(Empl."User ID", UsersRec."User ID");
            if Empl.Find('-') then begin
                "Employee Code" := Empl."No.";
                "Employee Name" := Empl."First Name" + ' ' + Empl."Last Name";
                "Global Dimension 1 Code" := Empl."Global Dimension 1 Code";
                rec.Validate("Global Dimension 1 Code");
                "Shortcut Dimension 2 Code" := Empl."Global Dimension 2 Code";
                rec.Validate("Shortcut Dimension 2 Code");
                "Responsibility Center" := Empl."Responsibility Center";
                "Function Name" := Empl."County Name";
                "Budget Center Name" := Empl."Department Name";
                "Request date" := Today;
                "Posting Date" := Today;
                // if "Requester ID" = '' then begin
                //     "User ID" := UserId;
                //     "Requester ID" := UserId;
                //     "Date Received" := Today;
                //     "Required Date" := Today;
                // end;
            end;
        end else begin
            if UsersRec.get(rec."Requester ID") then begin
                // if UsersRec."Can recceive" = false then
                //     Error('Insufficient rights to receive items/assets');
                Empl.Reset();
                Empl.SetRange(Empl."User ID", UsersRec."User ID");
                if Empl.Find('-') then begin
                    "Employee Code" := Empl."No.";
                    "Employee Name" := Empl."First Name" + ' ' + Empl."Last Name";
                    "Global Dimension 1 Code" := Empl."Global Dimension 1 Code";
                    rec.Validate("Global Dimension 1 Code");
                    "Shortcut Dimension 2 Code" := Empl."Global Dimension 2 Code";
                    rec.Validate("Shortcut Dimension 2 Code");
                    "Responsibility Center" := Empl."Responsibility Center";
                    "Function Name" := Empl."County Name";
                    "Budget Center Name" := Empl."Department Name";
                    "Request date" := Today;
                    "Posting Date" := Today;
                    if "Requester ID" = '' then begin
                        "User ID" := UserId;
                        //"Requester ID" := UserId;
                        "Date Received" := Today;
                        "Required Date" := Today;
                    end;
                end;
            end;
            "Request date" := Today;
            "Posting Date" := Today;
            // if "Requester ID" = '' then begin
            //     "User ID" := UserId;
            //     "Requester ID" := UserId;
            //     // "Date Received" := Today;
            //     "Required Date" := Today;
            // end;

        end;

        /*
        IF "No." = '' THEN BEGIN
          NoSeriesMgt.InitSeries(GetNoSeriesCode,xRec."No. Series",0D,"No.","No. Series");
        END;
        //EXIT(GetNoSeriesRelCode(NoSeriesCode));
        */

        "Issuing Store" := 'MAIN STORE';
        "Purchasing Store" := 'MAIN STORE';
        //edited
        "Serial No." := "No.";

    end;

    trigger OnModify()
    begin
        //  IF Status=Status::Released THEN
        //     ERROR('You Cannot modify an already Approved Requisition');
        /*
        ReqLines.RESET;
        ReqLines.SETRANGE(ReqLines."Requistion No","No.");
        IF ReqLines.FIND('-') THEN BEGIN
        REPEAT
          ReqLines."Shortcut Dimension 1 Code":="Global Dimension 1 Code";
          ReqLines."Shortcut Dimension 2 Code":="Shortcut Dimension 2 Code";
        //  ReqLines."dimension set id" := "dimension set id";
        UNTIL ReqLines.NEXT=0;
        END;
        */

    end;

    var
        NoSeriesMgt: Codeunit 396;
        PurchSetup: Record "Purchases & Payables Setup";
        // UserDept: Record 52193632;
        // RespCenter: Record 52193659;
        UserMgt: Codeunit 52193453;
        Text001: label 'Your identification is set up to process from %1 %2 only.';
        Dimval: Record 349;
        ReqLines: Record "Store Requistion Lines";
        DimMgt: Codeunit 408;
        RequisitionHeader: Record "Store Requistion Header";
        GenLedgerSetup: Record "Purchases & Payables Setup";
        UsersRec: Record "User Setup";
        Empl: Record "HR Employees";
        Vend: Record Vendor;
        PurchLines: Record "Attachment Lines";
        SRHeader: Record "Store Requistion Headers";
        SReqLines: Record "Store Requisition TT Line";
        PurchH: Record Attachments1;
        fasset: Record "Fixed Asset";
        NoSeriesMgnt: Codeunit 396;
        i: Integer;
        Counter: Integer;
        NextCode: Code[100];
        Deprec: Record "FA Depreciation Book";
        Item: Record Item;
        StoreRequistionHeaders: Record "Store Requistion Headers";
        StoreRequistionLine: Record "Store Requisition TT Line";
        NextCodeRec: Code[100];
        InventorySetup: Record 313;
        GenJnline: Record "Item Journal Line";
        ReqLine: Record "Store Requisition TT Line";
        LineNo: Integer;
        GenJnlines: Record 5621;
        LineNos: Integer;
        FASetup: Record 5605;
        LineNoRec: Integer;


    procedure GetNoSeriesRelCode(NoSeriesCode: Code[20]): Code[10]
    var
        GenLedgerSetup: Record 98;
        RespCenter: Record 52193659;
        DimMgt: Codeunit 408;
        NoSrsRel: Record 310;
    begin
        //EXIT(GetNoSeriesRelCode(NoSeriesCode));
        GenLedgerSetup.Get;
        case GenLedgerSetup."Base No. Series" of
            GenLedgerSetup."base no. series"::"Responsibility Center":
                begin
                    NoSrsRel.Reset;
                    NoSrsRel.SetRange(Code, NoSeriesCode);
                    NoSrsRel.SetRange("Series Filter", "Responsibility Center");
                    if NoSrsRel.FindFirst then
                        exit(NoSrsRel."Series Code")
                end;
            GenLedgerSetup."base no. series"::"Shortcut Dimension 1":
                begin
                    NoSrsRel.Reset;
                    NoSrsRel.SetRange(Code, NoSeriesCode);
                    NoSrsRel.SetRange("Series Filter", "Global Dimension 1 Code");
                    if NoSrsRel.FindFirst then
                        exit(NoSrsRel."Series Code")
                end;
            GenLedgerSetup."base no. series"::"Shortcut Dimension 2":
                begin
                    NoSrsRel.Reset;
                    NoSrsRel.SetRange(Code, NoSeriesCode);
                    NoSrsRel.SetRange("Series Filter", "Shortcut Dimension 2 Code");
                    if NoSrsRel.FindFirst then
                        exit(NoSrsRel."Series Code")
                end;
            GenLedgerSetup."base no. series"::"Shortcut Dimension 3":
                begin
                    NoSrsRel.Reset;
                    NoSrsRel.SetRange(Code, NoSeriesCode);
                    NoSrsRel.SetRange("Series Filter", "Shortcut Dimension 3 Code");
                    if NoSrsRel.FindFirst then
                        exit(NoSrsRel."Series Code")
                end;

            GenLedgerSetup."base no. series"::"Shortcut Dimension 4":
                begin
                    NoSrsRel.Reset;
                    NoSrsRel.SetRange(Code, NoSeriesCode);
                    NoSrsRel.SetRange("Series Filter", "Shortcut Dimension 4 Code");
                    if NoSrsRel.FindFirst then
                        exit(NoSrsRel."Series Code")
                end;
            else
                exit(NoSeriesCode);
        end;
    end;

    local procedure GetNoSeriesCode(): Code[10]
    var
        NoSeriesCode: Code[20];
    begin
        ///GenLedgerSetup.GET();
        /*
        IF "Document Type" = "Document Type"::Grant THEN
          GenLedgerSetup.TESTFIELD(GenLedgerSetup."Staff Grants Nos.")
       ELSE
       */
        GenLedgerSetup.TestField(GenLedgerSetup."Stores Requisition No");
        /*
        IF "Document Type" = "Document Type"::Grant THEN
          NoSeriesCode:=GenLedgerSetup."Staff Grants Nos."
        ELSE
        */

        NoSeriesCode := GenLedgerSetup."Stores Requisition No";

        exit(GetNoSeriesRelCode(NoSeriesCode));

    end;

    procedure LinesExists(): Boolean
    var
        PayLines: Record "Store Requisition TT Line";
        HasLines: Boolean;
    begin
        HasLines := false;
        PayLines.Reset();
        PayLines.SetRange(PayLines."Requistion No", Rec."No.");
        if PayLines.Find('-') then begin
            HasLines := true;
            exit(HasLines);
        end;
    end;


    procedure ShowDimensions()
    begin
        "Dimension Set ID" :=
          DimMgt.EditDimensionSet("Dimension Set ID", StrSubstNo('%1 %2', 'Payments', "No."));
        //VerifyItemLineDim;
        DimMgt.UpdateGlobalDimFromDimSetID("Dimension Set ID", "Global Dimension 1 Code", "Shortcut Dimension 2 Code");
    end;


    procedure ValidateShortcutDimCode(FieldNumber: Integer; var ShortcutDimCode: Code[20])
    begin
        DimMgt.ValidateShortcutDimValues(FieldNumber, ShortcutDimCode, "Dimension Set ID");
    end;


    procedure LookupShortcutDimCode(FieldNumber: Integer; var ShortcutDimCode: Code[20])
    begin
        DimMgt.LookupDimValueCode(FieldNumber, ShortcutDimCode);
        ValidateShortcutDimCode(FieldNumber, ShortcutDimCode);
    end;


    procedure ShowShortcutDimCode(var ShortcutDimCode: array[8] of Code[20])
    begin
        DimMgt.GetShortcutDimensions("Dimension Set ID", ShortcutDimCode);
    end;

    local procedure GetLastEntryNo() LastLineNum: Integer
    var
        SRLines: Record "Store Requisition TT Line";
    begin
        SRLines.Reset;
        SRLines.SetRange(SRLines."Requistion No", "No.");
        if SRLines.Find('+') then begin
            LastLineNum := SRLines."Line No." + 1;
        end else begin
            LastLineNum := 1000;
        end;
    end;
}

