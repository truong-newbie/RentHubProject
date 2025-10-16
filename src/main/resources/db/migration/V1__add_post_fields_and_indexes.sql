-- Flyway migration: add columns and indexes for posts and users
-- Adjust table names according to JPA defaults

-- Add free_post_quota to users table
ALTER TABLE users
    ADD COLUMN free_post_quota INT DEFAULT 3;

-- Add latitude/longitude to room_listing table
ALTER TABLE room_listing
    ADD COLUMN latitude DOUBLE NULL,
    ADD COLUMN longitude DOUBLE NULL;

-- Add views_count default and ensure column exists
ALTER TABLE room_listing
    MODIFY COLUMN views_count BIGINT DEFAULT 0;

-- Create indexes to help search queries
CREATE INDEX idx_roomlisting_title ON room_listing (title(255));
CREATE INDEX idx_roomlisting_address ON room_listing (address(255));
CREATE INDEX idx_roomlisting_price ON room_listing (price);
CREATE INDEX idx_roomlisting_rentalType ON room_listing (rental_type);
CREATE INDEX idx_roomlisting_status ON room_listing (status);

-- Ensure users.email is indexed (should already be unique/indexed in many schemas)
CREATE INDEX IF NOT EXISTS idx_users_email ON users (email(255));
