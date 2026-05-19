# sql-portfolio

> ◈ **Real-world SQL portfolio.** Analytical scripts built during platform-operations work — discovery, investigation, strategic insights.

A collection of 22 PostgreSQL scripts (plus a Google Sheets integration) that walk through a real analytical workflow on a real operations data warehouse: figuring out what's there, finding what's wrong, and turning the findings into operational tooling.

Built during my time as Platform Coordinator at ShyftOff (public with their authorization).

---

## ▍ THE THREE PHASES

The scripts are organized around a deliberate workflow, not by topic:

### Phase 1 — Discovery (`01_` – `06_`)
Get oriented. Find the tables. Confirm replication is working. Understand the schema. Boring but mandatory.

- `01_productive_definition.sql` — agent reliability trends
- `02_check_bigquery_tables.sql` — BigQuery replication verification
- `03_report_views_lookup.sql` — report view discovery
- `04_list_campaigns.sql` — active campaign listing
- `05_existing_tables_in_so.sql` — schema discovery
- `06_columns_in_allpeople.sql` — table structure analysis

### Phase 2 — Investigation (`07_` – `15_`)
Dig into anomalies. Test definitions against reality. This is the phase where the KPI assumptions started breaking.

- `07_safe_name_search.sql` — safe agent lookup
- `08_recent_import_of_self.sql` / `09_email_search_self.sql` — self-identification
- `10_columns_vrpt_demand2.sql` — view schema analysis
- `11_today_locks.sql` / `12_tomorrow_locks.sql` — current and next-day lock state
- `13_gsheets_nrtc_format.sql` — Google Sheets export formatting
- `14_lock_anomaly_analysis.sql` — statistical pattern detection
- `15_Find specific_shift_intervals_with >100%_reliability.sql` — data-quality sanity check that uncovered impossible metric values

### Phase 3 — Strategic Insights (`16_` – `22_`)
Turn the investigation into operational tooling. Dashboards, monitors, automation.

- `16_Executive_Dashboard.sql` — leadership-facing metrics
- `17_VPN_Detection.sql` — access-pattern security check
- `18_real_time_monitor.sql` — live performance tracking
- `19_predictable_values.sql` — automation candidates
- `20_agent_insights.sql` — behavior analysis
- `21_nrtc_microscope.sql` — deep-dive forensics for one specific campaign
- `22_negative_hours.sql` — impossible-value investigation

---

## ▍ WHAT THIS SHOWS

- **End-to-end analytical thinking** — discovery → investigation → strategic delivery, not just one-off queries.
- **Real data-quality work** — Script `15_` uncovered shifts with >100% reliability, which led to revisiting how the company defined its core KPIs. Script `22_` chased negative hours. Script `14_` did statistical anomaly detection over lock data.
- **Operational tooling** — Real-time monitors, executive dashboards, automated daily Google-Sheets exports (`scripts/scripts/google_sheets_lock_update.js`).
- **Range** — From single-line schema-discovery queries to multi-CTE dashboards spanning 2.5KB+ of SQL.

---

## ▍ REUSING THESE PATTERNS

The SQL targets a PostgreSQL schema named `so` (ShyftOff). To reuse:

- Replace `so.*` references with your own schema.
- Substitute column names (`actual_hrs`, `locked_hrs`, `reliable_hrs`, `scheduled_hrs`) with the equivalents in your model.
- The Phase-1 discovery scripts work mostly unchanged on any PostgreSQL warehouse.
- The Phase-2 investigation patterns (anomaly detection, impossible-value checks) are domain-agnostic.

---

## ▍ ABOUT

Author: **Julian Waits II** ([@CKuroCC](https://github.com/CKuroCC) · `kuroninja@ckuro.cc` · [ckuro.cc](https://ckuro.cc))
License: [MIT](./LICENSE)
