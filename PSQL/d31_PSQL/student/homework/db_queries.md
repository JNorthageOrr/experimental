### db_queries

1. Find which wifi signal are of the type `free`.
select * from wifi WHERE Type = 'Free'

1. Find which wifi hotspots are located in Brooklyn.
select * from wifi WHERE Boro = 'BK'

1. Find which wifi hotspots are in Brooklyn AND are free.
select * from wifi WHERE Boro = 'BK' AND Type = 'Free'

1. Find which wifi hotspots are Outdoors in the Bronx.
select * from wifi WHERE Boro = 'BX' AND Location_T = 'Outdoor'

1. Find out HOW MANY hotspots are in Central Park (hint: may need to use a command you haven't seen before to see if an [entry contains some text](http://www.postgresql.org/docs/8.3/static/functions-matching.html)).
select count(*) from wifi WHERE Name = 'Central Park';
(4)

1. Find out how many hotspots are run by Cablevision .
234

1. Find all of the Farmer's Markets that are in Brooklyn.
select * from market WHERE Borough = 'Brooklyn'

1. Find all of the Farmer's Markets that are open during the weekend.
select * from market WHERE Days = 'Saturday' OR Days = 'Sunday';

1. Find all of the Farmer's Markets that are open during the week.
select * from market WHERE Days = 'Monday' OR Days = 'Tuesday' OR Days = 'Wednesday' OR Days = 'Thursday' OR Days = 'Friday';

1. Find which farmer's market is across the street from an IKEA ( may be in the address column ;) ).
select * from market WHERE StreetAddress LIKE '%IKEA%';

1. Find which park bathroom toilets are handicap accessible.
select * from toilets WHERE HandicapAccessible = 'Yes';

1. Find which park bathrooms are open year-round.
select * from toilets WHERE OpenYearRound = 'Yes';

1. Find How many parks contain the text 'Playground'
select * from toilets WHERE Name LIKE '%Playground%';
