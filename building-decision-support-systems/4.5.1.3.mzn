int: num_workers = 6;
set of int: WORKERS = 1..num_workers;
int: num_tasks = 12;
set of int: TASKS = 1..num_tasks;
array[WORKERS, WORKERS] of 0..1: bad_pair =
  [|0, 1, 0, 1, 0, 0
   |1, 0, 0, 0, 1, 0
   |1, 0, 0, 1, 0, 0
   |0, 0, 1, 0, 1, 0
   |0, 0, 1, 0, 0, 0
   |0, 0, 0, 1, 0, 0
   |];
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

% No bad pairs of workers assigned to a task.
constraint
  forall (w1 in WORKERS, w2 in (w1+1)..num_workers, t in TASKS) (
    bad_pair[w1, w2] * (Assign[w1, t] + Assign[w2, t]) < 2
  );
  
solve satisfy;

output([show2d(Assign)]);
