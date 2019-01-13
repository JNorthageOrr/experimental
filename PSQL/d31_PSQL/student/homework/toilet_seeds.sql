DROP TABLE if EXISTS toilets;

CREATE TABLE toilets(
	id SERIAL PRIMARY KEY
	, Name VARCHAR
	, Location VARCHAR
	, OpenYearRound VARCHAR
	, HandicapAccessible VARCHAR
	, Borough VARCHAR
	, Comments VARCHAR
	);

	COPY toilets(Name,Location,OpenYearRound,HandicapAccessible,Borough,Comments)
	FROM '/home/jnorr/code/wdi/blue_steel/u3_the_server/d31_PSQL/student/homework/data_sets/Directory_Of_Toilets_In_Public_Parks.csv'
	WITH DELIMITER ',' CSV;
