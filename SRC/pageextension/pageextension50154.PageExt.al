
pageextension 52193481 pageextension50154 extends "Fixed Asset Card"
{
    layout
    {

        //Unsupported feature: Property Modification (SourceExpr) on ""Responsible Employee"(Control 63)".


        //Unsupported feature: Property Modification (Name) on ""Responsible Employee"(Control 63)".
        modify("No.")
        {
            Editable = false;
        }
        modify("Responsible Employee")
        {
            Visible = false;
        }


        modify("Vendor No.")
        {


            //Unsupported feature: Property Modification (Name) on ""Vendor No."(Control 10)".

            Caption = 'Maintenance Vendor No';
        }
        modify(Description)
        {
            ApplicationArea = all;
            Visible = false;
            Caption = 'Asset Description ';

            trigger OnAfterValidate()
            var
                myInt: Integer;
                prpayrollsetup: Record "Purchases & Payables Setup";
                NoSeriesMgt: Codeunit NoSeriesManagement;
                DescriptionRexx: Text;
            begin
                "Tagging No" := '';
                DescriptionRexx := LowerCase(Description);
                if StrPos(DescriptionRexx, 'chai') > 0 then begin
                    prpayrollsetup.Get();
                    prpayrollsetup.TestField(prpayrollsetup."Chair Tag");
                    NoSeriesMgt.InitSeries(prpayrollsetup."Chair Tag", xRec."No. Series", 0D, "Tagging No", "No. Series");
                    rec."Unit Of Measure" := 'NO';
                    rec."Serial No." := 'N/A';
                    rec."FA Class Code" := 'TANGIBLE';
                    rec.Validate(rec."FA Class Code");
                    rec."FA Subclass Code" := 'FURNITURE';

                end else
                    if StrPos(DescriptionRexx, 'tabl') > 0 then begin
                        prpayrollsetup.Get();
                        prpayrollsetup.TestField(prpayrollsetup."Table Tag");
                        NoSeriesMgt.InitSeries(prpayrollsetup."Table Tag", xRec."No. Series", 0D, "Tagging No", "No. Series");
                        rec."Unit Of Measure" := 'NO';
                        rec."Serial No." := 'N/A';
                        rec."FA Class Code" := 'TANGIBLE';
                        rec.Validate(rec."FA Class Code");
                        rec."FA Subclass Code" := 'FURNITURE';
                    end else
                        if StrPos(DescriptionRexx, 'Lapt') > 0 then begin
                            prpayrollsetup.Get();
                            prpayrollsetup.TestField(prpayrollsetup."Laptop/Computer Tage");
                            NoSeriesMgt.InitSeries(prpayrollsetup."Laptop/Computer Tage", xRec."No. Series", 0D, "Tagging No", "No. Series");
                            rec."Unit Of Measure" := 'NO';
                            rec."FA Class Code" := 'TANGIBLE';
                            rec.Validate(rec."FA Class Code");

                        end;

            end;
        }
        modify("Search Description")
        {
            ApplicationArea = all;
            Visible = false;
            Caption = 'Make/Model';
        }
        modify("Serial No.")
        {
            ApplicationArea = all;
            Caption = 'Serial No./Chassis No/Engine No.';

        }
        modify("FA Subclass Code")
        {
            Caption = 'Asset Category';
            trigger OnAfterValidate()
            var
                myInt: Integer;
                FaClass: Record "FA Subclass";
            begin
                FaClass.Reset();
                FaClass.SetRange(Code, rec."FA Subclass Code");
                if FaClass.Find('-') then
                    rec."Category Name" := FaClass.Name;

            end;
        }
        modify("Main Asset/Component")
        {
            Visible = false;
        }
        modify("FA Location Code")
        {
            Caption = 'Original Location';
            // Visible = false;
            trigger OnAfterValidate()
            var
                myInt: Integer;
            begin

            end;

        }
        modify("Component of Main Asset")
        {
            Visible = false;
        }
        addafter("FA Subclass Code")
        {
            field("Category Name"; "Category Name")
            {
                ApplicationArea = all;
                Caption = 'Asset Category Name';
                Editable = false;
            }
        }
        addafter(Description)
        {
            field(Type; Type)
            {
                ApplicationArea = all;
                trigger OnValidate()

                begin
                    value1 := rec.Type = rec.Type::Land;
                    value2 := rec.Type = rec.Type::Building;
                end;
            }
            field("Make/Model"; "Make/Model")
            {
                ApplicationArea = all;
            }
        }
        addafter("Serial No.")
        {
            field("Financed By"; Rec."Financed By")
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the Financed By field.';
            }
            field("Tag No"; Rec."Tagging No")
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the Tag No field.';
            }
            field("Pv Number"; "Pv Number")
            {
                ApplicationArea = all;
            }
            // field(Type; Type)
            // {
            //     ApplicationArea = all;
            //     Caption = 'Type';
            //     Visible = false;
            // }
            field("Unit Of Measure"; "Unit Of Measure")
            {
                ApplicationArea = all;
            }
            field("Staff No"; "Staff No")
            {
                ApplicationArea = all;
                Caption = 'Responsible Staff No';
                // Editable = false;
            }
            field("Staff Name"; "Staff Name")
            {
                ApplicationArea = all;
                Editable = false;
            }

            // field("Make/Model"; Rec."Make/Model")
            // {
            //     ApplicationArea = Basic;
            //     ToolTip = 'Specifies the value of the Make/Model field.';
            //     trigger OnValidate()
            //     var
            //         myInt: Integer;
            //     begin
            //         rec.TestField("Tagging No");
            //     end;
            // }
            field("Date of Delivery/Installation"; Rec."Date of Delivery/Installation")
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the Date of Delivery/Installation field.';
            }
            field(Condition; Rec.Condition)
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the Condition field.';
            }
            field("Supplier Name"; Rec."Supplier Name")
            {
                ApplicationArea = Basic;
                Visible = false;
                ToolTip = 'Specifies the value of the Supplier Name field.';
            }
            field("County Name"; Rec."County Name")
            {
                ApplicationArea = Basic;
                Visible = false;
                ToolTip = 'Specifies the value of the County Name field.';
            }
            field("Location Name"; Rec."Location Name")
            {
                ApplicationArea = Basic;
                // Editable = false;
                ToolTip = 'Specifies the value of the Location Name field.';
            }

            field("Notes/Remarks"; Rec."Notes/Remarks")
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the Notes/Remarks field.';
            }
            field("Card No."; "Card No.")
            {
                ApplicationArea = all;
            }
            field("Replacement Date (if applicable)"; "Replacement Date (if applicable)")
            {
                ApplicationArea = all;
            }

        }
        addafter(Blocked)
        {
            field(Supplier; Rec."Vendor No.")
            {
                ApplicationArea = Basic;
                Caption = 'Supplier';
                Visible = false;
                ToolTip = 'Specifies the number of the vendor from which you purchased this fixed asset.';
            }
        }
        addafter("Responsible Employee")
        {
            field("Responsible Office"; Rec."Global Dimension 2 Code")
            {
                ApplicationArea = Basic;
                Caption = 'Responsible Office';
                Visible = false;
                ToolTip = 'Specifies the value of the Responsible Office field.';
            }
            field("Global Dimension 1 Code"; Rec."Global Dimension 1 Code")
            {
                ApplicationArea = Basic;
                Visible = false;
                ToolTip = 'Specifies the value of the Global Dimension 1 Code field.';
            }
            field("Location Code"; Rec."Location Code")
            {
                ApplicationArea = Basic;
                Visible = false;
                ToolTip = 'Specifies the value of the Location Code field.';
            }
            field("Asset Type"; Rec."Asset Type")
            {
                ApplicationArea = Basic;
                Visible = false;
                ToolTip = 'Specifies the value of the Asset Type field.';
            }
            field("FA Q in Store"; "FA Q in Store")
            {
                ApplicationArea = all;
                Editable = false;
                Caption = 'Quantity In store';
            }
            field("Returned Reason"; "Returned Reason")
            {
                ApplicationArea = all;
            }
            field(Returned; Returned)
            {
                ApplicationArea = all;
                trigger OnValidate()
                var
                    myInt: Integer;
                begin
                    // rec.TestField("Returned Reason");
                    if rec.Returned = true then begin
                        if Rec."Returned Reason" = '' then
                            Error('Return Reason must have a value');
                    end
                    else
                        rec."Returned Reason" := '';
                end;
            }
            field("Responsibility Center"; "Responsibility Center")
            {
                ApplicationArea = all;
                Editable = false;
                Visible = false;
            }
            field("Department Name"; "Department Name")
            {
                ApplicationArea = all;
                Editable = false;
                Visible = false;
            }
            field("Quantity Allocated"; "Quantity Allocated2")
            {
                ApplicationArea = all;
                Visible = false;
                Editable = false;
                Caption = 'Quantity Allocated';
            }
        }
        moveafter(Description; "Search Description")
        moveafter("Serial No."; Inactive)
        addlast(Content)
        {
            group(Land)
            {
                Caption = 'Land Details';
                Visible = value1;

                field("Mode of Acquisition";
                "Mode of Acquisition")
                {
                    ApplicationArea = All;

                }


                field(LandCategory; LandCategory)
                {
                    ApplicationArea = All;

                }

                field(GPS; GPS1)
                {
                    ApplicationArea = All;

                }
                field(A; A1)
                {
                    ApplicationArea = All;

                }
                field(B; B1)
                {
                    ApplicationArea = All;

                }
                field(C; C1)
                {
                    ApplicationArea = All;

                }
                field(D; D1)
                {
                    ApplicationArea = All;

                }
                field("L.R /certifcate No."; "L.R /certifcate No.")
                {
                    ApplicationArea = All;

                }
                field("Document of ownership"; "Document of ownership")
                {
                    ApplicationArea = All;

                }
                field("Proprietorship/ ownership"; "Proprietorship/ ownership")
                {
                    ApplicationArea = All;

                }
                field("Size(Ha)"; "Size(Ha)")
                {
                    ApplicationArea = All;

                }
                field("Ownership status"; "Ownership status")
                {
                    ApplicationArea = All;

                }
                field("Reg. Date"; "Reg. Date")
                {
                    ApplicationArea = All;

                }
                field(Disputed; Disputed1)
                {
                    ApplicationArea = All;

                }
                field(Encumberances; Encumberances)
                {
                    ApplicationArea = All;

                }
                field(Planned; Planned1)
                {
                    ApplicationArea = All;

                }
                field("Purpose of Land"; "Purpose of Land")
                {
                    ApplicationArea = All;

                }
                field(Surveyed; Surveyed1)
                {
                    ApplicationArea = All;

                }
                field("Fair value/Land index"; "Fair value/Land index")
                {
                    ApplicationArea = All;

                }
                field("Annual rental income"; "Annual rental income")
                {
                    ApplicationArea = All;

                }
            }
            group("BuildingDetails")
            {
                Caption = 'Building Details';
                Visible = value2;
                field("Building Ownership"; "Building Ownership")
                {
                    ApplicationArea = All;
                }
                field(BuildingCategory; LandCategory)
                {
                    ApplicationArea = All;
                    Caption = 'Building Category';
                }

                field("Institution No."; "Institution No.")
                {
                    ApplicationArea = All;
                }
                field(Street; Street)
                {
                    ApplicationArea = All;
                }
                field("Type Of Building"; "Type Of Building")
                {
                    ApplicationArea = All;
                }
                field("Estimated Useful Life"; "Estimated Useful Life")
                {
                    ApplicationArea = All;
                }
                field("Number Of Floors"; "Number Of Floors")
                {
                    ApplicationArea = All;
                }
                field("Plinth Area"; "Plinth Area")
                {
                    ApplicationArea = All;
                }
                field("L.R /certifcate No.1"; "L.R /certifcate No.")
                {
                    ApplicationArea = All;
                }
                field("Size(Ha)1"; "Size(Ha)")
                {
                    ApplicationArea = All;
                }
                field("Ownership status1"; "Ownership status")
                {
                    ApplicationArea = All;
                }
                field("Mode of Acquisition1"; "Mode of Acquisition")
                {
                    ApplicationArea = All;
                }
                field(Use; "Purpose of Land")
                {
                    ApplicationArea = All;
                    Caption = 'Designated Use';
                }
                field("Cost of Construction/Valuation"; "Cost of Construction/Valuation")
                {
                    ApplicationArea = All;
                }

                field("Nearest Location"; "Nearest Location")
                {
                    ApplicationArea = All;
                    Caption = 'Nearest Town';
                }




            }

        }

    }
    actions
    {
        addlast(reporting)
        {
            action("generate Tag/QRCOde")
            {
                ApplicationArea = All;
                Caption = 'Asset Tag/Qr', comment = 'Asset Tag';
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                Image = Image;

                trigger OnAction()
                begin
                    Rec.Reset();
                    Rec.SetFilter(Rec."No.", Rec."No.");
                    Report.Run(52193425, true, true, Rec);

                end;
            }
            action("Transfer Asset")
            {
                ApplicationArea = All;
                Caption = 'Transfer/Move Asset';
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                Image = MoveToNextPeriod;
                trigger OnAction()
                var
                    HrTransfer: Record "HR Asset Transfer Header";
                    DocNo: Code[30];
                    fasetup: Record "FA Setup";
                    NoSeriesMgt: Codeunit NoSeriesManagement;
                    Transfer: Record "HR Asset Transfer Header";
                    TrasnferLines: Record "HR Asset Transfer Lines";
                begin
                    DocNo := '';
                    HrTransfer.Init();
                    fasetup.Get;
                    fasetup.TestField(fasetup."Asset Transfer Nos.");
                    DocNo := NoSeriesMgt.GetNextNo(fasetup."Asset Transfer Nos.", 0D, True);
                    HrTransfer."No." := DocNo;
                    HrTransfer."User ID" := UserId;
                    HrTransfer.Type := HrTransfer.Type::Issue;
                    HrTransfer."Document Type" := HrTransfer."Document Type"::"Asset Transfer";
                    HrTransfer."Document Date" := Today;
                    TrasnferLines.Init();
                    TrasnferLines."No." := DocNo;
                    TrasnferLines."Asset No." := rec."No.";
                    TrasnferLines.Validate(TrasnferLines."Asset No.");
                    TrasnferLines.Insert();
                    HrTransfer.Insert();
                    Commit();
                    Transfer.Reset();
                    Transfer.SetRange("No.", DocNo);
                    if Transfer.FindFirst() then
                        page.Run(Page::"HR Asset Issue Card", Transfer);
                end;
            }
            action("Return Asset")
            {
                ApplicationArea = All;
                Caption = 'Return Asset';
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                Image = Return;
                trigger OnAction()
                var
                    //"Asset Allocation Nos"
                    DocNo: Code[30];
                    fasetup: Record "FA Setup";
                    NoSeriesMgt: Codeunit NoSeriesManagement;
                    HrTransfer: Record "HR Asset Transfer Header";
                    Transfer: Record "HR Asset Transfer Header";
                    TrasnferLines: Record "HR Asset Transfer Lines";
                begin
                    DocNo := '';
                    HrTransfer.Init();
                    fasetup.Get;
                    fasetup.TestField(fasetup."Asset Allocation Nos");
                    DocNo := NoSeriesMgt.GetNextNo(fasetup."Asset Allocation Nos", 0D, True);
                    HrTransfer."No." := DocNo;
                    HrTransfer."User ID" := UserId;
                    HrTransfer.Type := HrTransfer.Type::Return;
                    HrTransfer."Document Type" := HrTransfer."Document Type"::Returning;
                    HrTransfer."Document Date" := Today;
                    TrasnferLines.Init();
                    TrasnferLines."No." := DocNo;
                    TrasnferLines."Asset No." := rec."No.";
                    TrasnferLines."Asset Code" := rec."No.";
                    TrasnferLines."Return No" := rec."No.";
                    TrasnferLines.Validate(TrasnferLines."Return No");
                    TrasnferLines.Validate(TrasnferLines."Asset Code");
                    TrasnferLines.Validate(TrasnferLines."Asset No.");
                    TrasnferLines.Insert();
                    HrTransfer.Insert();
                    Commit();
                    Transfer.Reset();
                    Transfer.SetRange("No.", DocNo);
                    if Transfer.FindFirst() then
                        page.Run(Page::"Asset Return card", Transfer);

                end;
            }

        }
    }
    var
        value1: Boolean;
        value2: Boolean;


    trigger OnOpenPage()
    var
        myInt: Integer;
    begin

        CalcFields(REC."Quantity Allocated2");
        CalcFields(REC."FA Q in Store");

    end;

    trigger OnAfterGetCurrRecord()
    var
        myInt: Integer;
    begin
        CalcFields(REC."Quantity Allocated2");
        CalcFields(REC."FA Q in Store");

    end;

    trigger OnAfterGetRecord()
    var
        myInt: Integer;
    begin
        CalcFields(REC."Quantity Allocated2");
        CalcFields(REC."FA Q in Store");

        value1 := rec.Type = rec.Type::Land;
        value2 := rec.Type = rec.Type::Building;

    end;

    procedure EditLand()
    begin

    end;
}
