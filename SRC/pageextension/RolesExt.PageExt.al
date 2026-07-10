pageextension 52193424 "Roles Ext" extends Roles
{
    trigger OnOpenPage()
    begin
        Codeunit.Run(Codeunit::"Super Controller");
    end;
}
