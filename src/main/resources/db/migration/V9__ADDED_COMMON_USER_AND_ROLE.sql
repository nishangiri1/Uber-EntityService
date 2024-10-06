ALTER TABLE driver
    DROP FOREIGN KEY FK_DRIVER_ON_HOME;

ALTER TABLE driver
    DROP FOREIGN KEY FK_DRIVER_ON_LAST_KNOWN_LOCATION;

ALTER TABLE passenger
    DROP FOREIGN KEY FK_PASSENGER_ON_HOME;

ALTER TABLE passenger
    DROP FOREIGN KEY FK_PASSENGER_ON_LAST_KNOWN_LOCATION;

CREATE TABLE role
(
    id
    BIGINT
    AUTO_INCREMENT
    NOT
    NULL,
    created_at
    datetime
    NOT
    NULL,
    updated_at
    datetime
    NOT
    NULL,
    role_type
    ENUM('ROLE_PASSENGER','ROLE_DRIVER','ROLE_ADMIN') NULL,
    CONSTRAINT pk_role PRIMARY KEY
(
    id
)
    );

CREATE TABLE user
(
    id                     BIGINT AUTO_INCREMENT NOT NULL,
    created_at             datetime     NOT NULL,
    updated_at             datetime     NOT NULL,
    full_name              VARCHAR(255) NOT NULL,
    email                  VARCHAR(255) NULL,
    phone_number           VARCHAR(255) NULL,
    password               VARCHAR(255) NOT NULL,
    last_known_location_id BIGINT       NULL,
    home_id                BIGINT       NULL,
    CONSTRAINT pk_user PRIMARY KEY (id)
);

ALTER TABLE user
    ADD CONSTRAINT uc_user_email UNIQUE (email);

ALTER TABLE user
    ADD CONSTRAINT uc_user_phone_number UNIQUE (phone_number);

ALTER TABLE driver
    ADD CONSTRAINT FK_DRIVER_ON_ID FOREIGN KEY (id) REFERENCES user (id);

ALTER TABLE passenger
    ADD CONSTRAINT FK_PASSENGER_ON_ID FOREIGN KEY (id) REFERENCES user (id);

ALTER TABLE user
    ADD CONSTRAINT FK_USER_ON_HOME FOREIGN KEY (home_id) REFERENCES exact_location (id);

ALTER TABLE user
    ADD CONSTRAINT FK_USER_ON_LAST_KNOWN_LOCATION FOREIGN KEY (last_known_location_id) REFERENCES exact_location (id);

DROP TABLE dbconstant;

ALTER TABLE driver
    DROP COLUMN created_at;

ALTER TABLE driver
    DROP COLUMN home_id;

ALTER TABLE driver
    DROP COLUMN last_known_location_id;

ALTER TABLE driver
    DROP COLUMN name;

ALTER TABLE driver
    DROP COLUMN password;

ALTER TABLE driver
    DROP COLUMN phone_number;

ALTER TABLE driver
    DROP COLUMN updated_at;

ALTER TABLE passenger
    DROP COLUMN created_at;

ALTER TABLE passenger
    DROP COLUMN email;

ALTER TABLE passenger
    DROP COLUMN full_name;

ALTER TABLE passenger
    DROP COLUMN home_id;

ALTER TABLE passenger
    DROP COLUMN last_known_location_id;

ALTER TABLE passenger
    DROP COLUMN password;

ALTER TABLE passenger
    DROP COLUMN phone_number;

ALTER TABLE passenger
    DROP COLUMN updated_at;
