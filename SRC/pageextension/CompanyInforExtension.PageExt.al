
pageextension 52193428 CompanyInforExtension extends "Company Information"
{
    layout
    {
        addafter("Industrial Classification")
        {
            field("PIN No"; Rec."PIN No")
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the PIN No field.';
            }
            field("NSSF Number"; Rec."NSSF Number")
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the NSSF Number field.';
            }
            field("NHIF Number"; Rec."NHIF Number")
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the NHIF Number field.';
            }
        }
        addafter(Picture)
        {
            field("Kenyan Shield"; "Kenyan Shield")
            {
                ApplicationArea = all;
                ToolTip = 'Specifies  the kenyan shield';
            }
            field("Company Watermark"; Rec."Company Watermark")
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the Company Watermark field.';
            }
            field("Documents Attachment Link"; Rec."Documents Attachment Link")
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the Documents Attachment Link field.';
            }

        }
        addafter("Home Page")
        {
            field("NLC Website"; "NLC Website")
            {
                ApplicationArea = all;
                ToolTip = 'Specifies the company website';
            }
        }
    }
}
