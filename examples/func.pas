// Effectus auto-generated Mad Pascal source code listing
program funcPrg;

uses
  SySutils, Crt, Joystick;

// Effectus example
// -------------------------------------
// Using custom/local FUNCtion

function SumFunc(nn1 : word; nn2 : word) : word;
var
  res : word;
begin
  res := nn1+nn2;
  result := res;
end;
procedure MAINProc;
var
  n1 : word;
  n2 : word;
  n3 : word;
begin
  Write(Chr(125));
  Writeln('Effectus example:');
  Writeln('Using local functions (FUNC)');
  Writeln('');
  n1 := 30;
  n2 := 120;
  Writeln('Custom function Sum');
  Writeln('');
  Write('n1=30,n2=120,with sum of n3=');
  n3 := SUMFunc(N1,N2);
  Writeln(n3);
  n1 := 255;
  n3 := SUMFunc(N1,255);
  Write('n1=255 with 255 added is ');
  Writeln(n3);
  Writeln('');
  Writeln('Press trigger');
 WHILE Strig[0]=1 do begin
  end;
  Writeln('Trigger pressed');
  Writeln('Program finished!');
end;

begin
  MAINProc;
end.