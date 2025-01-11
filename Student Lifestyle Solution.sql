-- --------------------------------- CREATING DATABASE -------------------------------
CREATE DATABASE IF NOT EXISTS student_lifestyle;

-- Creating table for the DataSet
CREATE TABLE information(
student_id INT PRIMARY KEY NOT NULL,
study_hours DECIMAL(2, 1),
extracurricular_hours DECIMAL(2, 1), 
sleep_hours_per_day DECIMAL(2, 1),
social_hours_per_day DECIMAL(2, 1),
physical_activity_hour_per_day DECIMAL(2, 1),
GPA DECIMAL(10, 2),
stress_level VARCHAR(20)
);

-- Selecting the table
SELECT * FROM information;


-- -------------------------------------------------------------------------------------
-- -------------------------------------------------------------------------------------

-- ------------------------Business Questions To Answer---------------------------------

-- -------------------------------------------------------------------------------------
-- ----------------------------- Generic Questions -------------------------------------
-- -------------------------------------------------------------------------------------

-- What is the distribution of stress level among students in the provided data?
SELECT DISTINCT stress_level
FROM information;

-- Answer :- Moderate, low and high.


-- How many students have different types of stress level provided from the data in descending order?
SELECT stress_level,
COUNT(*) AS no_of_students
FROM information
GROUP BY stress_level
ORDER BY no_of_students DESC;

-- Answer :- High(990 students), Moderate(664 students) and Low(286 students)

 
-- What is the average number of study hour per day for the students?
SELECT ROUND(AVG(study_hours), 2) AS avg_study_hrs
FROM information;

-- Answer :- 7.478


-- What are the highest and lowest GPA of the students?
SELECT MAX(GPA) AS highest_GPA,
MIN(GPA) AS lowest_GPA
FROM information;

-- Answer :- 4.00(Highest) and 2.24(Lowest)


-- What is the average sleep hours of the students?
SELECT ROUND(AVG(sleep_hours_per_day), 2) AS avg_sleep_hrs
FROM information;

-- Answer :- 7.50

-- -------------------------------------------------------------------------------------
-- -------------------------------------------------------------------------------------

-- --------------------------- Comparative Questions -----------------------------------

-- How do study hours differ between students with high GPA(> 3.5) and low GPA (<= 3.5)?
SELECT (
CASE 
	WHEN GPA > 3.5 THEN "High"
	ELSE "Low"
END) AS GPA_category,
ROUND(AVG(study_hours), 2) AS avg_study_hrs
FROM information
GROUP BY GPA_category
ORDER BY avg_study_hrs DESC;

-- Answer :- High(9.16) and Low(7.28)


-- Are students with higher physical activity levels less social hours?
SELECT (
CASE
	WHEN physical_activity_hour_per_day > 2.5 THEN "High Activity"
    ELSE "Low Activity" 
END) AS activity_level,
ROUND(AVG(social_hours_per_day), 2) AS avg_social
FROM information
GROUP BY activity_level
ORDER BY avg_social;

-- Answer :- High activity(2.45) and Low activity(3.50)


-- -------------------------------------------------------------------------------------
-- -------------------------------------------------------------------------------------

-- -------------------------- Correlational Questions ----------------------------------

-- Is there correlation between study hours and GPA of students?
SELECT study_hour, GPA
FROM information;


-- Is there correlation between extracurricular hours and social hours?
SELECT extracurricular_hours, social_hours_per_day
FROM information;


-- Is there correlation between physical activity hours and sleep hours?
SELECT physical_activity_hour_per_day, sleep_hours_per_day
FROM information;
-- -------------------------------------------------------------------------------------
-- -------------------------------------------------------------------------------------

-- -------------------------- Segmentation Analysis ------------------------------------

-- How many students allocate more time to socializing than studying and have low GPA?
SELECT COUNT(*) AS no_student
FROM information
WHERE social_hours_per_day > study_hours
AND GPA < 3.0;

-- Answer :- 17 Students


-- How many studnets allocate less time to socializing than studing and having high GPA?
SELECT COUNT(*) AS no_students
FROM information
WHERE social_hours_per_day < study_hours
AND GPA > 3.5;

-- Answer :- 198 students


-- How many students fall into each stress level category them in descending order.
SELECT stress_level, COUNT(*) AS no_of_stds
FROM information
GROUP BY stress_level
ORDER BY no_of_stds DESC;

-- Answer :- High(990 students), Moderate(664 students) and Low(286 students)


-- How many students have both stress high level as well as low GPA < 2.5?
SELECT COUNT(*) AS no_of_stds
FROM information
WHERE stress_level = "High" 
AND GPA < 2.5;

-- Answer :- 5 students


-- -------------------------------------------------------------------------------------
-- -------------------------------------------------------------------------------------

-- ---------------------------- Grouping by GPA Range ----------------------------------

-- How many students belong to each GPA range?
SELECT (
CASE
	WHEN GPA < 3.0 THEN 'Low_GPA'
    WHEN GPA BETWEEN 3.0 AND 3.5 THEN 'Medium_GPA'
    ELSE 'High_GPA'
END) AS GPA_range,
COUNT(*) AS number_of_stds
FROM information
GROUP BY GPA_range;


-- What is the average time allocation and round the time in 2 decimal numbers for each GPA category?
SELECT (
CASE 
	WHEN GPA < 3.0 THEN 'Low_GPA'
	WHEN GPA BETWEEN 3.0 AND 3.5 THEN 'Medium_GPA'
	ELSE 'High_GPA'
END ) AS GPA_category,
ROUND(AVG(study_hours), 2) AS avg_study,
ROUND(AVG(sleep_hours_per_day), 2) AS avg_sleep_hrs,
ROUND(AVG(extracurricular_hours), 2) AS avg_extracurricular_hrs
FROM information
GROUP BY GPA_catergory;

