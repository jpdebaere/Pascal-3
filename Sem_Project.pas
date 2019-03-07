Program Calculus;
const eps = 0.001; //Giving accuracy its value of 0.001
var a,b,root_12,root_23,root_13,area:Real;//Roots initialization
type TF = function(x:Real):Real;//Functional Type 
{$F+}
function f1(x:Real):Real;
Begin
      f1 := 3 * ((0.5 /(x + 1)) + 1);
End;
function f2(x:Real):Real;
Begin
      f2 := 2.5 * x - 9.5;
End;
function f3(x:Real):Real;
Begin
      f3 := 5 / x;
End;
{$F-}
function Root(f, g:TF;a, b, eps:Real):Real;
//Function Root starts  
var c:Real;
begin
      repeat
            c := (a + (b - a) * abs((f(a) - g(a))) / (abs((f(b) - g(b))) + abs((f(a) - g(a)))));//According to the formula
            if (f(a) - g(a)) * (f(c) - g(c)) > 0 then a:=c else b := c;
      until abs((f(c) - g(c))) < eps;
      Root := c;
end;
Function Integral(f:TF; a, b, eps:Real):Real;
//Integral Function starts here
var n,i:Integer;
    h, prim_sum, sec_sum:Real;//Primary summation(sigma_1) and secondary summation(sigma_2)
begin
      n := 10;
      repeat 
            h := (b - a) / n;
            for i:=0 to (n - 1) do 
            begin
                 prim_sum := prim_sum + f(a + (0.5 + i) * h);// According to formula
            end;
            prim_sum := prim_sum * h;//1st Sigma
            n := n * 2;//According to the condition
            h := (b - a) / n;
            for i:=0 to (n - 1) do 
            begin
                  sec_sum := sec_sum + f(a + (0.5 + i) * h);// According to formula
            end;
            sec_sum := sec_sum * h;//Recalculating after doubling prim_sum
      until ( abs( sec_sum - prim_sum)) < eps;//Condition
      Integral := sec_sum;
end;
BEGIN
//Body begins here
      area := 0;//Initializing area
      root_12 := Root(f1,f2,1,6,eps);
      root_13 := Root(f1,f3,1,6,eps);
      root_23 := Root(f2,f3,1,6,eps);
      writeln('Intersection of f1 and f2: ',root_12);//Root_1
      writeln('Intersection of f1 and f3: ',root_13);//Root_2
      writeln('Intersection of f2 and f3: ',root_23);//Root_3
      area := Integral(f1,root_13,root_12,eps) - Integral(f2,root_23,root_12,eps) - Integral(f3,root_13,root_23,eps);//Area of the given region
      writeln('Area under the graph: ',area);
End.
            