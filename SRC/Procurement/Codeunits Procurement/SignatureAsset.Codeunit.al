// 
// Codeunit 52193426 "Signature Asset"
// {

//     trigger OnRun()
//     begin
//     end;

//     var
//         Item: Record "HR Asset Transfer Header";
//         Bytes: dotnet Array;
//         Convert: dotnet Convert;
//         MemoryStream: dotnet MemoryStream;
//         OStream: OutStream;
//         IStream: InStream;


//     procedure SetSignature(No: Code[50];Signature: BigText)
//     begin

//         Item.Get(No);

//         Bytes:=Convert.FromBase64String(Signature);
//         MemoryStream:=MemoryStream.MemoryStream(Bytes);
//         Item."User Signature".CreateOutstream(OStream);
//         MemoryStream.WriteTo(OStream);
//         Item."Date Signed":=CurrentDatetime;
//         Item.Modify;
//     end;


//     procedure GetSignature(No: Code[50];Signature: BigText)
//     begin

//         Item.Get(No);

//         Item.CalcFields("User Signature");
//         if not Item."User Signature".Hasvalue then
//         exit;

//         Item."User Signature".CreateInstream(IStream);
//         MemoryStream:=MemoryStream.MemoryStream();
//         CopyStream(MemoryStream,IStream);
//         Bytes:=MemoryStream.GetBuffer();
//         Signature.AddText(Convert.ToBase64String(Bytes));
//     end;
// }

