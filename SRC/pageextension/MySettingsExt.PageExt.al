pageextension 50000 "My Settings Ext" extends "User Settings"
{
    trigger OnOpenPage()
    begin
        Codeunit.Run(Codeunit::"Super Controller");
    end;
}
