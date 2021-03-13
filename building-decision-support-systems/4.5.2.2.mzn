enum ITEMS = {
  book, jacket, washbag, computer, boots, alarmclock, anorak, food
};
array[ITEMS] of int: weight = [2, 4, 3, 8, 7, 1, 2, 6];
array[ITEMS] of int: volume = [250, 500, 300, 250, 650, 130, 150, 600];
array[ITEMS] of int: value = [6, 10, 8, 25, 22, 4, 5, 20];
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
  sum (i in ITEMS) (carry[i] * value[i]);

solve maximize obj;

output([show(carry), "\n", "value = \(obj)\n"]);
