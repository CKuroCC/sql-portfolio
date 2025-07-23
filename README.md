# ShyftOff Operational Analytics SQL Scripts

A collection of SQL scripts designed to analyze, monitor, and improve operational performance on the ShyftOff platform. The scripts progress from initial performance monitoring to deep-dive data-quality investigations, culminating in a powerful executive dashboard.

---

## The Analytical Journey

1. **Initial Performance Monitoring**  
   The first set of scripts (`01`–`06`) established baseline metrics for agent performance, campaign health, and data quality.

2. **Discovery of Anomalies**  
   These early queries uncovered significant data anomalies—negative hour values and reliability scores over 100%.

3. **Root Cause Analysis**  
   We traced these anomalies to a flaw in metric definitions: **`actual_hrs`** and **`reliable_hrs`** could exceed **`locked_hrs`** and **`scheduled_hrs`**, making percentage-based KPIs (Fill Rate, Reliability Rate) misleading.

4. **Strategic Reporting**  
   With that insight, the final scripts (`07` and `08`) were created:
   - **Executive Dashboard**: High-level view combining fill, reliability, and data-quality scores.
   - **Deep Dive Tool**: “Smoking gun” query showing rows where reliability >100%, for data-governance discussions.

---

## Scripts & Usage

All scripts target the `so` schema in production.  

### `01_agent_performance_and_reliability.sql`
- **Purpose:** Analyze agent reliability and performance trends; identify top performers and potential issues.  
- **Status:** Relies on a non-existent `so.vmv_campaign_agent_shift_demand` table—serves as an ideal-state template.

### `02_campaign_health_monitoring.sql`
- **Purpose:** Check campaign health by finding staffing gaps and comparing reliability vs. fill rates.  
- **Status:** Second query works and delivers a high-level comparison of campaign metrics.

### `03_onboarding_and_attrition_analysis.sql`
- **Purpose:** Compute new-agent 30-day survival rates to assess onboarding effectiveness and churn.  
- **Status:** Template only—assumes a future table for survival analysis.

### `04_vpn_security_detection_helpers.sql`
- **Purpose:** Flag potentially fraudulent or non-compliant user activity via login patterns and record creation in `t_at_allpeople`.  
- **Status:** Corrected version works; identifies duplicate records and unusual activity.

### `05_automation_opportunity_finder.sql`
- **Purpose:** Find tables with many manually entered (nullable) columns as candidates for process automation.  
- **Status:** Corrected and functional; highlights high-percent-nullable tables.

### `06_data_quality_checks.sql`
- **Purpose:** Quantify data-integrity issues—negative hours, future-dated shifts, impossible reliability scores.  
- **Status:** Critical for initial discoveries; corrected version runs cleanly.

### `07_executive_dashboard_query.sql`
- **Purpose:** Capstone dashboard combining fill rates, reliability, data-quality scores, and a calculated **Campaign Health Status**.  
- **Key Logic:** Uses a CTE to aggregate raw numbers before KPI calculation, including a `campaign_health_status` flag for critical issues.

### `08_data_quality_deep_dive.sql`
- **Purpose:** Expose rows with reliability > 100%—concrete evidence of flawed metric definitions.  
- **Usage:** Present output to stakeholders to drive a data-governance discussion on metric definitions.

---

## Key Findings & Business Impact

- **Systemic Data Definition Flaw**  
  Core metrics are fundamentally broken: `actual_hrs` and `reliable_hrs` can exceed `locked_hrs` and `scheduled_hrs`, making KPIs like Fill Rate and Reliability misleading.

- **NRTC Campaign in Crisis**  
  Lowest agent reliability at **71.6%** and **1,260** data-quality incidents over 14 days render its data untrustworthy.

- **The “Healthy Campaign” Paradox**  
  The “Citizens” campaign appears ✅ “Healthy” on paper (90.1% reliability) but has the highest number of understaffed intervals—hiding a significant service-level risk.

---

## Next Step

Hold a **data governance meeting** to redefine core business metrics.  
Use the output from `08_data_quality_deep_dive.sql` as the central evidence to guide the discussion.
