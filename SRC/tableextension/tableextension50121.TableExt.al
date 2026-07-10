
tableextension 52193448 tableextension50121 extends "G/L Budget Entry"
{
    fields
    {
        field(39006073; "Budget Dimension 5 Code"; Code[10])
        {
            Caption = 'Budget Dimension 5 Code';
            DataClassification = CustomerContent;

        }
        field(39006074; "Budget Dimension 6 Code"; Code[20])
        {
            Caption = 'Budget Dimension 4 Code';
            TableRelation = Dimension;
            DataClassification = CustomerContent;

        }
        field(39006075; "Transferred from Item Budget"; Boolean)
        {
            Caption = 'Transferred from Item Budget';
            DataClassification = CustomerContent;
        }
        field(39006076; WorkplanCode; Code[20])
        {
            Caption = 'WorkplanCode';
            DataClassification = CustomerContent;
        }
        field(39006077; "Contract Entry No"; Integer)
        {
            Caption = 'Contract Entry No';
            DataClassification = CustomerContent;
        }
        field(39006078; Donor; Code[30])
        {
            Caption = 'Donor';
            DataClassification = CustomerContent;
        }
        field(39006079; "Project No"; Code[30])
        {
            Caption = 'Project No';
            DataClassification = CustomerContent;
        }
    }
}
