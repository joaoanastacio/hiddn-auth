CREATE OR REPLACE FUNCTION increase_profile_followers_acount()
  RETURNS TRIGGER 
  LANGUAGE PLPGSQL
  AS
$$
BEGIN
	IF NEW.last_name <> OLD.last_name THEN
		 INSERT INTO employee_audits(employee_id,last_name,changed_on)
		 VALUES(OLD.id,OLD.last_name,now());
	END IF;

	RETURN NEW;
END;
$$

CREATE TRIGGER profile_followers_acount_trigger AFTER INSERT ON TB_PROFILE_FOLLOWER FOR EACH ROW EXECUTE PROCEDURE increase_profile_followers_acount();

CREATE OR REPLACE FUNCTION increase_profile_followings_acount()
  RETURNS TRIGGER 
  LANGUAGE PLPGSQL
  AS
$$
BEGIN
	IF NEW.last_name <> OLD.last_name THEN
		 INSERT INTO employee_audits(employee_id,last_name,changed_on)
		 VALUES(OLD.id,OLD.last_name,now());
	END IF;

	RETURN NEW;
END;
$$

CREATE TRIGGER profile_followings_acount AFTER INSERT ON TB_PROFILE_FOLLOWING FOR EACH ROW EXECUTE PROCEDURE increase_profile_followings_acount();