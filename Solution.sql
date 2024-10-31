-- We are looking for a ​murder​ 
-- that occurred sometime on ​Jan.15, 2018​ 
-- and that took place in ​SQL City​

-- Find the Murder:
SELECT * 
FROM crime_scene_report
WHERE type='murder'
AND date=20180115
AND lower(city)='sql city';

              
-- 2 Witnesses
-- 1st - lives at the last house on Northwestern Dr
-- 2nd - Annabel, lives somewhere on Franklin Ave


-- Find the 1st Witness
SELECT *
FROM person
WHERE address_street_name = 'Northwestern Dr' 
ORDER BY address_number desc
LIMIT 1;
-- Witness = Morty Schapiro, ID = 14887


-- Find the 2nd Witness
SELECT * 
FROM person
WHERE address_street_name = 'Franklin Ave'
AND name LIKE 'Annabel%';
-- Witness = Annabel Miller, ID = 16371

-- Witness = Morty Schapiro, ID = 14887
-- Witness = Annabel Miller, ID = 16371


-- Find Morty and Annabel's interviews using ID
SELECT *
FROM interview
WHERE person_id=14887
OR person_id=16371;


-- Details from interviews:
-- Gym Membership number started with 48z, gold member, check in date January 9th 
-- Car plate included H42W

-- Find the person
SELECT p.*
FROM drivers_license as DL
INNER JOIN person as P on DL.id = P.license_id
INNER JOIN get_fit_now_member as GFN on GFN.person_id = P.id
WHERE plate_number LIKE '%H42W%'

  
-- Check the interview transcript for Jeremy Bowers
-- id=67318
SELECT *
FROM interview
WHERE person_id='67318';

-- We are looking for a
-- Woman
-- 5'5 / 65" - 5'7 / 67"
-- Red hair
-- Drives a Tesla Model S
-- Attended the SQL Symphony Concert 3 times in December 2017
SELECT DL.*, P.name, FB.* 
FROM drivers_license as DL
INNER JOIN person as P on DL.id = P.license_id
INNER JOIN facebook_event_checkin as FB on FB.person_id = P.id
WHERE height BETWEEN 65 AND  67
AND gender='female'
AND hair_color='red'
AND car_make='Tesla'
AND car_model='Model S';

-- Miranda Priestly
