
codeunit 52193500 "Workplan Indent"
{

    trigger OnRun()
    begin

        if not
           Confirm(
             Text000 +
             Text001 +
             Text002 +
             Text003, true)
        then
            exit;

        Indent();
    end;

    var
        // GLAcc: Record "Workplan Activities";
        Window: Dialog;
        AccNo: array[10] of Code[20];
        i: Integer;
        Text000: Label 'This function updates the indentation of all the Workplan Items in the Workplan card. ';
        Text001: Label 'All accounts between a Begin-Total and the matching End-Total are indented one level. ';
        Text002: Label 'The Totaling for each End-total is also updated.';
        Text003: Label '\\Do you want to indent the Workplan List?';
        Text004: Label 'Indenting the Workplan#1##########';
        Text005: Label 'End-Total %1 is missing a matching Begin-Total.';


    procedure Indent()
    begin
        Window.Open(Text004);


    end;
}
