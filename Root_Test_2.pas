Program Root_Test;
const eps = 0.001;
var intersection:Real;
Type TF = Function(x:Real):Real;
{$F+}
Function f1(x:Real):Real;
Begin
      f1:= (7 * x * x * x);
End;
Function f2(x:Real):Real;
Begin
      f2:= cos(x);
End;
function Root(f, g:TF;a, b, eps:Real):Real;
//Function Root starts here
var c:Real;
begin
      repeat
            c := (a + (b - a) * abs((f(a) - g(a))) / (abs((f(b) - g(b))) + abs((f(a) - g(a)))));//According to the formula
            if (f(a) - g(a)) * (f(c) - g(c)) > 0 then a:=c else b := c;
      until abs((f(c) - g(c))) < eps;
      Root := c;
end;
Begin
      intersection := Root(f1,f2,-5,5,eps);
      writeln(intersection);
End.