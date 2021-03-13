enum ITEMS = {
  book, jacket, washbag, computer, boots, alarmclock, anorak, food
};
array[ITEMS] of int: weight = [2, 4, 3, 8, 7, 1, 2, 6];
array[ITEMS] of int: volume = [250, 500, 300, 250, 650, 130, 150, 600];
array[ITEMS] of int: value = [6, 10, 8, 25, 22, 4, 5, 20];
array[ITEMS, ITEMS] of int: extra_value =
  [|0, 0, 0, -5, 0, 0, 0, 0
   |0, 0, 0, 0, 3, 0, -2, 0
   |0, 0, 0, 0, 0, 0, 0, 0
   |-5, 0, 0, 0, 0, -2, 0, 0
   |0, 3, 0, 0, 0, 0, 0, 0
   |0, 0, 0, -2, 0, 0, 0, 0
   |0, -2, 0, 0, 0, 0, 0, 0
   |0, 0, 0, 0, 0, 0, 0, 0
   |];
int: weight_limit = 20;
int: volume_limit = 2000;

array[ITEMS] of var 0..1: carry;

% Chosen items have to respect weight limit of the knapsack
constraint
  sum (i in ITEMS) (carry[i] * weight[i]) <= weight_limit;

% Chosen items have to fit in the knapsack
constraint
  sum (i in ITEMS) (carry[i] * volume[i]) <= volume_limit;

% Get as much value as possible from chosen items
var int: obj =
  sum (i in ITEMS) (carry[i] * value[i])
  +
  sum (i1 in ITEMS, i2 in ITEMS where i1 < i2) (
    (carry[i1] * carry[i2]) * extra_value[i1, i2]
  );

solve maximize obj;

output([show(carry), "\n", "value = \(obj)\n"]);
