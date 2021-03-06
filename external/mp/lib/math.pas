unit math;
(*
 @type: unit
 @author: Tomasz Biela (Tebe)
 @name: Additional mathematical routines

 @version: 1.0

 @description:
 <http://www.freepascal.org/docs-html/rtl/math/index-5.html>
*)


{

ArcCos
ArcSin
ArcTan2
Ceil
CycleToRad
DegNormalize
DegToGrad
DegToRad
DivMod
EnsureRange
Floor
FMod
GradToDeg
GradToRad
InRange
IsNan
Log2
Log10
LogN
Max
Min
Power
RadToCycle
RadToDeg
RadToGrad
RandG		Return gaussian distributed random number
RandomRange
RandomRangeF
Sign
Tan

}

interface

	function DegNormalize(deg : real) : real;
	function degtorad(deg : real) : real;
	function radtodeg(rad : real) : real;
	function gradtorad(grad : real) : real;
	function radtograd(rad : real) : real;
	function degtograd(deg : real) : real;
	function gradtodeg(grad : real) : real;
	function cycletorad(cycle : real) : real;
	function radtocycle(rad : real) : real;
	procedure DivMod(Dividend: integer; Divisor: Word; var r, Remainder: Word); overload;
	procedure DivMod(Dividend: integer; Divisor: Word; var r, Remainder: smallint); overload;
	function InRange(const AValue, AMin, AMax: byte): Boolean; overload;
	function InRange(const AValue, AMin, AMax: Integer): Boolean; overload;
	function EnsureRange(const AValue, AMin, AMax: byte): Integer; overload;
	function EnsureRange(const AValue, AMin, AMax: Integer): Integer; overload;
	function Min(x, y: real): real; overload;
	function Min(x, y: shortreal): shortreal; overload;
	function Min(x, y: single): single; overload;	
	function Min(x, y: integer): integer; overload;
	function Max(x, y: real): real; overload;
	function Max(x, y: shortreal): shortreal; overload;
	function Max(x, y: single): single; overload;	
	function Max(x, y: integer): integer; overload;
	function power(base : real; const exponent : shortint) : real; overload;
	function power(base : single; const exponent : shortint) : single; overload;
	function power(base : integer; const exponent : shortint) : integer; overload;
	function arctan2(y,x : real) : real;
	function ArcSin(x: real): real;
	function ArcCos(x: real): real;
	function Tan(x: Real): Real;
	function Ceil(a: real): smallint;
	function Floor(a: real): smallint;
	function FMod(a, b: real): real;
	function log10(x : single): single;
	function log2(x : single): single;
	function logN(n,x : single): single;
	function IsNan(const d : Single): Boolean;
	function RandomRange(const aFrom, aTo: smallint): smallint;
	function RandomRangeF(const min, max: single): single;
	function RandG(mean, stddev : single) : single;
	function Sign(const AValue: Integer): shortint; overload;
	function Sign(const AValue: Real): Real; overload;
	function Sign(const AValue: Single): Single; overload;


implementation


function DegNormalize(deg : real) : real;
(*
@description:

*)
begin
  Result:=Deg-real(Trunc(Deg/360.0))*360.0;
  If Result<0.0 then Result:=Result+360.0;
end;


function degtorad(deg : real) : real;
(*
@description:

*)
  begin
     Result:=deg*(pi/180.0);
  end;

function radtodeg(rad : real) : real;
(*
@description:

*)
  begin
     Result:=rad*(180.0/pi);
  end;

function gradtorad(grad : real) : real;
(*
@description:

*)
  begin
     Result:=grad*(pi/200.0);
  end;

function radtograd(rad : real) : real;
(*
@description:

*)
  begin
     Result:=rad*(200.0/pi);
  end;

function degtograd(deg : real) : real;
(*
@description:

*)
  begin
     Result:=deg*(200.0/180.0);
  end;

function gradtodeg(grad : real) : real;
(*
@description:

*)
  begin
     Result:=grad*(180.0/200.0);
  end;

function cycletorad(cycle : real) : real;
(*
@description:

*)
  begin
     Result:=M_PI_2*cycle;
  end;

function radtocycle(rad : real) : real;
(*
@description:

*)
  begin
     { avoid division }
     Result:=rad*(1.0/M_PI_2);
  end;


