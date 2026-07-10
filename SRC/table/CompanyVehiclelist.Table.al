// 
// table 52193761 "Company Vehicle list"
// {
//     Caption = 'Company Vehicle list';
//     DataClassification = CustomerContent;
//     fields
//     {
//         field(1; "Registration No"; Code[20])
//         {
//             Caption = 'Registration No';
//         }
//         field(2; "Date of travel"; Date)
//         {
//             Caption = 'Date of travel';
//         }
//         field(3; "Purpose of trip"; Text[200])
//         {
//             Caption = 'Purpose of trip';
//         }
//         field(4; Fuel; Text[30])
//         {
//             Caption = 'Fuel';
//         }
//         field(5; "Line No."; Integer)
//         {
//             AutoIncrement = true;
//             Caption = 'Line No.';
//         }
//     }

//     keys
//     {
//         key(Key1; "Registration No", "Line No.")
//         {
//             Clustered = true;
//         }
//     }

//     fieldgroups { }
// }
