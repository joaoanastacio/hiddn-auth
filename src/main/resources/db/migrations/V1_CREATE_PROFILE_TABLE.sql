CREATE TABLE TB_PROFILE (
    profile_id SERIAL PRIMARY KEY,
    profile_username VARCHAR(25) UNIQUE NOT NULL,
    profile_password VARCHAR(50) NOT NULL,
    profile_email VARCHAR(255) UNIQUE NOT NULL,
    profile_phone VARCHAR(20) UNIQUE NOT NULL,
    profile_name VARCHAR(120) NOT NULL,
    profile_age INT NOT NULL,
    profile_bio VARCHAR(240),
    profile_photo_url VARCHAR(255),
    profile_verified BOOLEAN NOT NULL,
    profile_followers_count INT NOT NULL,
    profile_following_count INT NOT NULL,
    created_date TIMESTAMP NOT NULL,
    updated_date TIMESTAMP
);

ALTER TABLE TB_PROFILE ALTER COLUMN profile_followers_count SET DEFAULT 0;
ALTER TABLE TB_PROFILE ALTER COLUMN profile_following_count SET DEFAULT 0;
ALTER TABLE TB_PROFILE ALTER COLUMN profile_verified SET DEFAULT false;

CREATE TABLE TB_PROFILE_FOLLOWER(
    profile_follower_id SERIAL PRIMARY KEY,
    FOREIGN KEY (profile_id) REFERENCES TB_PROFILE (profile_id),
    FOREIGN KEY (follower_id) REFERENCES TB_PROFILE (follower_id)
);

CREATE TABLE TB_PROFILE_FOLLOWING(
    profile_following_id SERIAL PRIMARY KEY,
    FOREIGN KEY (profile_id) REFERENCES TB_PROFILE (profile_id),
    FOREIGN KEY (following_id) REFERENCES TB_PROFILE (following_id)
);