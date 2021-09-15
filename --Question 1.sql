--Question 1
CREATE TABLE time_e (
    time_id VARCHAR2(10),
    day     NUMBER(2),
    month   NUMBER(3),
    quarter NUMBER(1),
    year    NUMBER(4),
    CONSTRAINT time_primary_key PRIMARY KEY ( time_id )
);

CREATE TABLE branch (
    branch_id   VARCHAR2(10),
    branch_name VARCHAR2(15),
    branch_type VARCHAR2(10),
    CONSTRAINT branch_primary_key PRIMARY KEY ( branch_id )
);

CREATE TABLE item (
    item_id       VARCHAR2(10),
    item_name     VARCHAR2(15),
    brand         VARCHAR2(15),
    type          VARCHAR2(10),
    supplier_type VARCHAR2(10),
    CONSTRAINT item_primary_key PRIMARY KEY ( item_id )
);

CREATE TABLE location (
    location_id VARCHAR2(10),
    street      VARCHAR2(10),
    city        VARCHAR2(10),
    state       VARCHAR2(10),
    country     VARCHAR2(10),
    CONSTRAINT location_primary_key PRIMARY KEY ( location_id )
);

CREATE TABLE sales (
    branch_id    VARCHAR2(10),
    location_id  VARCHAR2(10),
    item_id      VARCHAR2(10),
    time_id      VARCHAR2(10),
    units_sold   NUMBER(10),
    dollars_sold NUMBER(10),
    CONSTRAINT sales_primary_key PRIMARY KEY ( branch_id,
                                               location_id,
                                               item_id,
                                               time_id ),
    CONSTRAINT sales_branch_fk FOREIGN KEY ( branch_id )
        REFERENCES branch ( branch_id ),
    CONSTRAINT time_branch_fk FOREIGN KEY ( time_id )
        REFERENCES time_e ( time_id ),
    CONSTRAINT item_branch_fk FOREIGN KEY ( item_id )
        REFERENCES item ( item_id ),
    CONSTRAINT location_branch_fk FOREIGN KEY ( location_id )
        REFERENCES location ( location_id )
);
--Question 2
INSERT INTO branch VALUES (
    '64468',
    'Siri kirana',
    'Retail Sale'
);

INSERT INTO branch VALUES (
    '64469',
    'hyvee Mart',
    'Whole Sale'
);

INSERT INTO branch VALUES (
    '64470',
    'Big bazar Store',
    'Whole Sale'
);

INSERT INTO branch VALUES (
    '64471',
    'blue Mart',
    'Whole Sale'
);

INSERT INTO branch VALUES (
    '64472',
    'harsha store',
    'Whole Sale'
);

INSERT INTO item VALUES (
    '1',
    'outfit',
    'jockey',
    'trad',
    'relaince'
);

INSERT INTO item VALUES (
    '2',
    'Gym wear',
    'spotrs',
    'gold',
    'indian'
);

INSERT INTO item VALUES (
    '3',
    'Headphones',
    'bose',
    'electric',
    'india'
);

INSERT INTO location VALUES (
    'maryville',
    '1115 N',
    'kansas',
    'Missouri',
    'USA'
);

INSERT INTO location VALUES (
    'kansas',
    '1722 S',
    'st joe',
    'Missouri',
    'USA'
);

INSERT INTO location VALUES (
    'st louis',
    '1125 N',
    'Missouri',
    'Missouri',
    'USA'
);

INSERT INTO time_e VALUES (
    '1',
    8,
    10,
    5,
    2021
);

INSERT INTO time_e VALUES (
    '2',
    25,
    4,
    1,
    2021
);

INSERT INTO time_e VALUES (
    '3',
    7,
    9,
    1,
    2021
);

INSERT INTO sales VALUES (
    '64468',
    'maryville',
    '1',
    '1',
    20,
    200
);

INSERT INTO sales VALUES (
    '64469',
    'kansas',
    '2',
    '2',
    25,
    300
);

INSERT INTO sales VALUES (
    '64470',
    'st Joe',
    '3',
    '3',
    2,
    400
);
--Question 3
ALTER TABLE sales MODIFY
    units_sold NUMBER(38);

ALTER TABLE sales MODIFY
    dollars_sold NUMBER(38);

--Question 4
UPDATE item
SET
    item_name = 'HAT',
    brand = 'Puma',
    type = 'Ferrari'
WHERE
    item_id = (
        SELECT
            a
        FROM
            (
                SELECT
                    ROWNUM a
                FROM
                    item
            ) tab
        WHERE
            tab.a = 3
    );

--Question 5
SELECT
    branch_id,
    location_id,
    item_id,
    units_sold,
    dollars_sold
FROM
    sales
ORDER BY
    item_id DESC;

--Question 6
SELECT
    COUNT(item_id),
    SUM(units_sold),
    sales.location_id
FROM
    sales
GROUP BY
    sales.location_id;

--Question 7
COMMIT;

--Question 8
SELECT * FROM location;

SELECT * FROM branch;

SELECT * FROM time_e;

SELECT * FROM item;

SELECT * FROM sales;

--Question 9
DROP TABLE sales;

DROP TABLE branch;

DROP TABLE location;

DROP TABLE time_e;

DROP TABLE item;

--Question 10
ROLLBACK;

--Question 11
SELECT * FROM location;

SELECT * FROM branch;

SELECT * FROM time_e;

SELECT * FROM item;

SELECT * FROM sales;

--Question 12
/*
 When we drop a table we cannot get back the dropped tables because drop is an auto commit statement.
 When we try to use the select query on the dropped tables, we get an error stating that table does not exist.

*/