
tableextension 52193487 tableextension50160 extends "Fixed Asset"
{

    fields
    {
        modify("Responsible Employee")
        {
            Caption = 'Responsible Officer No';

            //Unsupported feature: Property Modification (Name) on ""Responsible Employee"(Field 16)".

            TableRelation = "HR Employees";
            trigger OnAfterValidate()
            var
                myInt: Integer;
                HrEmployees: Record "HR Employees";
            begin


            end;




        }

        //Unsupported feature: Property Modification (Data type) on ""Serial No."(Field 17)".


        //Unsupported feature: Code Modification on "Description(Field 2).OnValidate".

        //trigger OnValidate()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
        /*
        IF ("Search Description" = UPPERCASE(xRec.Description)) OR ("Search Description" = '') THEN
          "Search Description" := Description;
        IF Description <> xRec.Description THEN BEGIN
          FADeprBook.SETCURRENTKEY("FA No.");
          FADeprBook.SETRANGE("FA No.","No.");
          FADeprBook.MODIFYALL(Description,Description);
        END;
        MODIFY(TRUE);
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
         FALedEntry.RESET;
         FALedEntry.SETRANGE(FALedEntry."FA No.","No.");
         IF FALedEntry.FINDFIRST THEN BEGIN
            IF (Description)<>(xRec.Description) THEN
               ERROR('There are already entries for Fixed Asset '+"No."+', Cannot change the Description');
         END;

        IF ("Search Description" = UPPERCASE(xRec.Description)) OR ("Search Description" = '') THEN
          "Search Description" := Description;

        #3..7
        //MODIFY(TRUE);
        */
        //end;


        //Unsupported feature: Code Insertion on ""FA Posting Group"(Field 29)".

        //trigger OnValidate()
        //Parameters and return type have not been exported.
        //begin
        /*
         FALedEntry.RESET;
         FALedEntry.SETRANGE(FALedEntry."FA No.","No.");
         IF FALedEntry.FINDFIRST THEN BEGIN
            IF ("FA Posting Group")<>(xRec."FA Posting Group") THEN
               ERROR('There are already entries for Fixed Asset '+"No."+', Cannot change the Posting Group');
         END;
        */
        //end;
        field(50000; "Budget Controlled"; Boolean)
        {
            Caption = 'Budget Controlled';
            DataClassification = CustomerContent;
        }
        field(50001; "Date Filter"; Date)
        {
            Caption = 'Date Filter';
            FieldClass = FlowFilter;
        }
        field(50002; "Global Dimension 1 Filter"; Code[20])
        {
            CaptionClass = '1,3,1';
            Caption = 'Global Dimension 1 Filter';
            FieldClass = FlowFilter;
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(1));
        }
        field(50003; "Global Dimension 2 Filter"; Code[20])
        {
            CaptionClass = '1,3,2';
            Caption = 'Global Dimension 2 Filter';
            FieldClass = FlowFilter;
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(2));
        }
        field(50004; "Location Filter"; Code[10])
        {
            Caption = 'Location Filter';
            FieldClass = FlowFilter;
            TableRelation = Location;
        }
        field(50005; "Budget Name"; Code[10])
        {
            FieldClass = FlowFilter;
            TableRelation = "G/L Budget Name";
            Caption = 'Budget Name';
        }
        field(50006; "Budget Qty"; Decimal)
        {
            CalcFormula = sum("FA Budget Entry"."Cost Amount" where("FA No." = field("No."),
                                                                     "Budget Name" = field("Budget Name"),
                                                                     Date = field("Date Filter")));
            FieldClass = FlowField;
            Caption = 'Budget Qty';
            Editable = false;
        }
        field(50007; No2; Code[20])
        {
            Caption = 'No2';
            DataClassification = CustomerContent;
        }
        field(50008; Donated; Boolean)
        {
            Caption = 'Donated';
            DataClassification = CustomerContent;
        }
        field(50050; "Asset Type"; Option)
        {
            OptionMembers = " ",Truck,Trailer,"Other Vehicle",Machinery;
            Caption = 'Asset Type';
            DataClassification = CustomerContent;
        }
        field(50051; "WIP No."; Code[20])
        {
            TableRelation = Job;
            Caption = 'WIP No.';
            DataClassification = CustomerContent;
        }
        field(50052; Vehicle; Boolean)
        {
            Caption = 'Vehicle';
            DataClassification = CustomerContent;
        }
        field(50054; Station; Boolean)
        {
            Caption = 'Station';
            DataClassification = CustomerContent;
        }
        field(50055; "Financed By"; Text[50])
        {
            Caption = 'Financed By';
            DataClassification = CustomerContent;
        }
        field(50056; "Tag No"; Text[100])
        {
            Caption = 'Tag No';
            ObsoleteState = Removed;
            DataClassification = CustomerContent;

            trigger OnValidate()
            var
                myInt: Integer;
                prpayrollsetup: Record "Purchases & Payables Setup";
                NoSeriesMgt: Codeunit NoSeriesManagement;
            begin
                // if "Tag No" <> xRec."Tag No" then begin
                //     prpayrollsetup.Get();
                //     NoSeriesMgt.TestManual(prpayrollsetup."Tag No");
                //     "No. Series" := '';
                // end;


            end;
        }
        field(50057; "Make/Model"; Text[100])
        {
            Caption = 'Make/Model';
            TableRelation = "Make/Model".Description where(Type = field(Type));
            DataClassification = ToBeClassified;
            trigger OnValidate()
            var
                myInt: Integer;
            begin
                rec.Description := "Make/Model";

            end;
        }
        field(50058; "Date of Delivery/Installation"; Date)
        {
            Caption = 'Date of Delivery/Installation';
            DataClassification = CustomerContent;
        }
        field(50059; Condition; Text[100])
        {
            Caption = 'Condition';
            DataClassification = CustomerContent;
        }
        field(50060; "Supplier Name"; Text[50])
        {
            Caption = 'Supplier Name';

            DataClassification = CustomerContent;
        }
        field(50061; "County Name"; Text[100])
        {
            Caption = 'County Name';
            DataClassification = CustomerContent;
        }
        field(50062; "Location Name"; Text[150])
        {
            Caption = 'Location Name';
            DataClassification = CustomerContent;
        }

        field(50064; "Notes/Remarks"; Text[300])
        {
            Caption = 'Notes/Remarks';
            DataClassification = CustomerContent;
        }
        field(50066; "Asset Movement Status"; Option)
        {
            Caption = '';
            OptionMembers = ,Issued,Allocated,Requested,Available,Disposed;
            DataClassification = ToBeClassified;
        }
        field(50067; "Tagging No"; Code[70])
        {
            Caption = 'Tag No';
            DataClassification = CustomerContent;
            trigger OnValidate()
            var
                myInt: Integer;

            begin
                // if "Tagging No" <> xRec."Tagging No" then begin
                //     prpayrollsetup.Get();
                //     NoSeriesMgt.TestManual(prpayrollsetup."Tag No");
                //     "No. Series" := '';
                // end;
                // if "Tagging No" = '' then begin
                //     prpayrollsetup.Get();
                //     prpayrollsetup.TestField(prpayrollsetup."Tag No");
                //     NoSeriesMgt.InitSeries(prpayrollsetup."Tag No", xRec."No. Series", 0D, "Tagging No", "No. Series");
                // end;

            end;
        }
        field(50068; Type; Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = " ",Chair,Tables,"Laptops/Computers",Vehicles,Land,Building,"Office Quipment";
            trigger OnValidate()
            var
                myInt: Integer;
            begin
                Description := '';
                "Make/Model" := '';
                "FA Class Code" := '';
                "FA Subclass Code" := '';

                "Tagging No" := '';
                "Category Name" := '';
                if "Tagging No" = '' then begin
                    if Type = Type::"Laptops/Computers" then begin
                        prpayrollsetup.Get();
                        prpayrollsetup.TestField(prpayrollsetup."Laptop/Computer Tage");
                        NoSeriesMgt.InitSeries(prpayrollsetup."Laptop/Computer Tage", xRec."No. Series", 0D, "Tagging No", "No. Series");
                        rec."Unit Of Measure" := 'NO';
                        rec."Serial No." := 'N/A';
                        rec."FA Class Code" := 'TANGIBLE';
                        rec.Validate(rec."FA Class Code");
                        "Make/Model" := '';
                        rec."FA Subclass Code" := 'ICT';
                        rec.Validate(rec."FA Subclass Code");
                        // "Category Name" := 'ICTEQUIP';
                        Description := '';

                    end;
                    if Type = Type::Chair then begin
                        prpayrollsetup.Get();
                        prpayrollsetup.TestField(prpayrollsetup."Chair Tag");
                        NoSeriesMgt.InitSeries(prpayrollsetup."Chair Tag", xRec."No. Series", 0D, "Tagging No", "No. Series");
                        rec."Unit Of Measure" := 'NO';
                        rec."Serial No." := 'N/A';
                        rec."FA Class Code" := 'TANGIBLE';
                        rec.Validate(rec."FA Class Code");
                        rec."FA Subclass Code" := 'OFFICE  EQ';
                        // rec.Validate(rec."FA Subclass Code");
                        "Category Name" := 'OFFICE  EQ';
                        "Make/Model" := '';
                        Description := '';
                    end;
                    if Type = Type::Tables then begin
                        prpayrollsetup.Get();
                        prpayrollsetup.TestField(prpayrollsetup."Table Tag");
                        NoSeriesMgt.InitSeries(prpayrollsetup."Table Tag", xRec."No. Series", 0D, "Tagging No", "No. Series");
                        rec."Unit Of Measure" := 'NO';
                        rec."Serial No." := 'N/A';
                        rec."FA Class Code" := 'TANGIBLE';
                        rec.Validate(rec."FA Class Code");
                        rec."FA Subclass Code" := 'OFFICE  EQ';
                        rec.Validate(rec."FA Subclass Code");
                        "Make/Model" := '';
                        "Category Name" := 'OFFICE  EQ';
                        Description := '';
                    end;
                    if Type = Type::Vehicles then begin
                        rec."Unit Of Measure" := 'NO';
                        rec."FA Class Code" := 'TANGIBLE';
                        rec.Validate(rec."FA Class Code");
                        "Make/Model" := '';
                        Description := '';

                    end;
                    //     prpayrollsetup.Get();
                    //     prpayrollsetup.TestField(prpayrollsetup."Vehicle Tag");
                    //     NoSeriesMgt.InitSeries(prpayrollsetup."Vehicle Tag", xRec."No. Series", 0D, "Tagging No", "No. Series");
                    // end;
                end;
                "Date of Delivery/Installation" := Today;

            end;
        }
        field(50070; "Card No."; Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(50071; "Unit Of Measure"; Code[60])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Unit of Measure";
        }
        field(50072; "Staff No"; Code[40])
        {
            DataClassification = ToBeClassified;
            TableRelation = "HR Employees"."No.";
            trigger OnValidate()
            var
                myInt: Integer;
                EmployeeRec: Record "HR Employees";
            begin
                EmployeeRec.Reset();
                EmployeeRec.SetRange("No.", rec."Staff No");
                if EmployeeRec.Find('-') then begin
                    rec."Staff Name" := EmployeeRec."Full Name";
                    rec."Responsible Office/Officer" := EmployeeRec."Full Name";
                end;

            end;
        }
        field(50073; "Staff Name"; Text[200])
        {
            DataClassification = ToBeClassified;
            Caption = 'Responsible Employee Name';
        }
        field(50074; "FA Q in Store"; Decimal)
        {

            FieldClass = FlowField;
            CalcFormula = sum("FA Ledger Entry".Quantity where(Description = field("Make/Model")));
        }
        field(50075; Returned; Boolean)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(50076; "Returned Reason"; Text[500])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(50077; "Returned By"; Text[100])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(50014; "Responsibility Center"; Code[10])
        {
            TableRelation = "Responsibility Center BR NEW".Code;
            //TableRelation = "Dimension Value".Code where("Global Dimension No." = const(2));
            Caption = 'Department';
            //CaptionClass = '1,1,2';

            trigger OnValidate()
            var
                myInt: Integer;
                Responsblece: Record "Responsibility Center BR NEW";
            begin
                Responsblece.Reset();
                Responsblece.SetRange(Code, Rec."Responsibility Center");
                if Responsblece.FindFirst() then
                    "Department Name" := Responsblece.Name;

            end;

        }
        field(50015; "Department Name"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(50016; "Quantity Allocated"; Decimal)
        {

            DataClassification = ToBeClassified;

        }
        field(50017; "Quantity Allocated2"; Decimal)
        {
            FieldClass = FlowField;
            Editable = false;
            CalcFormula = sum("FA Ledger Entry"."Quantity Allocated2" where(Description = field("Make/Model"), "Global Dimension 2 Code" = field("Responsibility Center")));

        }
        field(50018; "Category Name"; Code[300])
        {
            DataClassification = ToBeClassified;
        }
        field(50019; "Mode of Acquisition"; Option)
        {
            OptionMembers = " ",Purchase,Transfer,Donation;
            Caption = 'Mode of Acquisition';
            DataClassification = ToBeClassified;
        }
        field(50020; LandCategory; Option)
        {
            OptionMembers = " ",Land,Investment,Property;
            Caption = 'Land Category';
            DataClassification = ToBeClassified;
        }
        field(50021; "GPS"; Decimal)
        {
            Caption = 'GPS Postion';
            DataClassification = ToBeClassified;
        }
        field(50022; A; Decimal)
        {
            Caption = 'Point A';
            DataClassification = ToBeClassified;
        }
        field(50023; B; Decimal)
        {
            Caption = 'Point B';
            DataClassification = ToBeClassified;
        }
        field(50024; C; Decimal)
        {
            Caption = 'Point C';
            DataClassification = ToBeClassified;
        }
        field(50025; D; Decimal)
        {
            Caption = 'Point D';
            DataClassification = ToBeClassified;
        }
        field(50026; "L.R /certifcate No."; Code[50])
        {
            DataClassification = ToBeClassified;
            Caption = 'L.R /certifcate No.';
        }
        field(50027; "Document of ownership"; Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = " ","Title deed",Certificate,"allotment letter";
            Caption = 'Document of ownership';
        }
        field(50028; "Proprietorship/ ownership"; Text[100])
        {
            DataClassification = ToBeClassified;
            Caption = 'Proprietorship/ ownership details as per document of title';
        }
        field(50029; "Size(Ha)"; Decimal)
        {
            DataClassification = ToBeClassified;
            Caption = 'Size in Hectars';
        }
        field(50030; "Ownership status"; Option)
        {
            OptionMembers = " ",Freehold,leasehold;
            DataClassification = ToBeClassified;
        }
        field(50031; "Reg. Date"; Date)
        {
            DataClassification = ToBeClassified;
            Caption = 'Registration Date';
        }
        field(50032; Disputed; Boolean)
        {

            DataClassification = ToBeClassified;
            Caption = 'Disputed';
        }
        field(50033; Encumberances; Text[100])
        {
            DataClassification = ToBeClassified;
            Caption = 'Encumberances';
        }
        field(50034; Planned; Boolean)
        {

            DataClassification = ToBeClassified;
            Caption = 'Planned';
        }
        field(50035; Surveyed; Boolean)
        {

            DataClassification = ToBeClassified;
            Caption = 'Surveyed';
        }
        field(50036; "Purpose of Land"; Text[100])
        {
            DataClassification = ToBeClassified;
            Caption = 'Purpose of Land';
        }
        field(50037; "Fair value/Land index"; Code[50])
        {
            DataClassification = ToBeClassified;
            Caption = 'Fair value/ Ministry of Lands zonal maps or land index';
        }
        field(50038; "Annual rental income"; Decimal)
        {
            DataClassification = ToBeClassified;
            Caption = 'Annual rental income (for investment property)';
        }
        field(50039; "Building Ownership"; Text[100])
        {
            DataClassification = ToBeClassified;
            Caption = 'Building Ownership';

        }
        field(50040; "Institution No."; Code[50])
        {
            DataClassification = ToBeClassified;
            Caption = 'Institution Number';

        }
        field(50041; Street; Text[50])
        {
            DataClassification = ToBeClassified;
            Caption = 'Street';

        }
        field(50042; "Type Of Building"; Option)
        {
            OptionMembers = " ",Permanent,"Temporary";
            DataClassification = ToBeClassified;
            Caption = 'Type Of Building';
        }
        field(50043; "Estimated Useful Life"; Decimal)
        {
            DataClassification = ToBeClassified;
            Caption = 'Estimated Useful Life';
        }
        field(50044; "Number Of Floors"; Integer)
        {
            DataClassification = ToBeClassified;
            Caption = 'Number Of Floors';
        }
        field(50045; "Plinth Area"; Decimal)
        {
            DataClassification = ToBeClassified;
            Caption = 'Plinth Area';
        }
        field(50046; "Cost of Construction/Valuation"; Decimal)
        {
            DataClassification = ToBeClassified;
            Caption = 'Cost of Construction/Valuation';
        }
        field(50047; "Nearest Location"; Text[100])
        {
            DataClassification = ToBeClassified;
            Caption = 'Nearest Location';
        }
        field(50048; "GPS1"; Text[100])
        {
            Caption = 'GPS Postion';
            DataClassification = ToBeClassified;
        }
        field(50049; A1; Text[100])
        {
            Caption = 'Point A';
            DataClassification = ToBeClassified;
        }
        field(50078; B1; Text[100])
        {
            Caption = 'Point B';
            DataClassification = ToBeClassified;
        }
        field(50079; C1; Text[100])
        {
            Caption = 'Point C';
            DataClassification = ToBeClassified;
        }
        field(50080; D1; Text[100])
        {
            Caption = 'Point D';
            DataClassification = ToBeClassified;
        }
        field(50081; Planned1; Option)
        {
            OptionMembers = " ",Planned,Unplanned;
            DataClassification = ToBeClassified;
            Caption = 'Planned';
        }
        field(50082; Surveyed1; Option)
        {
            OptionMembers = " ",Surveyed,"Not Surveyed";
            DataClassification = ToBeClassified;
            Caption = 'Surveyed';
        }
        field(50083; Disputed1; Option)
        {
            OptionMembers = " ",Disputed,Undisputed;
            DataClassification = ToBeClassified;
            Caption = 'Disputed';
        }
        field(50084; Disposed; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(50085; "Disposal Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(50086; "Replacement Date (if applicable)"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(50087; "Pv Number"; Code[100])
        {
            DataClassification = ToBeClassified;
        }

        field(50088; "Objective"; Blob)
        {
            SubType = Memo;
        }
        field(6000; "Depreciation Status"; Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = " ","Partially Depreciated",Depreciated;
        }
        field(50063; "Responsible Office/Officer"; Text[100])
        {
            Caption = 'Responsible Office/Officer';
            DataClassification = CustomerContent;
        }
        field(60020; "Purchase Amount"; Decimal)
        {
            DataClassification = ToBeClassified;
        }



    }



    //Unsupported feature: Code Modification on "OnDelete".

    //trigger OnDelete()
    //>>>> ORIGINAL CODE:
    //begin
    /*
    LOCKTABLE;
    FADeprBook.LOCKTABLE;
    MainAssetComp.LOCKTABLE;
    #4..35
    CommentLine.DELETEALL;

    DimMgt.DeleteDefaultDim(DATABASE::"Fixed Asset","No.");
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    #1..38

    //ERROR('You are not allowed to delete')
    */
    //end;


    //Unsupported feature: Code Modification on "OnInsert".

    //trigger OnInsert()
    //>>>> ORIGINAL CODE:
    //begin
    /*
    IF "No." = '' THEN BEGIN
      FASetup.GET;
      FASetup.TESTFIELD("Fixed Asset Nos.");
    #4..6
    "Main Asset/Component" := "Main Asset/Component"::" ";
    "Component of Main Asset" := '';

    DimMgt.UpdateDefaultDim(
      DATABASE::"Fixed Asset","No.",
      "Global Dimension 1 Code","Global Dimension 2 Code");
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    #1..9

    //DimMgt.UpdateDefaultDim(
      //DATABASE::"Fixed Asset","No.",
      //"Global Dimension 1 Code","Global Dimension 2 Code");
    */
    //end;


    var
        FALedEntry: Record "FA Ledger Entry";
        prpayrollsetup: Record "Purchases & Payables Setup";
        NoSeriesMgt: Codeunit NoSeriesManagement;

}

