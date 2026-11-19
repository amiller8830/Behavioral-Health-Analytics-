-- Behavioral Health Appointment Analytics
-- Portfolio learning project | Synthetic appointment data
-- SQL dialect: SQLite
-- Import behavioral_health_appointments_synthetic.csv as a table named appointments.
-- All records are fictional. Appointment status is not a measure of clinical outcome.

-- 1. How many appointments occurred in each status?
SELECT appointment_status, COUNT(*) AS appointment_count,
       ROUND(100.0 * COUNT(*) / (SELECT COUNT(*) FROM appointments), 1) AS percentage
FROM appointments
GROUP BY appointment_status
ORDER BY appointment_count DESC;

-- 2. Which clinicians have the highest completion rates?
SELECT clinician_id, COUNT(*) AS scheduled_appointments,
       SUM(CASE WHEN appointment_status = 'Completed' THEN 1 ELSE 0 END) AS completed_appointments,
       ROUND(100.0 * SUM(CASE WHEN appointment_status = 'Completed' THEN 1 ELSE 0 END) / COUNT(*), 1) AS completion_rate_pct
FROM appointments
GROUP BY clinician_id
ORDER BY completion_rate_pct DESC;

-- 3. How do appointment outcomes differ by visit mode?
SELECT visit_mode, COUNT(*) AS scheduled_appointments,
       SUM(CASE WHEN appointment_status = 'No-Show' THEN 1 ELSE 0 END) AS no_shows,
       ROUND(100.0 * SUM(CASE WHEN appointment_status = 'No-Show' THEN 1 ELSE 0 END) / COUNT(*), 1) AS no_show_rate_pct
FROM appointments
GROUP BY visit_mode
ORDER BY no_show_rate_pct DESC;

-- 4. Are new or returning patients more likely to miss appointments?
SELECT patient_type, COUNT(*) AS scheduled_appointments,
       SUM(CASE WHEN appointment_status = 'No-Show' THEN 1 ELSE 0 END) AS no_shows,
       ROUND(100.0 * SUM(CASE WHEN appointment_status = 'No-Show' THEN 1 ELSE 0 END) / COUNT(*), 1) AS no_show_rate_pct
FROM appointments
GROUP BY patient_type
ORDER BY no_show_rate_pct DESC;

-- 5. Monthly appointment volume and completion rate
SELECT SUBSTR(appointment_date, 1, 7) AS appointment_month,
       COUNT(*) AS scheduled_appointments,
       SUM(CASE WHEN appointment_status = 'Completed' THEN 1 ELSE 0 END) AS completed_appointments,
       ROUND(100.0 * SUM(CASE WHEN appointment_status = 'Completed' THEN 1 ELSE 0 END) / COUNT(*), 1) AS completion_rate_pct
FROM appointments
GROUP BY SUBSTR(appointment_date, 1, 7)
ORDER BY appointment_month;
