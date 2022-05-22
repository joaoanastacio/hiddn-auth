CREATE OR REPLACE FUNCTION increase_profile_followers_acount()
  RETURNS TRIGGER AS
$$
BEGIN
	UPDATE 
		TB_PROFILE 
	SET 
		TB_PROFILE.profile_followers_count = TB_PROFILE.profile_followers_count + 1
	WHERE
		TB_PROFILE.profile_id = NEW.profile_id;

	RETURN NEW;
END;
$$
LANGUAGE 'plpgsql';

CREATE TRIGGER increase_profile_followers_acount_trigger AFTER INSERT ON TB_PROFILE_FOLLOWER FOR EACH ROW EXECUTE PROCEDURE increase_profile_followers_acount();


CREATE OR REPLACE FUNCTION decrease_profile_followers_acount()
  RETURNS TRIGGER AS
$$
BEGIN
	UPDATE
		TB_PROFILE 
	SET 
		TB_PROFILE.profile_followers_count = TB_PROFILE.profile_followers_count - 1
	WHERE
		TB_PROFILE.profile_id = NEW.profile_id;
END;
$$
LANGUAGE 'plpgsql';

CREATE TRIGGER decrease_profile_followers_acount_trigger AFTER DELETE ON TB_PROFILE_FOLLOWER FOR EACH ROW EXECUTE PROCEDURE decrease_profile_followers_acount();


CREATE OR REPLACE FUNCTION increase_profile_followings_acount()
  RETURNS TRIGGER AS
$$
BEGIN
	UPDATE 
		TB_PROFILE 
	SET 
		TB_PROFILE.profile_following_count = TB_PROFILE.profile_following_count + 1
	WHERE
		TB_PROFILE.profile_id = NEW.profile_id;
	
	RETURN NEW;
END;
$$
LANGUAGE 'plpgsql';

CREATE TRIGGER increase_profile_followings_acount AFTER INSERT ON TB_PROFILE_FOLLOWING FOR EACH ROW EXECUTE PROCEDURE increase_profile_followings_acount();


CREATE OR REPLACE FUNCTION decrease_profile_followings_acount()
  RETURNS TRIGGER AS
$$
BEGIN
	UPDATE 
		TB_PROFILE 
	SET 
		TB_PROFILE.profile_following_count = TB_PROFILE.profile_following_count - 1
	WHERE
		TB_PROFILE.profile_id = NEW.profile_id;
END;
$$
LANGUAGE 'plpgsql';

CREATE TRIGGER decrease_profile_followings_acount AFTER DELETE ON TB_PROFILE_FOLLOWING FOR EACH ROW EXECUTE PROCEDURE decrease_profile_followings_acount();