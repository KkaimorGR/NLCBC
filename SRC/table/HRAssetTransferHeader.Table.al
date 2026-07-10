
Table 52193494 "HR Asset Transfer Header"
{
    LookupPageId = "Asset Lines";
    DrillDownPageId = "Asset Lines";

    fields
    {
        field(1; "No."; Code[50])
        {
            Editable = true;
        }
        field(2; "Document Date"; Date)
        {
            trigger OnValidate()

            begin
                "User ID" := UserId;
                EmployeeRec.Reset();
                EmployeeRec.SetRange("User ID", UserId);
                if EmployeeRec.Find('-') then begin
                    rec."Staff No." := EmployeeRec."No.";
                    rec.Validate(rec."Staff No.");
                    rec."Staff Name" := EmployeeRec."Full Name";
                    Rec."Responsibility Center" := EmployeeRec."Responsibility Center";

                end;
            end;
        }
        field(5; "Issuing Admin/Asst"; Code[20])
        {
            TableRelation = "HR Employees"."No.";

            trigger OnValidate()
            begin

                hremployee.Reset;
                if hremployee.Get("Issuing Admin/Asst") then begin
                    "Issuing Admin/Asst Name" := hremployee."First Name" + ' ' + hremployee."Last Name";
                end else begin
                    "Issuing Admin/Asst Name" := '';

                end;
            end;
        }
        field(6; "Issuing Admin/Asst Name"; Text[50])
        {
        }
        field(7; "Document Type"; Option)
        {
            OptionCaption = 'Asset Transfer,Asset Allocation,Asset Incidence,Returning,Department Allocation,Asset Movement';
            OptionMembers = "Asset Transfer","Asset Allocation","Asset Incidence",Returning,"Department Allocation","Asset Movement";
        }
        field(8; "Currency Code"; Code[10])
        {
        }
        field(9; "No. Series"; Code[10])
        {
        }
        field(10; Status; Option)
        {
            OptionCaption = 'Open,Pending Approval,Approved,Canceled,Posted,Pending Recommendation,Rejected,Issued';
            OptionMembers = Open,"Pending Approval",Approved,Canceled,Posted,"Pending Recommendation",Rejected,Issued;
            trigger OnValidate()
            var
                myInt: Integer;
                FSetup: Record "FA Setup";
                ApprovalEntry: Record "Approval Entry";
                ItemsRec: Record Item;
                TLed: Integer;
                HrAssetsLines: Record "HR Asset Transfer Lines";
                DeprBook: Record "Depreciation Book";
                FaLedgerEntry: Record "FA Ledger Entry";



            begin
                if rec.Status = rec.Status::Approved then begin
                    if rec."Document Type" = rec."Document Type"::"Department Allocation" then begin
                        HrAssetsLines.Reset();
                        HrAssetsLines.SetRange("No.", rec."No.");
                        if HrAssetsLines.Find('-') then begin
                            repeat
                                fasset.Reset;
                                with HrAssetsLines
                                 do begin
                                    fasset.Reset();
                                    fasset.SetRange("No.", HrAssetsLines."Asset No.");
                                    if fasset.Find('-') then begin
                                        if DeprBook.Get('NLC') then begin
                                            DeprBook."Allow Identical Document No." := true;
                                            DeprBook.Modify();
                                        END;
                                        fasset."Make/Model" := HrAssetsLines."Make/Model";
                                        fasset."Responsibility Center" := HrAssetsLines."Responsibility Center";
                                        fasset.Validate(fasset."Responsibility Center");
                                        // fasset."Quantity Allocated" := HrAssetsLines."Quantity Allocated";
                                        // LineNoRec := LineNoRec + 1000;
                                        // GenJnlines.Reset();
                                        // if GenJnlines.Find('-') then
                                        //     TLed := GenJnlines.Count;
                                        // LineNoRec := TLed + 1;
                                        // GenJnlines.Reset();
                                        // GenJnlines.SetRange(GenJnlines."Journal Template Name", 'ASSETS');
                                        // GenJnlines.SetRange(GenJnlines."Journal Batch Name", 'ACQ');
                                        // if GenJnlines.Find('-') then
                                        //     GenJnlines.DeleteAll();
                                        FaLedgerEntry.Reset();
                                        // FaLedgerEntry.SetRange("Document No.", rec."No.");
                                        FaLedgerEntry.SetRange("FA No.", HrAssetsLines."Asset No.");
                                        if FaLedgerEntry.FindFirst() then begin
                                            FaLedgerEntry."Quantity Allocated2" := FaLedgerEntry."Quantity Allocated2" + HrAssetsLines."Quantity Allocated";
                                            FaLedgerEntry."Global Dimension 2 Code" := HrAssetsLines."Responsibility Center";
                                            FaLedgerEntry.Description := HrAssetsLines."Make/Model";
                                            FaLedgerEntry.Modify();
                                        end;
                                        //GenJnlines."Line No." := LineNoRec;
                                        // //GenJnline."Account Type":=GenJnline."Account Type"::"Fixed Asset";
                                        // GenJnlines."Document No." := Format(LineNoRec);
                                        // GenJnlines."Model/Model" := HrAssetsLines."Make/Model";
                                        // if StoreRequistionLine.Quantity = 0 then
                                        //     StoreRequistionLine.Quantity := 1;
                                        // GenJnlines."Posting Date" := Today;
                                        // // GenJnlines."FA Posting Type" := SReqLines.Quantity;
                                        // // GenJnlines."Output Quantity (Base)" := SReqLines.Quantity;
                                        // // GenJnlines."Invoiced Qty. (Base)" := Quantity;
                                        // GenJnlines.Quantity := HrAssetsLines."Quantity Allocated";
                                        // // GenJnlines."FA Posting Type" := GenJnlines."FA Posting Type"::Disposal;
                                        // GenJnlines."FA No." := HrAssetsLines."Asset No.";
                                        // ////GenJnlines.VALIDATE(StoreRequistionLine."No.");
                                        // GenJnlines."FA Posting Date" := Today;
                                        //GenJnlines."Model/Model" := HrAssetsLines."Make/Model";
                                        // GenJnlines.Description := HrAssetsLines."Make/Model";
                                        // // GenJnlines.Amount := HrAssetsLines."Line Amount";
                                        // GenJnlines."Reason Code" := HrAssetsLines."Responsibility Center";
                                        // GenJnlines."External Document No." := rec."Purchase Order No";
                                        // GenJnlines."Shortcut Dimension 1 Code" := "Global Dimension 1 Code";
                                        // GenJnlines.Validate("Shortcut Dimension 1 Code");
                                        // GenJnlines."Shortcut Dimension 2 Code" := "Shortcut Dimension 2 Code";
                                        // GenJnlines.Validate("Shortcut Dimension 2 Code");
                                        // GenJnlines."Depreciation Book Code" := 'NLC';
                                        // GenJnlines.Insert(true);

                                        // //Post Entries
                                        // GenJnlines.Reset;
                                        // GenJnlines.SetRange(GenJnlines."Journal Template Name", 'ASSETS');
                                        // GenJnlines.SetRange(GenJnlines."Journal Batch Name", 'ACQ');
                                        // Codeunit.Run(Codeunit::"FA Jnl.-Post Batch", GenJnlines);
                                        //End Post to Ledgers
                                        fasset.Modify();
                                    end;
                                end;
                            until HrAssetsLines.Next() = 0;
                        end;

                    end;
                    if "Document Type" = rec."Document Type"::Returning then begin
                        HrAssetsLines.Reset();
                        HrAssetsLines.SetRange("No.", rec."No.");
                        if HrAssetsLines.Find('-') then begin
                            repeat
                                fasset.Reset;
                                with HrAssetsLines
                                 do begin
                                    fasset.Reset();
                                    fasset.SetRange("No.", HrAssetsLines."Return No");
                                    if fasset.Find('-') then begin
                                        fasset.Returned := true;
                                        fasset."Returned Reason" := HrAssetsLines.Remarks;
                                        fasset."Returned By" := UserId;
                                        fasset.Modify();
                                    end;
                                end;
                            until HrAssetsLines.Next() = 0;
                        end;

                    end;
                    rec."Approved By" := UserId;
                    ApprovalEntry.Reset();
                    ApprovalEntry.SetRange("Document No.", rec."No.");
                    if ApprovalEntry.Find('-') then
                        rec."Issued By" := ApprovalEntry."Approver ID";
                    if rec."Document Type" = rec."Document Type"::"Asset Allocation" then begin
                        if Status = Status::Approved then begin

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
                                rec."Purchase Order No" := "Purchase Order No";
                                rec."Document Date" := Today;
                                // rec."User ID" := UserId;
                                // rec.Validate("Requester ID");

                                rec."Purchase Order No" := "Purchase Order No";

                                rec.Received := true;
                                // rec.Status := Status::Posted;

                                rec."Received Date" := Today;

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
                                                    fasset."FA Class Code" := fasset."FA Class Code";

                                                    // fasset."Supplier Name" := SReqLines."Supplier Name";
                                                    // fasset."IFMIS Order No" := SReqLines."Approved IFMIS No.";
                                                    fasset."FA Location Code" := fasset."FA Location Code";
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
                                                        Deprec."Depreciation Starting Date" := StoreRequistionHeaders."Document Date";
                                                        Deprec.Modify();
                                                    end else begin
                                                        Deprec.Init();
                                                        Deprec."FA No." := fasset."No.";
                                                        Deprec."Depreciation Book Code" := 'NLC';
                                                        Deprec."FA Posting Group" := 'OFFICEQUIP';
                                                        Deprec."Book Value" := SReqLines."Line Amount";
                                                        Deprec."Depreciation Method" := Deprec."depreciation method"::"Straight-Line";
                                                        Deprec."Depreciation Starting Date" := StoreRequistionHeaders."Document Date";
                                                        Deprec.Insert(true);
                                                    end;
                                                end;
                                                if DeprBook.Get('NLC') then begin
                                                    DeprBook."Allow Identical Document No." := true;
                                                    DeprBook.Modify();
                                                END;
                                                //Insert PO Lines
                                                // StoreRequistionLine.Reset;
                                                // StoreRequistionLine.SetRange("Requistion No", SReqLines."No.");
                                                // StoreRequistionLine.SetRange("Line No.", SReqLines."Line No.");
                                                // if StoreRequistionLine.Find('-') then begin
                                                //     // StoreRequistionLine."Requistion No" := StoreRequistionHeaders."No.";
                                                //     StoreRequistionLine.Type := SReqLines.Type::Asset;
                                                //     StoreRequistionLine."No." := fasset."No.";
                                                //     StoreRequistionLine."Quantity Requested" := SReqLines.Quantity;
                                                //     StoreRequistionLine."Asset Quantity" := SReqLines.Quantity;
                                                //     StoreRequistionLine.Quantity := SReqLines.Quantity;
                                                //     GenJnline."Posting Date" := Today;
                                                //     StoreRequistionLine."Unit Cost" := SReqLines."Unit Cost";
                                                //     StoreRequistionLine."Unit of Measure" := SReqLines."Unit of Measure";
                                                //     StoreRequistionLine."IFMIS Nos" := "Purchase Order No";
                                                //     // StoreRequistionLine."Line No." := GetLastEntryNo;
                                                //     StoreRequistionLine."Asset Code" := fasset."No.";
                                                //     StoreRequistionLine.Description := fasset.Description;
                                                //     StoreRequistionLine."Line Amount" := SReqLines."Unit Cost";
                                                //     StoreRequistionLine."Shortcut Dimension 1 Code" := SReqLines."Shortcut Dimension 1 Code";
                                                //     StoreRequistionLine."Shortcut Dimension 2 Code" := SReqLines."Shortcut Dimension 2 Code";
                                                //     StoreRequistionLine."Purchasing Store" := SReqLines."Purchasing Store";
                                                //     StoreRequistionLine.Modify();
                                                // end;
                                                // Post to Asset Ledgers
                                                LineNoRec := LineNoRec + 1000;
                                                GenJnlines.Reset();
                                                if GenJnlines.Find('-') then
                                                    TLed := GenJnlines.Count;
                                                LineNoRec := TLed + 1;
                                                GenJnlines.Reset();
                                                GenJnlines.SetRange(GenJnlines."Journal Template Name", 'ASSETS');
                                                GenJnlines.SetRange(GenJnlines."Journal Batch Name", 'ACQ');
                                                if GenJnlines.Find('-') then
                                                    GenJnlines.DeleteAll();
                                                GenJnlines.Init;
                                                GenJnlines."Journal Template Name" := 'ASSETS';
                                                GenJnlines."Journal Batch Name" := 'ACQ';
                                                GenJnlines."Line No." := LineNoRec;
                                                //GenJnline."Account Type":=GenJnline."Account Type"::"Fixed Asset";
                                                GenJnlines."Document No." := Rec."No.";

                                                GenJnlines."Model/Model" := SReqLines."Make/Model";
                                                if StoreRequistionLine.Quantity = 0 then
                                                    StoreRequistionLine.Quantity := 1;
                                                GenJnlines."Posting Date" := Today;
                                                // GenJnlines."FA Posting Type" := SReqLines.Quantity;
                                                // GenJnlines."Output Quantity (Base)" := SReqLines.Quantity;
                                                // GenJnlines."Invoiced Qty. (Base)" := Quantity;
                                                GenJnlines.Quantity := (SReqLines.Quantity) * -1;
                                                GenJnlines."Quantity Allocated2" := (SReqLines.Quantity) * -1;
                                                // GenJnlines."FA Posting Type" := GenJnlines."FA Posting Type"::Disposal;
                                                GenJnlines."FA No." := SReqLines."No.";
                                                ////GenJnlines.VALIDATE(StoreRequistionLine."No.");
                                                GenJnlines."FA Posting Date" := Today;
                                                GenJnlines."Model/Model" := SReqLines."Make/Model";
                                                GenJnlines.Description := SReqLines."Make/Model";
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
                                                    // fasset."Supplier Name" := StoreRequistionHeaders.;
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
                    if rec."Document Type" = "Document Type"::"Asset Transfer" then begin
                        TransferLines.Reset();
                        TransferLines.SetRange("No.", rec."No.");
                        if TransferLines.Find('-') then begin
                            repeat
                                if TransferLines.Quantity > 0 then begin

                                    fasset.Reset;
                                    with TransferLines
                                     do begin
                                        ItemsRec.Reset();
                                        ItemsRec.SetRange("No.", TransferLines."No.");
                                        if ItemsRec.Find('-') then begin
                                            ItemsRec.Status := ItemsRec.Status::Approved;
                                            ItemsRec.Modify();
                                        end;
                                        FSetup.get();
                                        fasset.Reset();
                                        fasset.SetRange("No.", TransferLines."No.");
                                        if fasset.Find('-') then begin
                                            NextCode := NoSeriesMgnt.GetNextNo(FSetup."Fixed Asset Nos.", WorkDate, true);
                                            // fasset."No." := NextCode;
                                            fasset.Description := PadStr(TransferLines."Asset Description", 50);
                                            if TransferLines."New Responsible Employee Code" <> '' then begin
                                                // fasset."Supplier Name" := TransferLines."Supplier Name";
                                                fasset."Staff No" := TransferLines."New Responsible Employee Code";
                                                fasset.Validate(fasset."Staff No");
                                            end;
                                            // fasset."IFMIS Order No" := SReqLines."Approved IFMIS No.";
                                            // fasset."IFMIS Code" := SReqLines."Approved Assset Code";
                                            //fasset."Asset Movement Status" := fasset."asset movement status"::New;
                                            fasset."FA Class Code" := fasset."FA Class Code";

                                            // fasset."Supplier Name" := SReqLines."Supplier Name";
                                            // fasset."IFMIS Order No" := SReqLines."Approved IFMIS No.";
                                            fasset."FA Location Code" := fasset."FA Location Code";
                                            // fasset."Location Code" := 'MAIN';
                                            if TransferLines."New Asset Location" <> '' then
                                                fasset."Location Name" := TransferLines."New Asset Location";
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
                                                Deprec."Depreciation Starting Date" := StoreRequistionHeaders."Document Date";
                                                Deprec.Modify();
                                            end else begin
                                                Deprec.Init();
                                                Deprec."FA No." := fasset."No.";
                                                Deprec."Depreciation Book Code" := 'NLC';
                                                Deprec."FA Posting Group" := 'OFFICEQUIP';
                                                Deprec."Book Value" := SReqLines."Line Amount";
                                                Deprec."Depreciation Method" := Deprec."depreciation method"::"Straight-Line";
                                                Deprec."Depreciation Starting Date" := StoreRequistionHeaders."Document Date";
                                                Deprec.Insert(true);
                                            end;
                                        end;
                                    end;
                                end;
                            until SReqLines.Next() = 0;
                        end;

                    end;

                end;

            end;
        }
        field(11; Transfered; Boolean)
        {
        }
        field(12; "Date Transfered"; Date)
        {
        }
        field(13; "Transfered By"; Code[20])
        {
        }
        field(14; "Time Posted"; Time)
        {
        }
        field(50000; "User ID"; Code[50])
        {
            Editable = false;

        }
        field(50001; "Responsibility Center"; Code[50])
        {
            TableRelation = "Responsibility Center BR NEW".Code;
        }
        field(50002; Type; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Issue,Return,Transfer,Exchange,Allocation,Incidence';
            OptionMembers = " ",Issue,Return,Transfer,Exchange,Allocation,Incidence;
        }
        field(50003; Recommender; Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = "User Setup"."User ID";

            trigger OnValidate()
            begin

                /*
              IF Recommender = "Employee No" THEN
              ERROR('It is not possible for an Employee to Recommende him/herself');
                */

                /*
                IF hremployee.GET(Recommender) THEN
                BEGIN
                   "Recommender Name":=hremployee."Full Name";
                END;
                
                IF Recommender='' THEN
                BEGIN
                  "Recommender Name":='';
                END;
                */

            end;
        }
        field(50004; "Recommender Name"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(50005; Store; Code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = Location;

            trigger OnValidate()
            begin
                /*
                ReqLines.RESET;
                ReqLines.SETRANGE(ReqLines."Requistion No","No.");
                IF ReqLines.FIND('-') THEN BEGIN
                REPEAT
                  ReqLines."Issuing Store":="Issuing Store";
                UNTIL ReqLines.NEXT=0;
                END;
                  */

            end;
        }
        field(50006; Rejected; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(50007; "Rejected Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(50008; "Rejection Reason"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(50009; Received; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(50010; "Received Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(50011; "Received By"; Code[80])
        {
            DataClassification = ToBeClassified;
        }
        field(50012; "Rejected By"; Code[80])
        {
            DataClassification = ToBeClassified;
        }
        field(50013; Allocated; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(50014; "Global Dimension 1 Code"; Code[20])
        {
            CaptionClass = '1,1,1';
            Caption = 'Global Dimension 1 Code';
            DataClassification = ToBeClassified;
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(1));
        }
        field(50015; "Global Dimension 2 Code"; Code[20])
        {
            CaptionClass = '1,1,2';
            Caption = 'Global Dimension 2 Code';
            DataClassification = ToBeClassified;
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(2));
        }
        field(50016; "County Name"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(50017; "Directorate Name"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(50018; Returned; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(50019; "Returned Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(50020; "Returned By"; Code[80])
        {
            DataClassification = ToBeClassified;
        }
        field(50021; Transferred; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(50022; "Transferred Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(50023; "Transferred By"; Code[80])
        {
            DataClassification = ToBeClassified;
        }
        field(50024; "User Signature"; Blob)
        {
            DataClassification = ToBeClassified;
            SubType = Bitmap;
        }
        field(50025; "Date Signed"; DateTime)
        {
            DataClassification = ToBeClassified;
        }
        field(50026; "Staff No."; Code[60])
        {
            DataClassification = ToBeClassified;
            TableRelation = "HR Employees"."No.";
            trigger OnValidate()
            var
                myInt: Integer;
                EmployeeRec: Record "HR Employees";
            begin
                EmployeeRec.Reset();
                EmployeeRec.SetRange("No.", rec."Staff No.");
                if EmployeeRec.Find('-') then
                    rec."Staff Name" := EmployeeRec."Full Name";

            end;
        }
        field(50028; "Staff Name"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(50029; "Approved By"; Text[200])
        {
            DataClassification = ToBeClassified;
        }
        field(50030; "Purchase Order No"; Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(50031; "Invoice No"; Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(50032; "Delivery Note"; Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(50033; "Serial No."; Code[40])
        {
            DataClassification = ToBeClassified;
        }
        field(50034; "Request Description"; Text[500])
        {
            DataClassification = ToBeClassified;
            trigger OnValidate()

            begin
                "User ID" := UserId;
                EmployeeRec.Reset();
                EmployeeRec.SetRange("User ID", UserId);
                if EmployeeRec.Find('-') then begin
                    rec."Staff No." := EmployeeRec."No.";
                    rec.Validate(rec."Staff No.");
                    rec."Staff Name" := EmployeeRec."Full Name";
                    Rec."Responsibility Center" := EmployeeRec."Responsibility Center";

                end;
            end;
        }
        field(50035; "Issued By"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(50036; "Approval Comments"; Text[100])
        {
            DataClassification = ToBeClassified;
        }

        // field(50036; Quantity; Decimal)
        // {
        //     DataClassification = ToBeClassified;
        // }

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
    }

    trigger OnInsert()
    begin
        PurchSetup.Get();
        if PurchSetup."Items/Assets Closed" = true then
            Error('you cannot Request items. Kindly contact proccurement department');

        if "No." = '' then begin
            if "Document Type" = "document type"::"Asset Allocation" then begin
                fasetup.Get;
                fasetup.TestField(fasetup."Asset Allocation Nos");
                NoSeriesMgt.InitSeries(fasetup."Asset Allocation Nos", xRec."No. Series", 0D, "No.", "No. Series");
            end;

            if "Document Type" = "document type"::"Asset Incidence" then begin
                fasetup.Get;
                fasetup.TestField(fasetup."Asset Incidence Nos");
                NoSeriesMgt.InitSeries(fasetup."Asset Incidence Nos", xRec."No. Series", 0D, "No.", "No. Series");
            end;

            if "Document Type" = "document type"::"Asset Transfer" then begin
                if Type = Type::Issue then begin
                    fasetup.Get;
                    fasetup.TestField(fasetup."Asset Issue");
                    NoSeriesMgt.InitSeries(fasetup."Asset Issue", xRec."No. Series", 0D, "No.", "No. Series");
                end;
            end;

            if "Document Type" = "document type"::"Asset Transfer" then begin
                if Type = Type::Transfer then begin
                    fasetup.Get;
                    fasetup.TestField(fasetup."Asset Transfer Nos.");
                    NoSeriesMgt.InitSeries(fasetup."Asset Transfer Nos.", xRec."No. Series", 0D, "No.", "No. Series");
                end;
            end;

            if ("Document Type" = "document type"::"Asset Transfer") or ("Document Type" = "document type"::Returning) then begin
                if Type = Type::Return then begin
                    fasetup.Get;
                    fasetup.TestField(fasetup."Asset Return Nos.");
                    NoSeriesMgt.InitSeries(fasetup."Asset Return Nos.", xRec."No. Series", 0D, "No.", "No. Series");
                end;
            end;
            if "Document Type" = "document type"::"Department Allocation" then begin
                if Type = Type::Allocation then begin
                    fasetup.Get;
                    fasetup.TestField(fasetup."Asset Allocation");
                    NoSeriesMgt.InitSeries(fasetup."Asset Allocation", xRec."No. Series", 0D, "No.", "No. Series");
                end;
            end;
        end;

        "Document Date" := Today;


        // "Responsibility Center" := 'SCM';
        // Store := 'MAIN'
    end;

    var
        fasetup: Record "FA Setup";
        hremployee: Record "HR Employees";
        fasset: Record "Fixed Asset";
        DimValue: Record 349;
        EmployeeRec: Record "HR Employees";
        NoSeriesMgt: Codeunit 396;
        PurchSetup: Record "Purchases & Payables Setup";
        UserDept: Record 52193632;
        RespCenter: Record 52193659;
        UserMgt: Codeunit 52193453;
        TransferLines: Record "HR Asset Transfer Lines";
        Text001: label 'Your identification is set up to process from %1 %2 only.';
        Dimval: Record 349;
        ReqLines: Record "Store Requistion Lines";
        DimMgt: Codeunit 408;
        RequisitionHeader: Record "Store Requistion Header";
        GenLedgerSetup: Record "Purchases & Payables Setup";
        UsersRec: Record "User Setup";
        Empl: Record 52193433;
        Vend: Record Vendor;
        PurchLines: Record "Attachment Lines";
        SRHeader: Record "Store Requistion Headers";
        SReqLines: Record "Store Requisition TT Line";
        PurchH: Record Attachments1;

        NoSeriesMgnt: Codeunit 396;
        i: Integer;
        Counter: Integer;
        NextCode: Code[100];
        Deprec: Record "FA Depreciation Book";
        Item: Record Item;
        StoreRequistionHeaders: Record "HR Asset Transfer Header";
        StoreRequistionLine: Record "Store Requisition TT Line";
        NextCodeRec: Code[100];
        InventorySetup: Record 313;
        GenJnline: Record "Item Journal Line";
        ReqLine: Record "Store Requisition TT Line";
        LineNo: Integer;
        GenJnlines: Record 5621;
        LineNos: Integer;

        LineNoRec: Integer;

    procedure LinesExists(): Boolean
    var
        PayLines: Record "HR Asset Transfer Lines";
        HasLines: Boolean;
    begin
        HasLines := false;
        PayLines.Reset();
        PayLines.SetRange(PayLines."No.", Rec."No.");
        if PayLines.Find('-') then begin
            HasLines := true;
            exit(HasLines);
        end;
    end;

    procedure LinesExists1(): Boolean
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
}

