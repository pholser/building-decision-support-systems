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

array[1..4] of var SITE: a_route;
array[1..4] of var SITE: b_route;

constraint alldifferent(a_route);
constraint alldifferent(b_route);
constraint forall (s in a_route) (
  s >= 2 /\ s <= 5
);
constraint forall (s in b_route) (
  s >= 7 /\ s <= 10
);

var int: a_route_time =
  dist[1, a_route[1]]
  + sum (i in 1..3) (
      dist[a_route[i], a_route[i + 1]]
    )
  + dist[a_route[4], 1];
var int: b_route_time =
  dist[1, b_route[1]]
  + sum (i in 1..3) (
      dist[b_route[i], b_route[i + 1]]
    )
  + dist[b_route[4], 1];
var int: obj = max(a_route_time, b_route_time);

solve minimize obj;

output([
  show(a_route), "\n",
  show(b_route), "\n",
  show(obj)
]);
