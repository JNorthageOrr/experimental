# Homework - Working with NYC Open Data
![NYC-Open-Data](http://static1.squarespace.com/static/5459190fe4b0fcbe87d4af2d/t/54679172e4b0433015dce7d9/1416073588023/NYCOPENDATA.png?format=300w)

## Introduction
Back in 2012 Mayor Bloomberg signed the NYC Open Data Policy into law making a lot of the city's public records easily accessible to the public in a reasonable format. Regardless of whatever political affiliations you may have, as a developer you should be thrilled by this because it opens up some doors to do some real-life meaningful data manipulation, which is pretty damn cool.

## Setup
I have collected 3 CSV's (Comma Separated Values) containing **real** data that I've found on the [NYC Open Data](https://nycopendata.socrata.com/) website and stored them in a directory called `data_sets`. I have also provided three seed files called `toilet_seeds.sql`,`wifi_seeds.sql`,`farmers_market_seeds.sql`. `wifi_seeds.sql` is the only one with any content in it and I have laid out how to read in a database from a `CSV` file.

## Completion
Complete all. MAKE SURE YOU READ THE PROMPT.

## Assignment 
### Part 1 - Importing DB's from CSV's
- Look at the `wifi_seeds.sql` file and see the code I'm using to import the data. This file is 95% complete and only requires you to fix the path to the `CSV` file. This file path must be an **ABSOLUTE PATH**. While in the correct directoy you an type `pwd` in your terminal to find out what the correct absoute path is. 
- Using the `wifi_seeds.sql` file as your guide, complete the other two seed files.
- Add all of these to your databases now by doing the following in your terminal:
	- `createdb [whatever you want to call it]`
	- `psql -d [db's name] -f [seed file's name]`
	- If this was done correctly you will see something like: `COPY 1001`
	- IF YOU HAVE ANY ERRORS IMPORTING THE CSV'S LOOK UP YOUR ERRORS AND LEARN HOW TO WORK THROUGH THEM! YOU WILL BE BETTER FOR THIS! 

### Part 2 - Querying the databases
Create a markdown file called `db_queries.md`, this is where you will put all of the answers for this part. From the PSQL CLI (command line interface), come up with the correct SQL **queries** for the following requests and note the correct answers in your `db_queries.md` file:
	
	1. Find which wifi signal are of the type `free`.

	1. Find which wifi hotspots are located in Brooklyn.

	1. Find which wifi hotspots are in Brooklyn AND are free.

	1. Find which wifi hotspots are Outdoors in the Bronx.

	1. Find out HOW MANY hotspots are in Central Park (hint: may need to use a command you haven't seen before to see if an [entry contains some text](http://www.postgresql.org/docs/8.3/static/functions-matching.html)).

	1. Find out how many hotspots are run by Cablevision .

	1. Find all of the Farmer's Markets that are in Brooklyn.

	1. Find all of the Farmer's Markets that are open during the weekend.

	1. Find all of the Farmer's Markets that are open during the week.

	1. Find which farmer's market is across the street from an IKEA ( may be in the address column ;) ).

	1. Find which park bathroom toilets are handicap accessible.

	1. Find which park bathrooms are open year-round.

	1. Find How many parks contain the text 'Playground'
