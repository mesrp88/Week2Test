WITH cte1 As (
	SELECT *,
	TO_NUMBER(CAST(fiscal_year As VARCHAR), '9999') AS start_year
	FROM dividend), 
	cte2 As (
	SELECT *,start_year-ROW_NUMBER() OVER (PARTITION BY company ORDER BY start_year) AS grp
	FROM cte1),
	cte3 AS(
	SELECT *, COUNT(*) OVER (PARTITION BY company, grp) AS grp_count
	FROM cte2)
SELECT array_agg(DISTINCT(company)) AS valuestocks FROM cte3
WHERE grp_count>=3



