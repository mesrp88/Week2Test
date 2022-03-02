CREATE TABLE IF NOT EXISTS dividend
(
	company character varying(12),
	fiscal_year integer
);
COPY dividend 
FROM 'C:\Users\Public\Documents\dividend_data.txt' 
DELIMITER ',';

