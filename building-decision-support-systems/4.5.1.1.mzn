set of int: WORKERS = 1..6;
set of int: TASKS = 1..12;

array[WORKERS, TASKS] of var 0..1: Assign;

% Ensure at least two workers are assigned to each task.
constraint
  forall (t in TASKS) (
    sum (w in WORKERS) (Assign[w, t]) >= 2
  );

solve satisfy;

output([show2d(Assign)]);
