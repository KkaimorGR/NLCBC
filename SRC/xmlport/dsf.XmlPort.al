
xmlport 50014 dsf
{
    Format = VariableText;
    Caption = 'dsf';
    schema
    {
        textelement(test)
        {
            tableelement("Gen. Journal Template"; "Gen. Journal Template")
            {
                XmlName = 'genjou';
                fieldelement(sdf; "Gen. Journal Template".Name) { }
                fieldelement(ds; "Gen. Journal Template".Description) { }
                fieldelement(dsfds; "Gen. Journal Template"."Test Report ID") { }
                fieldelement(sdfsd; "Gen. Journal Template"."Page ID") { }
                fieldelement(sdf; "Gen. Journal Template"."Posting Report ID") { }
                fieldelement(sdfs; "Gen. Journal Template"."Force Posting Report") { }
                fieldelement(dfsd; "Gen. Journal Template".Type) { }
                fieldelement(fdsfsdf; "Gen. Journal Template"."Source Code") { }
                fieldelement(dsfdsfsd; "Gen. Journal Template"."Reason Code") { }
                fieldelement(xhn; "Gen. Journal Template".Recurring) { }
                fieldelement(xg; "Gen. Journal Template"."Test Report Caption") { }
                fieldelement(sv; "Gen. Journal Template"."Page Caption") { }
                fieldelement(dc; "Gen. Journal Template"."Posting Report Caption") { }
                fieldelement(hy; "Gen. Journal Template"."Force Doc. Balance") { }
                fieldelement(gt; "Gen. Journal Template"."Bal. Account Type") { }
            }
        }
    }

    requestpage
    {

        layout { }

        actions { }
    }
}
