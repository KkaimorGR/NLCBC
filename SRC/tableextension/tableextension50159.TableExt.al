
tableextension 52193486 tableextension50159 extends "Confidential Information"
{
    fields
    {
        modify("Employee No.")
        {
            TableRelation = "HR Employees"."No.";
        }
    }
}
