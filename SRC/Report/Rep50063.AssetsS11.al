 
// report 52193492 "Assets S11"
// {
//     ApplicationArea = All;
//     Caption = 'Receipt Assets Voucher S11';
//     UsageCategory = ReportsAndAnalysis;
//     DefaultLayout = RDLC;
//     RDLCLayout = './Layouts/VoucherAssetsS11Report.rdlc';

//     dataset
//     {

//         dataitem(StoreRequistionHeaders; "HR Asset Transfer Header")
//         {
//             RequestFilterFields = "No.";
       
//             column(Allocated; Allocated)
//             {
//             }
//             column(ApprovalStatus; "Approval Status")
//             {
//             }
//             column(Approved;"Approved By")
//             {
//             }
            
//             column(DateSigned; "Date Signed")
//             {
//             }
     
  
//             column(DocumentType; "Document Type")
//             {
//             }
//             column(EmployeeCode; StoreRequistionHeaders."Staff No.")
//             {
//             }
//             column(EmployeeName; StoreRequistionHeaders."Staff Name")
//             {
//             }
            
//                        column(GlobalDimension1Code; "Global Dimension 1 Code")
//             {
//             }
             
//             column(No; "No.")
//             {
//             }
            
//             column(NoSeries; "No. Series")
//             {
//             }
            
//              column(Received; Received)
//             {
//             }
//             column(ReceivedBy; "Received By")
//             {
//             }
//             column(ReceivedDate; "Received Date")
//             {
//             }
//             column(Rejected; Rejected)
//             {
//             }
//             column(RejectedBy; "Rejected By")
//             {
//             }
//             column(RejectedDate; "Rejected Date")
//             {
//             }
            
 
//             column(ResponsibilityCenter; "Responsibility Center")
//             {
//             }
            
//             column(Status; Status)
//             {
//             }
           
//             column(SystemCreatedAt; SystemCreatedAt)
//             {
//             }
//             column(SystemCreatedBy; SystemCreatedBy)
//             {
//             }
//             column(SystemId; SystemId)
//             {
//             }
//             column(SystemModifiedAt; SystemModifiedAt)
//             {
//             }
//             column(SystemModifiedBy; SystemModifiedBy)
//             {
//             }
         
//             column(UserID; "User ID")
//             {
//             }
//             column(UserSignature; "User Signature")
//             {
//             }
           
//             column(Picture; CI.Picture) { }
//             column(Name; CI.Name)
//             {

//             }
//             column(Address; CI.Address)
//             {

//             }
//             column(Adress2; CI."Address 2")
//             {

//             }
            
 
//             column(Global_Dimension_1_Code; "Global Dimension 1 Code")
//             {

//             }
//             column(Approver; Approver)
//             {

//             }
//             column(ApprovalDate; ApprovalDate)
//             {

//             }
            
           

//             dataitem("Store Requistion Line"; "HR Asset Transfer Lines")
//             {
//                 DataItemLink ="No." = field("No.");
//                 DataItemLinkReference = StoreRequistionHeaders;
               
               
                 
          
//                 column(No_; "No.")
//                 {

//                 }
        
              

              
//                 column(Card_No_; "Card No.")
//                 {

//                 }
               
              
                






//             }
//             trigger OnAfterGetRecord()

//             begin
//                 AP.Reset();
//                 AP.SetRange("Document No.", "No.");
//                 AP.SetFilter(Status, '=%1', AP.Status::Approved);
//                 IF AP.Find('-') then begin
//                     Approver := AP."Approver ID";
//                     ApprovalDate := AP."Last Date-Time Modified";
//                 end;

//             end;
//         }
//     }
//     requestpage
//     {
//         layout
//         {
//             area(Content)
//             {
//                 group(GroupName)
//                 {
//                 }
//             }
//         }
//         actions
//         {
//             area(Processing)
//             {
//             }
//         }
//     }
//     trigger OnPreReport()
//     begin
//         CI.Get();
//         CI.CalcFields(Picture);
//     end;

//     var
//         CI: Record "Company Information";
//         HRAppraisalHeader: Record "HR Appraisal Header";
//         AP: Record "Approval Entry";
//         Approver: code[100];
//         ApprovalDate: DateTime;
// }
