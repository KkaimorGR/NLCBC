
query 50005 "HR Lookup Values"
{
    Caption = 'HR Lookup Values';
    elements
    {
        dataitem(HR_Lookup_Values; "HR Lookup Values")
        {
            column(Type; Type) { }
            column("Code"; "Code") { }
            column(Description; Description) { }
            column(Previous_Job_Position; "Previous Job Position") { }
            column(Level; Level) { }
        }
    }
}
