
report 52193439 Nonworkingdays
{
    ProcessingOnly = true;
    ApplicationArea = All;
    Caption = 'Nonworkingdays';
    dataset
    {
        dataitem(Date; Date)
        {
            DataItemTableView = where("Period Start" = filter(> '01/01/15'), "Period Start" = filter(< '01/01/16'));
            column(ReportForNavId_1000000000; 1000000000) { }
            column(Date; Date."Period Start") { }

            trigger OnAfterGetRecord()
            begin

                Day := 0;
                Day := Date2DWY(Date."Period Start", 1);
                if Day = 6 then begin
                    //MESSAGE('FOUND SATURDAY %1, %2, %3',
                    //DATE2DMY(Date."Period Start",1),DATE2DMY(Date."Period Start",2),DATE2DMY(Date."Period Start",3));

                    //Saturdays
                    BaseCalendarChange.Init();
                    BaseCalendarChange."Employee Code" := 'AMPATH';
                    ////BaseCalendarChange."Transaction Name 2" := Date."Period Start";
                    /////BaseCalendarChange.Balance := 'Weekend';
                    ///BaseCalendarChange."Original Amount" := TRUE;
                    BaseCalendarChange.Amount := Date."Period No.";
                    BaseCalendarChange.Insert();

                end else
                    if Day = 7 then begin
                        //MESSAGE('FOUND Sunday %1, %2, %3',
                        //DATE2DMY(Date."Period Start",1),DATE2DMY(Date."Period Start",2),DATE2DMY(Date."Period Start",3));

                        //Sundays
                        BaseCalendarChange.Init();
                        BaseCalendarChange."Employee Code" := 'AMPATH';
                        ////BaseCalendarChange."Transaction Name 2" := Date."Period Start";
                        ////BaseCalendarChange.Balance := 'Weekend';
                        ////BaseCalendarChange."Original Amount" := TRUE;
                        /////BaseCalendarChange.Amount := Date."Period No.";
                        BaseCalendarChange.Insert();


                    end; //ELSE BEGIN
                         // MESSAGE('Working Day');
                         //END;
            end;

            trigger OnPostDataItem()
            begin
                Message('Weekends Posted Successfully');
            end;

            trigger OnPreDataItem()
            begin
                Date.SetRange(Date."Period Start", 20150101D, 20160101D);
            end;
        }
    }

    requestpage
    {

        layout { }

        actions { }
    }

    labels { }

    var
        BaseCalendarChange: Record "prEmployee Salary Ledger";
        Day: Integer;
}

