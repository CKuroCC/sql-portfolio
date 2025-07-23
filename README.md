# ShyftOff Operational Analytics SQL Scripts

```
███████╗██╗ ██╗██╗   ██╗███████╗████████╗ ██████╗ ███████╗███████╗
██╔════╝██║ ██║╚██╗ ██╔╝██╔════╝╚══██╔══╝██╔═══██╗██╔════╝██╔════╝
███████╗███████║╚████╔╝ █████╗     ██║   ██║   ██║█████╗  █████╗  
╚════██║██╔══██║ ╚██╔╝  ██╔══╝     ██║   ██║   ██║██╔══╝  ██╔══╝  
███████║██║  ██║  ██║   ██║        ██║   ╚██████╔╝██║     ██║     
╚══════╝╚═╝  ╚═╝  ╚═╝   ╚═╝        ╚═╝    ╚═════╝ ╚═╝     ╚═╝     

    "In Data We Trust, In Queries We Find Truth" - Platform Team
```

[![Build Status](https://img.shields.io/badge/build-passing-brightgreen.svg)](https://github.com/ShyftOff/operational-analytics)
[![SQL](https://img.shields.io/badge/SQL-PostgreSQL-336791.svg)](https://www.postgresql.org/)
[![License](https://img.shields.io/badge/license-MIT-blue.svg)](LICENSE.md)
[![Maintenance](https://img.shields.io/badge/Maintained%3F-yes-green.svg)](https://github.com/ShyftOff/operational-analytics/graphs/commit-activity)

## Description

A comprehensive collection of SQL scripts designed to analyze, monitor, and improve operational performance on the ShyftOff platform.

This repository serves as the analytical backbone for ShyftOff's platform operations, housing 22 meticulously crafted SQL scripts that journey from basic discovery to strategic insights. What started as simple queries to understand our data landscape evolved into a forensic investigation that uncovered critical flaws in our metric definitions, ultimately reshaping how we measure platform performance. These scripts don't just query data—they tell the story of our platform's health, reveal hidden anomalies, and provide the foundation for data-driven decision making across the organization.

## Table of Contents

- [Motivation](#motivation)
- [Features](#features)
- [Tech Stack](#tech-stack)
- [Repository Overview](#repository-overview)
- [Prerequisites](#prerequisites)
- [Installation](#installation)
- [Usage](#usage)
- [Contributing](#contributing)
- [License](#license)
- [Acknowledgements](#acknowledgements)
- [Dynamic Content](#dynamic-content)

## Motivation

Born from the Platform Team's need to understand the true state of our operational metrics, this repository represents our analytical journey from confusion to clarity. What began as routine reporting scripts evolved into a critical investigation when we discovered that our fundamental KPIs—Fill Rate and Reliability—were built on flawed data definitions. The scripts in this repository document our detective work: uncovering that `actual_hrs` can exceed `locked_hrs`, that `reliable_hrs` can surpass `scheduled_hrs`, and that our "Healthy" campaigns might be masking serious service failures. This isn't just a collection of queries—it's our operational truth-seeking toolkit.

## Features

- **📊 Comprehensive Metric Analysis**: 22 scripts covering everything from basic table discovery to executive dashboards
- **🔍 Anomaly Detection**: Automated identification of data quality issues and impossible metric values
- **📈 Real-time Monitoring**: Live performance tracking capabilities for operational dashboards
- **🚨 Crisis Response Tools**: Specialized scripts for rapid diagnosis during campaign emergencies
- **📋 Executive Reporting**: C-suite ready visualizations and insights
- **🔐 Security Monitoring**: VPN detection and access pattern analysis
- **🤖 Automation Support**: Google Sheets integration for streamlined daily operations
- **🎯 Campaign-Specific Analysis**: Deep-dive tools for troubled campaigns (especially NRTC)

## Tech Stack

**Core Technologies:**
- **SQL (PostgreSQL)**: Primary query language targeting the `so` schema
- **Git**: Version control for script evolution tracking
- **GitHub**: Collaboration and code review platform
- **Visual Studio Code**: Development environment

**Integration Points:**
- **BigQuery**: Data replication verification
- **Google Sheets**: Automated report generation
- **JavaScript**: Supporting scripts for Google Sheets integration

## Repository Overview

<details>
<summary>Click to view the repository structure</summary>

```
.
├── README.md
├── scripts
│   └── scripts
│       └── google_sheets_lock_update.js    # Google Sheets automation
└── sql_scripts
    ├── 01_productive_definition.sql         # Agent reliability trends
    ├── 02_check_bigquery_tables.sql        # BigQuery replication status
    ├── 03_report_views_lookup.sql          # Report view discovery
    ├── 04_list_campaigns.sql               # Active campaign listing
    ├── 05_existing_tables_in_so.sql        # Schema discovery
    ├── 06_columns_in_allpeople.sql         # Table structure analysis
    ├── 07_safe_name_search.sql             # Safe agent lookup
    ├── 08_recent_import_of_self.sql        # Self-identification
    ├── 09_email_search_self.sql            # Email-based lookup
    ├── 10_columns_vrpt_demand2.sql         # View schema discovery
    ├── 11_today_locks.sql                  # Current day locks
    ├── 12_tomorrow_locks.sql               # Next-day lock pre-fetch
    ├── 13_gsheets_nrtc_format.sql          # Google Sheets export
    ├── 14_lock_anomaly_analysis.sql        # Statistical patterns
    ├── 15_Find specific_shift_intervals_with >100%_reliability.sql  # Data quality
    ├── 16_Executive_Dashboard.sql          # C-suite metrics
    ├── 17_VPN_Detection.sql                # Security patterns
    ├── 18_real_time_monitor.sql            # Live tracking
    ├── 19_predictable_values.sql           # Automation opportunities
    ├── 20_agent_insights.sql               # Behavior analysis
    ├── 21_nrtc_microscope.sql              # NRTC forensics
    └── 22_negative_hours.sql               # Anomaly investigation
```

</details>

## Prerequisites

Before using these scripts, ensure you have:

- **Database Access**: Read permissions on the ShyftOff production database (`so` schema)
- **PostgreSQL Client**: Version 12.0 or higher recommended
- **SQL Knowledge**: Intermediate level for script execution, advanced for modifications
- **Google Sheets API** (optional): For automated report generation features
- **Node.js** (optional): For running the Google Sheets integration script

## Installation

<details>
<summary>Click for detailed installation steps</summary>

1. **Clone the repository**
   ```bash
   git clone https://github.com/ShyftOff/operational-analytics.git
   cd operational-analytics
   ```

2. **Set up database connection**
   ```bash
   # Create a .env file for your database credentials (DO NOT COMMIT)
   echo "DB_HOST=your-host" >> .env
   echo "DB_USER=your-username" >> .env
   echo "DB_PASS=your-password" >> .env
   echo "DB_NAME=shyftoff_production" >> .env
   echo "DB_SCHEMA=so" >> .env
   ```

3. **Install dependencies for Google Sheets integration** (optional)
   ```bash
   cd scripts/scripts
   npm install googleapis
   ```

4. **Configure Google Sheets API** (optional)
   - Follow [Google's quickstart guide](https://developers.google.com/sheets/api/quickstart)
   - Place your `credentials.json` in the scripts directory
   - Run the authentication flow

5. **Verify installation**
   ```bash
   # Test database connection with a simple query
   psql -h $DB_HOST -U $DB_USER -d $DB_NAME -c "SELECT 1;"
   ```

</details>

## Usage

### 🔍 The Analytical Journey

Our scripts follow a three-phase approach to operational analysis:

#### **PHASE 1: DISCOVERY** (Scripts 01-06)
Start here to understand your data landscape:
```sql
-- Example: Check BigQuery replication status
\i sql_scripts/02_check_bigquery_tables.sql

-- Example: Discover all tables in schema
\i sql_scripts/05_existing_tables_in_so.sql
```

#### **PHASE 2: INVESTIGATION** (Scripts 07-15)
Deep dive into anomalies and patterns:
```sql
-- Example: Find shifts with >100% reliability (data quality check)
\i sql_scripts/15_Find specific_shift_intervals_with >100%_reliability.sql

-- Example: Analyze lock anomalies
\i sql_scripts/14_lock_anomaly_analysis.sql
```

#### **PHASE 3: STRATEGIC INSIGHTS** (Scripts 16-22)
Transform findings into actionable intelligence:
```sql
-- Example: Generate executive dashboard
\i sql_scripts/16_Executive_Dashboard.sql

-- Example: Real-time monitoring
\i sql_scripts/18_real_time_monitor.sql
```

### 📅 Daily Operations Workflow

<details>
<summary>Click for daily operations guide</summary>

**Morning (8:00 AM)**
```bash
# Check current day locks
psql -f sql_scripts/11_today_locks.sql

# Launch real-time monitor
psql -f sql_scripts/18_real_time_monitor.sql
```

**Midday (12:00 PM)**
```bash
# Update executive dashboard
psql -f sql_scripts/16_Executive_Dashboard.sql

# Check for anomalies
psql -f sql_scripts/14_lock_anomaly_analysis.sql
```

**Evening (5:00 PM)**
```bash
# Pre-fetch tomorrow's locks
psql -f sql_scripts/12_tomorrow_locks.sql

# Run Google Sheets update
node scripts/scripts/google_sheets_lock_update.js
```

</details>

### 🚨 Crisis Response Playbook

When campaigns show signs of distress:

1. **NRTC Campaign Issues**
   ```bash
   psql -f sql_scripts/21_nrtc_microscope.sql > nrtc_analysis.txt
   ```

2. **Data Quality Emergencies**
   ```bash
   psql -f sql_scripts/22_negative_hours.sql
   psql -f sql_scripts/15_Find specific_shift_intervals_with >100%_reliability.sql
   ```

3. **Security Concerns**
   ```bash
   psql -f sql_scripts/17_VPN_Detection.sql
   ```

![Demo of Real-time Monitoring Dashboard](./assets/demo.gif)

## Contributing

We welcome contributions from the ShyftOff team! Here's how to help:

1. **Fork the repository**
2. **Create a feature branch** (`git checkout -b feature/amazing-query`)
3. **Commit your changes** (`git commit -m 'Add new reliability analysis'`)
4. **Push to the branch** (`git push origin feature/amazing-query`)
5. **Open a Pull Request**

### Contribution Guidelines

- **Naming Convention**: Follow the `XX_description.sql` pattern
- **Documentation**: Include clear comments explaining complex queries
- **Testing**: Validate queries against production data (read-only!)
- **Performance**: Ensure queries complete within reasonable time (<5 minutes)

## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details.

## Acknowledgements

- **Platform Team**: For initiating this analytical journey
- **Data Engineering**: For maintaining the `so` schema
- **Executive Leadership**: For supporting data-driven decision making
- **NRTC Campaign Team**: For their patience during our investigations

Special thanks to everyone who contributed to uncovering the metric definition flaws that led to meaningful platform improvements.

## Dynamic Content

### GitHub Stats

<!-- ![GitHub Stats](https://github-readme-stats.vercel.app/api?username=ShyftOff&show_icons=true&theme=radical) -->

### Recent Activity

<!--START_SECTION:activity-->
<!--END_SECTION:activity-->

---

*"Data doesn't lie, but metrics can deceive" - ShyftOff Platform Team*
