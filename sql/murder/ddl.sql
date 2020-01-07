CREATE TABLE crime_scene_report (
  date integer,
  type text,
  description text,
  city text
);

CREATE TABLE drivers_license (
  id integer PRIMARY KEY,
  age integer,
  height integer,
  eye_color text,
  hair_color text,
  gender text,
  plate_number text,
  car_make text,
  car_model text
);

CREATE TABLE facebook_event_checkin (
  person_id integer,
  event_id integer,
  event_name text,
  date integer,
  FOREIGN KEY (person_id) REFERENCES person(id)
);

CREATE TABLE get_fit_now_check_in (
  membership_id text,
  check_in_date integer,
  check_in_time integer,
  check_out_time integer,
  FOREIGN KEY (membership_id) REFERENCES get_fit_now_member(id)
);

CREATE TABLE get_fit_now_member (
  id text PRIMARY KEY,
  person_id integer,
  name text,
  membership_start_date integer,
  membership_status text,
  FOREIGN KEY (person_id) REFERENCES person(id)
);

CREATE TABLE income (
  ssn integer PRIMARY KEY,
  annual_income integer
);

CREATE TABLE interview (
  person_id integer,
  transcript text,
  FOREIGN KEY (person_id) REFERENCES person(id)
);

CREATE TABLE person (
  id integer PRIMARY KEY,
  name text,
  license_id integer,
  address_number integer,
  address_street_name text,
  ssn integer,
  FOREIGN KEY (license_id) REFERENCES drivers_license(id)
);

CREATE TABLE solution (
  user integer,
  value text
);
CREATE TRIGGER check_solution AFTER INSERT ON solution
    WHEN new.user==1
      BEGIN
        DELETE FROM solution;
        INSERT INTO solution VALUES (0,
          CASE WHEN hex(new.value)=='4A6572656D7920426F77657273' THEN "Congrats, you found the murderer! But wait, there's more... If you think you're up for a challenge, try querying the interview transcript of the murderer to find the real villian behind this crime. If you feel especially confident in your SQL skills, try to complete this final step with no more than 2 queries. Use this same INSERT statement with your new suspect to check your answer."
          WHEN hex(new.value)=='4D6972616E6461205072696573746C79' THEN "Congrats, you found the brains behind the murder! Everyone in SQL City hails you as the greatest SQL detective of all time. Time to break out the champagne!"
          ELSE "That's not the right person. Try again!"
          END
        );
      END;
