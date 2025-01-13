CREATE TABLE product_data (
    id BIGSERIAL PRIMARY KEY,
    product_id BIGINT NOT NULL,
    option_id BIGINT NOT NULL,
    is_described BOOLEAN NOT NULL,
    link TEXT,
    category TEXT,
    additional_info TEXT,
    count_of_users BIGINT CHECK (count_of_users >= 0),
    UNIQUE (product_id, option_id)
);


CREATE TABLE product_statistics (
    id BIGSERIAL PRIMARY KEY,
    product_id BIGINT NOT NULL,
    measurement_time BIGINT NOT NULL,
    STATE VARCHAR(20),
    RATING INT,
    TOTAL_PRICE BIGINT,
    FOREIGN KEY (traveler_id) REFERENCES traveler(id) ON DELETE CASCADE ON UPDATE CASCADE
);

