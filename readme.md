# Students Lifestyle Dataset Analysis

# About

This dataset provides a detailed view of student lifestyle patterns and their correlation with academic performance, represented by GPA. It contains 2,000 records of students daily habits across study, extracurriculars, sleep, socializing, and physical activities. Each student's stress level is derived based on study and sleep hours, offering insights into how lifestyle factors may impact academic outcomes. This dataset is obtain from kaggle [https://www.kaggle.com/datasets/steve1215rogg/student-lifestyle-dataset].

This data can support analysis in education, physhology, and health reserach fields, making it ideal for a projects on lifestyle management, academic performance prediction and well-being assesment.



## Purpose of the project

The purpose of this project is to utilize data analysis to understand how various lifestyle habits influence students academic performance. By analyzing factors such as study hours, extracurricular activities, sleep, social interactions, physical activity, and stress levels, the project aims to:

Offer actionable insights that can help students improve their academic outcomes by adjusting their daily routines.
Support educational institutions in developing programs and resources that promote healthier, more effective student lifestyles.
Demonstrate the use of SQL for comprehensive data analysis and reporting, providing a structured approach to exploring relationships between lifestyle choices and academic success.


## About Data 

| Column                  | Description                             | Data Type      |
| :---------------------- | :-------------------------------------- | :------------- |
| student_id              | Unique identifier for each student      | INT            |
| study_hours             | Number of hours spent studying per day  | DECIMAL(2, 1)  |
| extracurricular_hours   | Time spent on leisure activities per day| DECIMAL(2, 1)  |
| sleep_hours             | Average hours of sleep per night        | DECIMAL(2, 1)  |
| social_hours            | Gender of the customer making purchase  | DECIMAL(2, 1)  |
| physical_activity       | Frequency of physical activity per day  | DECIMAL(2, 1)  |
| GPA                     | GPA of a student                        | DECIMAL(10, 2) |
| stress_level            | Categorized in 3 different levels       | VARCHAR(20)    | 


## Why This Project Stands Out

1. Data-Driven Decision Making: Combines statistical analysis with real-world recommendations.
2. Scalability: The solution can be adapted to larger datasets and different educational institutions.
3. Insightful Recommendations: Provides actionable advice that is directly applicable to improving student outcomes


## Solution 

The solution, implemented in Student Lifestyle Solution.sql, consists of SQL queries designed to:

1. Descriptive Analysis:

    Summarizes key lifestyle attributes.
    Provides insights into distribution and central tendencies.

2. Correlational Analysis:

    Examines relationships between lifestyle factors and academic outcomes.
    Identifies significant predictors of academic success.

3. Clustering & Segmentation:

    Groups students based on similar lifestyle patterns.
    Enables targeted recommendations for each cluster.

4. Actionable Insights:

    Derives specific recommendations to enhance academic performance through lifestyle adjustments.


## Steps

1. Import the student_lifestyle_dataset.csv into your SQL database.
2. Execute the queries provided in Student Lifestyle Solution.sql.
3. Review the outputs and insights from the analysis.


## Business Questions To Answer

### Generic Question

1. What is the distribution of stress level among students in the provided data?
2. How many students have different types of stress level provided from the data in descending order?
3. What is the average number of study hour per day for the students?
4. What are the highest and lowest GPA of the students?
5. What is the average sleep hours of the students?

### Comparative Questions

1. How do study hours differ between students with high GPA(> 3.5) and low GPA (<= 3.5)?
2. Are students with higher physical activity levels less social hours?

### Correlational Questions

1. Is there correlation between study hours and GPA of students?
2. Is there correlation between extracurricular hours and social hours?
3. Is there correlation between physical activity hours and sleep hours?

### Segmentation Analysis

1. How many students allocate more time to socializing than studying and have low GPA?
2. How many studnets allocate less time to socializing than studing and having high GPA?
3. How many students fall into each stress level category them in descending order.
4. How many students have both stress high level as well as low GPA < 2.5?

### Grouping by GPA Range

1. How many students belong to each GPA range?
2. What is the average time allocation and round the time in 2 decimal numbers for each GPA category?

### Balanced vs Imbalanced Lifestyles

1. How many students have a "balanced lifestyle"?
2. Identify students with "imbalanced lifestyles"?
3. How many students have balanced time allocation across all activities?

### Physical Activity and Stress

1. How many students have low physical activity?
2. How many students with "Stress level" participate more than 1 hour of physical everyday?
3. Segment students based on their physical activity levels?

### Segmentation by Social Interaction

1. Group the students and count them on the basis of social hours per day?
2. Compare average GPA's of students according to social hours distribution? 

### High Performers and Low Performers

1. Segment students into "high performers" (GPA >= 3.5), "low performers" (GPA < 2.5) and "Average performers" based on their lifestyle patterns?
2. How many students are "high performers" and maintain a low stress level?

### Optimization and Recommendations

1. Which students could improve their GPA by reallocating time?
2. How can students optimize their GPA by balancing their activities?
3. What is the minimum and maximum sleep hours of a student who achive GPA > 3.5?