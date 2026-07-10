
query 50004 "HR Job Qualifications"
{
    OrderBy = ascending(Order);
    Caption = 'HR Job Qualifications';
    elements
    {
        dataitem(HR_Job_Qualifications; "HR Job Qualifications")
        {
            column(Qualification_Type; "Qualification Type") { }
            column("Code"; "Code") { }
            column(Description; Description) { }
            column(Category; Category) { }
            column("Order"; "Order") { }
            column(Professional; Professional) { }
        }
    }
}
