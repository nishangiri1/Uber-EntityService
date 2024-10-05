ALTER TABLE passenger
    ADD full_name VARCHAR(255) NULL;

ALTER TABLE passenger
    MODIFY full_name VARCHAR (255) NOT NULL;

-- ALTER TABLE driver
--     ADD nid VARCHAR(255) NULL;

ALTER TABLE driver
    ADD password VARCHAR(255) NULL;

ALTER TABLE driver
    MODIFY nid VARCHAR (255) NOT NULL;

ALTER TABLE driver
    MODIFY password VARCHAR (255) NOT NULL;

ALTER TABLE driver
    ADD CONSTRAINT uc_driver_nid UNIQUE (nid);

ALTER TABLE passenger
    DROP COLUMN name;
