
query 50003 "Country_Region"
{
    Caption = 'Country_Region';
    elements
    {
        dataitem(Country_Region; "Country/Region")
        {
            column("Code"; "Code") { }
            column(Name; Name) { }
        }
    }
}
