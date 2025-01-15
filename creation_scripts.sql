CREATE TYPE product_state AS ENUM (
    'active',
    'is_out_of_stock',
    'no_longer_exists'
    );


CREATE TABLE product_data (
                              product_id BIGINT NOT NULL,
                              option_id BIGINT NOT NULL,
                              is_described BOOLEAN NOT NULL DEFAULT FALSE,
                              category TEXT CHECK (char_length(category) <= 500),
                              additional_info TEXT,
                              count_of_users BIGINT DEFAULT 0 CHECK (count_of_users >= 0),
                              PRIMARY KEY (product_id, option_id)
);


CREATE TABLE product_statistics (
                                    id BIGSERIAL PRIMARY KEY,
                                    product_id BIGINT NOT NULL,
                                    option_id BIGINT NOT NULL,
                                    measurement_time BIGINT NOT NULL CHECK (measurement_time > 0),
                                    state product_state NOT NULL DEFAULT 'active',
                                    rating INT DEFAULT 0 CHECK (rating BETWEEN 0 AND 5),
                                    product_price BIGINT DEFAULT 0 CHECK (product_price >= 0),
                                    FOREIGN KEY (product_id, option_id) REFERENCES product_data (product_id, option_id) ON DELETE CASCADE ON UPDATE CASCADE
);


CREATE UNIQUE INDEX idx_product_id_option_id ON product_data (product_id, option_id);