-- -------------------------------------------------------------------------------------
-- -------------------------------------------------------------------------------------

-- --------------------- Balanced vs Imbalanced Lifestyles ----------------------------

-- How many students have a "balanced lifestyle"?
SELECT COUNT(*) AS balanced_lifestyle
FROM information
WHERE study_hour BETWEEN 2 AND 5
	AND sleep_hours_per_day BETWEEN 6 AND 8
    AND extracurricular_hours >= 1;
    
-- Answer :- 5 students have balanced lifestyle.


-- Identify students with "imbalanced lifestyles"?
SELECT student_id, study_hours, extracurricular_hours,
sleep_hours_per_day, social_hours_per_day, 
physical_activity_hour_per_day
FROM information
WHERE study_hours > 7
OR sleep_hours_per_day < 5 
OR physical_activity_hour_per_day = 1;


-- How many students have balanced time allocation across all activities?
SELECT COUNT(*) AS balanced_students
FROM information
WHERE GREATEST(study_hours, extracurricular_hours, sleep_hours_per_day, social_hours_per_day, physical_activity_hour_per_day) 
	<= 0.4 * (study_hours + extracurricular_hours + sleep_hours_per_day + social_hours_per_day + physical_activity_hour_per_day);
    
-- Answer :- 1669 students are balanced acrosss all the activities.
-- -------------------------------------------------------------------------------------
-- -------------------------------------------------------------------------------------

-- ----------------------- Physical Activity and Stress --------------------------------

-- How many students have low physical activity?
SELECT COUNT(*) AS no_stds
FROM information
WHERE physical_activity_hour_per_day < 1;

-- Answer :- 168 students


-- How many students with "Stress level" participate more than 1 hour of physical everyday?
SELECT COUNT(*) AS high_stress_level
FROM information
WHERE stress_level = 'High' AND physical_activity_hour_per_day > 1;

-- Answer :- 860 students 


-- Segment students based on their physical activity levels?
SELECT(
CASE 
	WHEN physical_activity_hour_per_day < 1.5 THEN 'Low Active'
	WHEN physical_activity_hour_per_day < 2.5 THEN 'Highy Active'
	ELSE 'Moderately Active'
    END) AS activity_level, 
COUNT(*) AS no_of_stds
FROM information
GROUP BY activity_level
ORDER BY no_of_stds DESC;


-- -------------------------------------------------------------------------------------
-- -------------------------------------------------------------------------------------

-- -------------------- Segmentation by Social Interaction -----------------------------

-- Group the students and count them on the basis of social hours per day?
SELECT (
CASE
	WHEN social_hours_per_day < 2 THEN "Low"
    WHEN social_hours_per_day BETWEEN 2 AND 4 THEN "Moderate"
    ELSE "High" 
END) AS social_interaction,
COUNT(*) AS no_of_students
FROM information
GROUP BY social_interaction
ORDER BY no_of_students DESC;


-- Compare average GPA's of students according to social hours distribution? 
SELECT (
CASE
	WHEN social_hours_per_day < 2 THEN "Low"
    WHEN social_hours_per_day > 4 THEN "High"
    ELSE "Moderate"
END) AS social_interaction,
ROUND(AVG(GPA), 2) AS avg_GPA
FROM information
GROUP BY social_interaction
ORDER BY avg_GPA;

-- Answer :- High(3.07 GPA), Moderate(3.12 GPA) and Low(3.14 GPA)


-- -------------------------------------------------------------------------------------
-- -------------------------------------------------------------------------------------

-- -------------------- High Performers and Low Performers -----------------------------

-- Segment students into "high performers" (GPA >= 3.5), "low performers" (GPA < 2.5) and "Average performers" based on their lifestyle patterns?
SELECT (
CASE
	WHEN GPA >= 3.5 THEN "High performers"
    WHEN GPA < 2.5 THEN "Low performers"
    ELSE "Average performers" 
END) AS performers,
AVG(study_hours) AS avg_study_hrs,
AVG(sleep_hours_per_day) AS avg_sleep_hrs,
AVG(physical_activity_hour_per_day) AS avg_physical_activity
FROM information 
GROUP BY performers;  


-- How many students are "high performers" and maintain a low stress level?
SELECT COUNT(*) AS high_performers
FROM information
WHERE GPA > 3.0 AND stress_level = "Low";

-- Answer :- 52(students)

-- -------------------------------------------------------------------------------------
-- -------------------------------------------------------------------------------------

 -- --------------------------- Optimization and Recommendations ------------------------

-- Which students could improve their GPA by reallocating time?
SELECT student_id, GPA, study_hours, social_hours_per_day, extracurricular_hours
FROM information
WHERE GPA < 2.5 AND social_hours_per_day > 3 OR extracurricular_hours > 3;


-- How can students optimize their GPA by balancing their activities?
SELECT ROUND(AVG(study_hours), 2) AS avg_study_hrs,
ROUND(AVG(sleep_hours_per_day), 2) AS avg_sleep_hrs
FROM information
WHERE GPA > 3.5;

-- Answer :- 9.16 (avg study hrs), 7.65 (avg sleep hrs)


-- What is the minimum and maximum sleep hours of a student who achive GPA > 3.5?
SELECT MIN(sleep_hours_per_day) AS min_sleep_hrs,
MAX(sleep_hours_per_day) AS max_sleep_hrs
FROM information 
WHERE GPA > 3.5;

-- Answer:- 5.0(minimum sleep hours) , 9.9 (maximum sleep hours) 