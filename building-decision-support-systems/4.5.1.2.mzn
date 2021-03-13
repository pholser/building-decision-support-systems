set of int: WORKERS = 1..6;
set of int: TASKS = 1..12;

array[WORKERS, TASKS] of var 0..1: Assign;

% At least two workers are assigned to each task.
constraint
  forall (t in TASKS) (
    sum (w in WORKERS) (Assign[w, t]) >= 2
  );

% No worker is assigned to more than five tasks.
constraint
  forall (w in WORKERS) (
    sum (t in TASKS) (Assign[w, t]) <= 5
  );

solve satisfy;

output([show2d(Assign)]);