procedure DivMod(Dividend: integer; Divisor: Word; var r, Remainder: Word); overload;
(*
@description:

*)
begin
  if Dividend < 0 then
    begin
      { Use DivMod with >=0 dividend }
	  Dividend:=-Dividend;
      { The documented behavior of Pascal's div/mod operators and DivMod
        on negative dividends is to return Result closer to zero and
        a negative Remainder. Which means that we can just negate both
        Result and Remainder, and all it's Ok. }
      r:=-(Dividend Div Divisor);
      Remainder:=-(Dividend+(r*Divisor));
    end
  else
    begin
      r:=Dividend Div Divisor;
      Remainder:=Dividend-(r*Divisor);
    end;
end;


procedure DivMod(Dividend: integer; Divisor: Word; var r, Remainder: smallint); overload;
(*
@description:

*)
begin
  if Dividend < 0 then
    begin
      { Use DivMod with >=0 dividend }
	  Dividend:=-Dividend;
      { The documented behavior of Pascal's div/mod operators and DivMod
        on negative dividends is to return Result closer to zero and
        a negative Remainder. Which means that we can just negate both
        Result and Remainder, and all it's Ok. }
      r:=-(Dividend Div Divisor);
      Remainder:=-(Dividend+(r*Divisor));
    end
  else
    begin
      r:=Dividend Div Divisor;
      Remainder:=Dividend-(r*Divisor);
    end;
end;


function InRange(const AValue, AMin, AMax: byte): Boolean; overload;
(*
@description:
Check whether value is in range

*)
begin
  Result:=(AValue>=AMin) and (AValue<=AMax);
end;


function InRange(const AValue, AMin, AMax: Integer): Boolean; overload;
(*
@description:

*)
begin
  Result:=(AValue>=AMin) and (AValue<=AMax);
end;


function EnsureRange(const AValue, AMin, AMax: byte): Integer; overload;
(*
@description:
Change value to it falls in specified range

*)
begin
  Result:=AValue;
  If Result<AMin then
    Result:=AMin
  else if Result>AMax then
    Result:=AMax;
end;


function EnsureRange(const AValue, AMin, AMax: Integer): Integer; overload;
(*
@description:

*)
begin
  Result:=AValue;
  If Result<AMin then
    Result:=AMin
  else if Result>AMax then
    Result:=AMax;
end;


function Min(x, y: real): real; overload;
(*
@description:
Return smallest of two values

*)
begin
if x < y then Result := x else Result := y;
end;


function Min(x, y: shortreal): shortreal; overload;
(*
@description:
Return smallest of two values

*)
begin
if x < y then Result := x else Result := y;
end;


function Min(x, y: single): single; overload;
(*
@description:
Return smallest of two values

*)
begin
if x < y then Result := x else Result := y;
end;


function Min(x, y: integer): integer; overload;
(*
@description:

*)
begin
if x < y then Result := x else Result := y;
end;


function Max(x, y: real): real; overload;
(*
@description:
Return largest of two values

*)
begin
if x > y then Result := x else Result := y;
end;


function Max(x, y: shortreal): shortreal; overload;
(*
@description:
Return largest of two values

*)
begin
if x > y then Result := x else Result := y;
end;


function Max(x, y: single): single; overload;
(*
@description:
Return largest of two values

*)
begin
if x > y then Result := x else Result := y;
end;


function Max(x, y: integer): integer; overload;
(*
@description:

*)
begin
if x > y then Result := x else Result := y;
end;


function RandomRange(const aFrom, aTo: smallint): smallint;
(*
@description:

*)
var a: smallint;
begin
  a := Abs(aFrom-aTo);
  Result:=Random(a)+Min(aTo,AFrom);
end;


function RandomRangeF(const min, max: single): single;
(*
@description:

*)
var
  fl : ^single;
  c: cardinal;
begin
  fl := @c;

  c:=cardinal(random) shl 16;
  c:=c or $3f000000;

  result := min + fl^* (max-min);
end;


function RandG(mean, stddev : single) : single;
(*
@description:
Return gaussian distributed random number

*)
  Var U1,S2 : single;
  begin
     repeat
       u1:= 2*RandomF-1;
       S2:=Sqr(U1)+sqr(single(2)*RandomF-single(1));
     until s2 < single(1);

     Result:=Sqrt(single(-2)*ln(S2)/S2)*u1*stddev+Mean;
  end;


function power(base : real; const exponent : shortint) : real; overload;
(*
@description:
Return real power

<https://github.com/graemeg/freepascal/blob/master/rtl/objpas/math.pp>

*)
  var
     i : integer;
  begin
     if (base = 0.0) and (exponent = 0) then
       result:=1.0
     else
       begin
         i:=abs(exponent);
         Result:=1.0;
         while i>0 do
           begin
              while (i and 1)=0 do
                begin
                   i:=i shr 1;
                   base:=sqr(base);
                end;
              i:=i-1;
              Result:=Result*base;
           end;
         if exponent<0 then
           Result:=1.0/Result;
       end;
  end;


function power(base : single; const exponent : shortint) : single; overload;
(*
@description:
Return real power

<https://github.com/graemeg/freepascal/blob/master/rtl/objpas/math.pp>

*)
  var
     i : integer;
  begin
     if (base = single(0)) and (exponent = 0) then
       result:=1.0
     else
       begin
         i:=abs(exponent);
         Result:=1.0;
         while i>0 do
           begin
              while (i and 1)=0 do
                begin
                   i:=i shr 1;
                   base:=sqr(base);
                end;
              i:=i-1;
              Result:=Result*base;
           end;
         if exponent<0 then
           Result:=1.0/Result;
       end;
  end;


function power(base : integer; const exponent : shortint) : integer; overload;
(*
@description:
Return real power

<https://github.com/graemeg/freepascal/blob/master/rtl/objpas/math.pp>

*)
  var
     i : integer;
  begin
     if (base = 0) and (exponent = 0) then
       result:=1
     else
       begin
         i:=abs(exponent);
         Result:=1;
         while i>0 do
           begin
              while (i and 1)=0 do
                begin
                   i:=i shr 1;
                   base:=sqr(base);
                end;
              i:=i-1;
              Result:=Result*base;
           end;
         if exponent<0 then
           Result:=0;
       end;
  end;


function arctan2(y,x : real) : real;
(*
@description:

*)
  begin
    if (x=0.0) then
      begin
        if y=0.0 then
          Result:=0.0
        else if y>0.0 then
          Result:=D_PI_2
        else if y<0.0 then
          Result:=-D_PI_2;
      end
    else
      Result:=ArcTan(y/x);
    if x<0.0 then
      Result:=Result+pi;
    if Result>pi then
      Result:=Result-M_PI_2;
  end;


function ArcSin(x: real): real;
(*
@description:

*)
const
 a0 = D_PI_2;
 a1 = -0.212;
 a2 = 0.074;
 a3 = -0.019;

begin

 if (x>=-1.0) and (x<=1.0) then
  Result:= a0 - sqrt(1.0 - x)*(a0 + a1*x + a2*x*x + a3*x*x*x);

end;


function ArcCos(x: real): real;
(*
@description:

*)
begin

 if (x>=-1.0) and (x<=1.0) then
  Result:= D_PI_2 - ArcSin(x);

end;


function Tan(x: Real): Real;
(*
@description:

*)
begin

 Result := sin(x) / cos(x);

end;


function Ceil(a: real): smallint;
(*
@description:

*)
begin

 Result := trunc(a - 32768.) + 32768;

end;


function Floor(a: real): smallint;
(*
@description:

*)
begin

 Result := trunc(a + 32768.) - 32768;

end;


function FMod(a, b: real): real;
(*
@description:

*)
begin

 Result := (a - b * Real(floor(a / b)));

end;


function Log10(x: single): single;
(*
@description:

*)
begin
 Result := ln(x)*0.43429448190325182765;
end;


function log2(x : single) : single;
(*
@description:

*)
begin
 Result := ln(x)*1.4426950408889634079;    { 1/ln(2) }
end;


function logn(n,x : single) : single;
(*
@description:

*)
begin
 Result := ln(x) / ln(n);
end;


function IsNan(const d : Single): Boolean;
(*
@description:

*)
begin
 Result := (cardinal(d) and $7fffffff) > $7f800000;
end;


function Sign(const AValue: Integer): shortint; overload;
(*
@description:

*)
begin

 if AValue < 0 then
  Result := -1
 else
  Result := 1;

end;


function Sign(const AValue: Real): Real; overload;
(*
@description:

*)
begin

 if AValue < 0.0 then
  Result := -1.0
 else
  Result := 1.0;

end;


function Sign(const AValue: Single): Single; overload;
(*
@description:

*)
begin

 if AValue < 0 then
  Result := -1
 else
  Result := 1;

end;

end.

