byte mode = 1;
byte count = 0;

active proctype m () {
endLoop:
    if
        :: mode = 1
        :: mode = 2
    fi;
    do
        :: mode == 1 && count < 30 -> count++
        :: mode == 2 -> count = 0; goto endLoop
        :: mode == 3 -> break
        :: else -> goto endLoop;
    od;
    count = 0
}

active proctype n() {
    do
        :: mode = 3
    od
}


// Count is never greater-or-equal than 30.
ltl prop1 {[] !(count >= 30)};


// Once count is greater than 0, it stays positive until mode exceeds 1
ltl prop2 {[](count>0 -> [](count >0 U mode > 1))}


// Count, once positive, will eventually reset to 0
ltl prop3 {[] count>0 -> [](count > 0 U count ==0)}


// Mode will eventually be set to 3
ltl prop4 { <> (mode == 3)}





/*
To start verifying these properties using Spin:
1. First, I ran spin -a 20429324_2.pml.
2. Then, compiled the generated pan.c using gcc -o pan pan.c to produce an executable.
3. Lastly, executed ./pan -N with the appropriate property number to check each LTL formula.

Results:
- Prop1: Fails when count reaches 30.
- Prop2: Fails due to not maintaining a positive count until mode changes.
- Prop3: Confirms true as count is reset to 0 before any mode transition to 2 or 3.
- Prop4: Confirms true, mode will eventually be set to 3 due to continuous assignment in the n proctype.

If weak fairness is no longer assumed:
- Prop1: Still Fails due to count being reset in every scenario.
- Prop2: Still Fails due to incomplete exploration, which causes missed scenarios where count is 0 without status change.
- Prop3: Starts Failing due to not all transitions leading to a scenario with a count reset.
- Prop4: Still Confirms since the proctype n definitively sets status to 3, a transition that does not rely on fairness to be executed.
*/