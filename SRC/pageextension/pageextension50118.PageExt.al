
pageextension 52193445 pageextension50118 extends "Job List"
{
    actions
    {

        //Unsupported feature: Code Modification on ""Dimensions-&Multiple"(Action 12).OnAction".

        //trigger OnAction()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
        /*
        CurrPage.SETSELECTIONFILTER(Job);
        DefaultDimMultiple.SetMultiJob(Job);
        DefaultDimMultiple.RUNMODAL;
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        CurrPage.SETSELECTIONFILTER(Job);
        ///DefaultDimMultiple.SetMultiJob(Job);
        ///DefaultDimMultiple.RUNMODAL;
        */
        //end;
    }
}
