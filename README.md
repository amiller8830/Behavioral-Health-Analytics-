# Behavioral Health Appointment Analytics

**A business intelligence portfolio case study exploring appointment attendance, clinician scheduling patterns, and telehealth utilization using synthetic behavioral health data.**

[**Open the interactive dashboard**](https://amiller8830.github.io/Behavioral-Health-Analytics-/behavioral_health_dashboard.html)· [Explore sample data](behavioral_health_appointments_synthetic.csv)

> **Portfolio note:** This is an independently presented **learning project built with AI assistance**. All 300 appointment records are fictional; no real patient or protected health information is used. This project is not affiliated with a healthcare provider or TherapyNotes.

## Business question

How can a behavioral health practice use appointment-level data to identify scheduling friction, understand attendance patterns, and prioritize operational follow-up?

## Dashboard preview

The interactive HTML dashboard summarizes scheduling performance and lets viewers filter results by **telehealth versus in-person appointments**. Download `behavioral_health_dashboard.html` and open it in a modern browser to interact with the visualization. The dashboard is a standalone HTML implementation, **not a Power BI or Tableau report**.

## Results at a glance

| Metric | Result |
| --- | ---: |
| Scheduled appointments | 300 |
| Completed appointments | 231 (77.0%) |
| Cancelled appointments | 44 (14.7%) |
| No-shows | 25 (8.3%) |
| In-person no-show rate | 16 of 163 (9.8%) |
| Telehealth no-show rate | 9 of 137 (6.6%) |
| Highest clinician completion rate in sample | C04: 87.5% (49 of 56) |

### Observations

1. **Most appointments were completed.** The 77.0% completion rate provides a baseline for exploring scheduling performance.
2. **The sample shows different no-show rates by visit mode.** In-person appointments had a 9.8% no-show rate versus 6.6% for telehealth. This difference is descriptive, not evidence that visit mode causes attendance differences.
3. **Clinician-level completion rates varied.** This may prompt follow-up questions about appointment mix, scheduling, and sample sizes; it should not be interpreted as a clinician performance ranking.

## Data and methodology

- **Source:** Synthetic, fictional appointment records created for this project.
- **Size:** 300 rows, eight fields; dates range from January through June 2026.
- **Fields:** `appointment_id`, `appointment_date`, `clinician_id`, `service_type`, `appointment_status`, `completed_minutes`, `visit_mode`, `patient_type`.
- **Measures:** Completion rate = completed appointments / all scheduled appointments; no-show rate = no-shows / all scheduled appointments.
- **Analysis:** Five SQLite-compatible queries aggregate counts, clinician completion rates, visit-mode no-show rates, new versus returning patient no-shows, and monthly activity.
- **Visualization:** A self-contained HTML dashboard with JavaScript-powered filters and charts.

## Repository files

| File | Purpose |
| --- | --- |
| [`behavioral_health_appointments_synthetic.csv`](behavioral_health_appointments_synthetic.csv) | Fictional source data |
| [`behavioral_health_analysis.sql`](behavioral_health_analysis.sql) | Five SQL queries for appointment reporting |
| [`behavioral_health_dashboard.html`](behavioral_health_dashboard.html) | Standalone interactive dashboard |
| `README.md` | Project description, methodology, and findings |

## Run the analysis yourself

1. Download the CSV and import it into a SQLite database as a table named `appointments`. Use the CSV headers as column names.
2. Open [`behavioral_health_analysis.sql`](behavioral_health_analysis.sql) in a SQLite query tool and execute each query.
3. Download [`behavioral_health_dashboard.html`](behavioral_health_dashboard.html) and open it locally in your browser; change the **Visit mode** filter to explore the data.

**Note:** The dashboard includes its sample records internally, so it runs without a web server and does not read the CSV dynamically. If the CSV is changed, the dashboard will not update automatically.

## Limitations and next steps

- Synthetic data is useful for demonstrating a workflow but is not evidence of real-world healthcare trends.
- There are no patient identifiers, demographic attributes, diagnostic data, or clinical outcomes.
- Rates do not account for case mix, scheduling policies, or other potential confounders.
- Next steps for continued skill development: independently reproduce the queries in SQLite, document findings, rebuild the dashboard in Power BI, and connect the visuals to a refreshable dataset.

---

**Focus areas:** Behavioral health operations · Business intelligence · SQL (SQLite) · Data visualization · KPI reporting
