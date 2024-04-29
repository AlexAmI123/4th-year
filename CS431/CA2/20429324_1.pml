byte x = 0;
bool b = false;

active proctype P () {
    do
        :: x < 20 -> x = 20; b = true;
        :: x >= 0 -> if
            :: x < 30 -> x++
            :: else -> x = 15
        fi
    od
}


// b will eventually be true
ltl prop1 { <> b };


// x will always be at least 15
ltl prop2 { [] (x >= 15) };


// At some point, x will be 15
ltl prop3 { <> (x == 15) };


// At some point, x will be 16
ltl prop4 { <> (x == 16) };


// From some point on, x will always be at least 16
ltl prop5 { <> [] (x >= 16) };


// x will be 16 infinitely often
ltl prop6 { [] <> (x == 16) };


// If b is never true, then x will infinitely often be 16
ltl prop7 { [] ((!b) -> <> (x == 16)) };





/*
To start verifying these properties using Spin:
1. First, I ran spin -a 20429324_1.pml.
2. Then, compiled the generated pan.c using gcc -o pan pan.c to produce an executable.
3. Lastly, executed ./pan -N with the appropriate property number to check each LTL formula.

Results:
- Prop1: Confirmed true as b becomes true when x reaches 20 initially.
- Prop2: Fails initially as x starts from 0.
- Prop3: Did not fail nor confirm, no errors were thrown. The statement should be valid due to when x >=30, x is set to 15.
- Prop4: Confirmed true because of above explanation as well as in some cases being incremented to 16 due to promela handling multiple true conditions.
- Prop5: Fails as x can be reset to 15.
- Prop6: Confirmed true for same explanation as Prop4 above.
- Prop7: Incorrectly reported as true due to the fact that x can be 15 or incremented to 16.
*/