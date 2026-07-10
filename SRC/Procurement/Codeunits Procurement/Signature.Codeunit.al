// 
// Codeunit 52193428 Signature
// {

//     trigger OnRun()
//     begin
//     end;

//     var
//         Item: Record "User Setup";
//         OStream: OutStream;
//         IStream: InStream;


//     procedure SetSignature(No: Code[100]; Signature: BigText)
//     begin
//         Item.Get(No);

//         Bytes := Convert.FromBase64String(Signature);
//         MemoryStream := MemoryStream.MemoryStream(Bytes);
//         Item."User Signature".CreateOutstream(OStream);
//         MemoryStream.WriteTo(OStream);
//         Item.Modify;
//     end;


//     procedure GetSignature(No: Code[100]; Signature: BigText)
//     begin
//         Item.Get(No);

//         Item.CalcFields("User Signature");
//         if not Item."User Signature".Hasvalue then
//             exit;

//         Item."User Signature".CreateInstream(IStream);
//         MemoryStream := MemoryStream.MemoryStream();
//         CopyStream(MemoryStream, IStream);
//         Bytes := MemoryStream.GetBuffer();
//         Signature.AddText(Convert.ToBase64String(Bytes));
//     end;
// }

