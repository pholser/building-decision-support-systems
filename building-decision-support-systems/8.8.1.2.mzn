include "globals.mzn";

int: number_of_sites = 10;
set of int: SITE = 1..number_of_sites;
array[SITE, SITE] of int: dist =
  [|  0, 160,   160,  590, 340,  650,   725,   560,   350,  200
   |160,   0,   260,  680, 280,  650,   820,   715,   500,  150
   |150, 260,     0,  440, 260,  520,   620,   490,   280,  150
   |590, 680,   440,    0, 490,  240,   390,   435,   400,  550
   |340, 280,   260,  490,   0,  660,   800,   700,   510,  140
   |650, 650,   520,  240, 660,    0,   160,   250,   340,  670
   |725, 820,   620,  390, 800,  160,     0,   210,   380,  780
   |560, 715,   490,  435, 700,  250,   210,     0,   215,  650
   |350, 500,   280,  400, 510,  340,   380,   215,     0,  450
   |200, 150,   150,  550, 140,  670,   780,   650,   450,    0
   |];
int: max_dist = max([dist[i, j] | i in SITE, j in SITE]);

array[SITE, 1..2] of int: time_window =
  [|0, 2000
   |800, 1800
   |100, 600
   |200, 1500
   |0, 500
   |0, 2000
   |200, 1700,
   |100, 1200
   |600, 2500
   |300, 1700
   |];

array[1..6] of var SITE: a_route;
array[1..6] of var SITE: b_route;

constraint alldifferent([a_route[i] | i in 1..5]);
constraint a_route[1] = 1 /\ a_route[6] = 1;
constraint forall (s in a_route) (
  s >= 1 /\ s <= 5
);
constraint alldifferent([b_route[i] | i in 1..5]);
constraint b_route[1] = 6 /\ b_route[6] = 6;
constraint forall (s in b_route) (
  s >= 6 /\ s <= 10
);

array[1..5] of var 0..max_dist: a_route_time;
constraint forall (s in 1..5) (
  a_route_time[s] = dist[a_route[s], a_route[s + 1]]
);

array[1..5] of var 0..max_dist: b_route_time;
constraint forall (s in 1..5) (
  b_route_time[s] = dist[b_route[s], b_route[s + 1]]
);
var int: obj = max(sum(a_route_time), sum(b_route_time));
solve minimize obj;

output([
  show(a_route), "\n",
  show(b_route), "\n",
  show(a_route_time), "\n",
  show(b_route_time), "\n",
  show(obj)
]);
