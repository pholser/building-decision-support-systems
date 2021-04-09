int: tour_guide_cost = 10000;

enum locations;
array[locations, locations] of int: travel_cost;

int: tour_ct;
set of int: all_tours = 1..tour_ct;

array[all_tours] of int: tour_start;
array[all_tours] of int: tour_dur;
array[all_tours] of locations: tour_start_loc;
array[all_tours] of locations: tour_end_loc;

