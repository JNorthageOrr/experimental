DROP TABLE if EXISTS market;

CREATE TABLE market(
	Borough VARCHAR,
	MarketName VARCHAR,
	StreetAddress VARCHAR,
	Days VARCHAR, 
	Hours VARCHAR, 
	DistributesHealthBucks VARCHAR,
	AcceptsHealthBucks VARCHAR,
	EBT VARCHAR,
	Stellar VARCHAR
);

COPY market(Borough,MarketName,StreetAddress,Days,Hours,DistributesHealthBucks,AcceptsHealthBucks,EBT,Stellar)
FROM '../csv/2012_NYC_Farmers_Market_List.csv'
WITH DELIMITER ',' CSV;
