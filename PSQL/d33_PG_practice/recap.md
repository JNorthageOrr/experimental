# D33 SQL Recap

Today we covered how data modeling is used to architect table schema, and how to select data across related tables.

SQL is a relational database system, which means that tables can be linked to each other. How these tables are linked depends on how you model the "domains" of your particular data.

We looked at two examples of different data models, with the Hogwarts students/house relationship, and the actors/movies relationships. We modeled each domain using entity relationship diagrams(ERDs).

# Hogwarts - One to Many Relationships

In the first part our model showed us that students and houses share a one-to-many relationship. With all students in Hogwarts belonging to a house, and houses having many students. This means that students need an extra column in their table containing a foreign key that points to the houses table.

Entities that "belong to" another entity house the foreign key in their schema. If we did it the other way around, with houses having keys pointing to students, we'd have duplicate entries in the houses table for each student, which is inefficient.

Foreign keys came with some conditions we had to satisfy:

1. If one table has a foreign key that relies on a column(s) of another table, that other table has to be defined first.
2. If a table is relied on by any other tables, you cannot delete it. PSQL protects you from doing so, as it is a dangerous action, but you can use the `CASCADE` keyword to force the drop to occur.

Not only does the foreign key link two tables, but it also enforces referential integrity, meaning invalid/junk data can't ever be saved(barring you not having good constraints in place). Students can't be saved into a house that doesn't exist.

## Getting Our Relational Data Using [Join Queries](http://www.codeproject.com/Articles/33052/Visual-Representation-of-SQL-Joins)

The query we most commonly use in web development is the `INNER JOIN` query, which gives us a set of data aligned `ON` some condition that both tables share.

To access the data from the `students` and `houses` tables, we wrote our first join query:

```SQL
SELECT * FROM students
JOIN houses ON students.house_id = houses.id;
```
Yields:
```bash
id | fname  | lname  | house_id | id |   name    
----+--------+--------+----------+----+-----------
 1 | dennis | liaw   |        1 |  1 | Slytherin
 2 | jaden  | carver |        2 |  2 | Ravenclaw

```
The above statement selects everything from the students table, and join it with the houses table, aligning them where the students house_id matches the id of houses.

If we wanted only specific columns, we need only change the `*` to the specific columns we want.

```SQL
SELECT students.fname, students.lname,
houses.name AS "house name" -- alias column names with AS
FROM students
JOIN houses ON students.house_id = houses.id;
```
Yields:
```bash
 fname  | lname  | house name
--------+--------+------------
 dennis | liaw   | Slytherin
 jaden  | carver | Ravenclaw
```

# IMDB - Many to Many Relationships

Many to many relationships have very different kinds of relationships. Actors can have many movies, and movies can have many actors. So we let them stand alone in their own tables and use a `join table` to serve as a directory linking actors to movies.

This way we don't have duplicate rows of actors pointing to movies, and duplicate movies pointing to actors.

So we should know from doing this that many to many relationships implies the existence three tables, ***despite certain diagrams not showing them***.

The join table is just a "skinny" table, in that it only has two columns, both foreign keys that point to the two tables whos data it's used to join.

Querying the data is a much longer process, but nothing we haven't seen before, we just double up on the  `JOIN` command.

```SQL
SELECT actors.*, movies.* FROM actors -- alternative to *
JOIN actors_movies ON actors.id = actors_movies.actor_id
JOIN movies ON movies.id = actors_movies.movie_id;
```
```bash
 id |        name         | gender | id |        name         | release_year | genre  
----+---------------------+--------+----+---------------------+--------------+--------
  7 | Winona Ryder        | Female |  5 | Edward Scissorhands |         1990 | drama
  1 | Ben Stiller         | Male   |  1 | Tropic Thunder      |         2008 | comedy
  5 | Jack Black          | Male   |  1 | Tropic Thunder      |         2008 | comedy
  1 | Ben Stiller         | Male   |  2 | Envy                |         2004 | comedy
  5 | Jack Black          | Male   |  2 | Envy                |         2004 | comedy
  1 | Ben Stiller         | Male   |  3 | Tenacious D         |         2006 | comedy
  5 | Jack Black          | Male   |  3 | Tenacious D         |         2006 | comedy
  3 | Vince Vaughn        | Male   |  4 | Anchorman           |         2004 | comedy
  4 | Will Ferrell        | Male   |  4 | Anchorman           |         2004 | comedy
  6 | Christina Applegate | Female |  4 | Anchorman           |         2004 | comedy
```

So here we first join `actors` with `actors_movies`, and then join the results of that query with the `movies` table, normalizing them based on their corresponding IDs.

# Dynamic Queries

PSQL has the ability to create [prepared statments/queries](http://www.postgresql.org/docs/9.4/static/sql-prepare.html)

#### Examples
In psql:
```SQL
PREPRE get_student( text, text ) AS
SELECT * FROM students WHERE fname = $1 AND lname = $2;

-- WE saved a query! now to use it

EXECUTE get_student( "Bryan", "Mytko");
-- the first argument gets turned into text and put in place of $1
-- the second statement gets turned into text and is put in place of $2
-- SELECT * FROM students WHERE fname = 'Bryan' AND lname = 'Mytko';
```

So, the good news is we can just do this in Ruby, and not live in a `psql` terminal.

The `pg` gem has a function called `exec_params` that lets us pass in a prepared statement string and the params we want to pass in.

```rb
# imagine an example sinatra app

get '/bobbys_page' do
  # now that we can save queries
  student_search = "SELECT * FROM students WHERE fname = $1 AND lname = $2;"
  db    = PG.connect dbname: "students"
  bobby = db.exec_params student_search, [ "Bobby", "King"]
  # Now we can output Bobby in our views!
  # remember queries return a collection (array-like) so you have to grab it manually
  @bobby = bobby[0]
  erb :bobby_kings_page
end

```

`.exec_params` takes two arguments. The query string, and an **array of arguments** to pass into the query in place of the dynamic values.

The first value always maps to $1, second value to $2, etc...

Any time you take in input from as user, like from a form on your web app, you are at risk of a SQL injection attack.

So always use `.exec_params` because in its conversion process, it'll "unescape" escape characters, effectively "sanitizing" your input.


```rb
# some other sinatra app
post '/articles' do
  insert = "INSERT INTO articles (title, author, text) VALUES ($1, $2, $3 )"

  db = PG.connect db_name: "article_db"

  # if your user was malicious, the data from params would get
  # "sanitized". no more "drop table" pranks
  db.exec_params insert, [ params[:title], params[:author], params[:article_text] ]

end

```

# EN CONCLUSION

Now you can do stuff like this:

```rb
# yet another sinatra app

post '/soldier/new' do
  # check the RETURNING clause in Postgres, we'll go into detail later
  result = db.exec_params "INSERT INTO students (fname, lname, image, unit_id) VALUES ($1, $2, $3, $4) RETURNING id", [ params[:fname], params[:lname], params[:image], params[:unit_id] ]
  redirect "/soldiers/#{ result.first["id"] }"
end

get '/soldiers' do
  @soldiers = db.exec "SELECT soldiers.*, unit.name AS unit_name FROM soldiers LEFT JOIN units ON soldiers.unit_id = units.id"
  erb :soldiers
end


```
