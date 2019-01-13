DROP TABLE IF EXISTS wifi;

CREATE TABLE wifi (
	id SERIAL PRIMARY KEY,
	OBJECTID VARCHAR NOT NULL,
	the_geom VARCHAR NOT NULL,
	Boro VARCHAR NOT NULL,
	Type VARCHAR NOT NULL,
	Provider VARCHAR NOT NULL,
	Name VARCHAR,
	Location VARCHAR,
	Lat VARCHAR,
	Long_ VARCHAR,
	X VARCHAR,
	Y VARCHAR,
	Location_T  VARCHAR,
	Remarks VARCHAR,
	City VARCHAR,
	SSID VARCHAR,
	SourceID VARCHAR
);

COPY wifi
	(OBJECTID,the_geom,Boro,Type,Provider,Name,Location,Lat,Long_,X,Y,Location_T,Remarks,City,SSID,SourceID)
FROM '/home/jnorr/code/wdi/blue_steel/u3_the_server/d31_PSQL/student/homework/data_sets/Free_WiFi_Hotspots_09042005.csv'
	DELIMITER ',' CSV;
