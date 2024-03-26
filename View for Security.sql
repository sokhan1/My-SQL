--For security reasons ‘View’ is used

CREATE VIEW menu_view AS
SELECT 
	menu_id,
    menu_name,
    CONCAT(
		SUBSTRING(business_name,1,1),
        REPEAT('*',CHAR_LENGTH(business_name)-1)
	) AS business,
    price,
    likes AS evaluation
FROM businesses B
INNER JOIN menus M
	ON M.fk_business_id = B.business_id;

CREATE VIEW business_view AS
SELECT
	section_name,
    business_name,
    (SELECT COUNT(*) FROM menus M
		WHERE M.fk_business_id = B.business_id
	) AS menu_count,
    (SELECT AVG(likes) FROM menus M
		WHERE M.fk_business_id = B.business_id
	) AS menu_avg_likes,
    (SELECT AVG(stars) FROM ratings R
		WHERE R.fk_business_id = B.business_id
	) AS avg_stars,
    (SELECT comment FROM ratings R
		WHERE R.fk_business_id = B.business_id
	ORDER BY created DESC LIMIT 1
    ) AS recent_comment
FROM businesses B
INNER JOIN sections S
	ON S.section_id = B.fk_section_id;
