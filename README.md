
# SQL Scripts for ShyftOff Reporting and Automation

This private repository contains SQL queries and one Google Apps Script designed for querying ShyftOff's PostgreSQL-based data warehouse. These queries help explore productivity, analyze locking patterns, and automate report generation for campaigns such as NRTC, Citizens, and others.

## 📁 Repository Structure

```
.
├── README.md                  # Documentation for this repo
├── sql_scripts/               # Folder containing SQL files
│   ├── 01_productive_definition.sql
│   ├── 02_check_bigquery_tables.sql
│   ├── 03_report_views_lookup.sql
│   └── ... etc.
└── scripts/
    └── google_sheets_lock_update.js  # Apps Script for automating Google Sheets
```

## 🧠 SQL Query Summary

| #  | Query Name | Description |
|----|------------|-------------|
| 1  | Explore the productivity definition | Shows columns and types in `vmv_productive_cas`. |
| 2  | Check what BigQuery tables are replicated | Lists all tables in `bq.t_table_definitions`. |
| 3  | Find all the report views (vrpt_*) | Finds tables starting with `vrpt_` in `so` schema. |
| 4  | List 10 campaigns | Returns 10 rows from `so.t_campaign`. |
| 5  | List base tables in 'so' schema | Lists base tables in schema `so`. |
| 6  | Check columns in `t_at_allpeople` | Lists columns and types from `so.t_at_allpeople`. |
| 7  | Safe limited name search | Searches for `Julian Waits` with limit 5. |
| 8  | Search by name (ImportTS window) | Finds entries in last 7 days by `ImportTS`. |
| 9  | Search by email | Locates records with matching email in 7-day window. |
| 10 | Columns in `vrpt_campaign_shift_demand2` | Lists schema for that report view. |
| 11 | Today's lock counts | Gets today’s lock counts by campaign and interval. |
| 12 | Tomorrow's lock schedule | Query to prep upcoming shift sheet entries. |
| 13 | Google Sheets-ready format | Data formatted for daily Google Sheets input. |
| 14 | Lock pattern analytics | Averages/min/max grouped by campaign, time, day. |

---

## 📜 JavaScript Script

| File | Description |
|------|-------------|
| `scripts/google_sheets_lock_update.js` | Google Apps Script using JDBC to pull data into Google Sheets automatically using campaign-level filters. Includes SSL-based connection and formatting. |

## 🔐 Notes

- All scripts here are intended for **internal use only**.
- No secrets or passwords should be stored in SQL files. Use placeholders or environment variables where needed.
- The JavaScript contains credentials temporarily for testing – ensure they are secured or moved to secret managers for production use.

## 🛠️ Future Improvements

- Add parameterized versions of SQL queries.
- Use `.env` or secret store for sensitive connection details.
- Integrate with GitHub Actions or scripting layer to execute queries programmatically.

---

© C-Kuro / Julian Waits II – This is a private repo for internal SQL automation and analysis. Not for redistribution.