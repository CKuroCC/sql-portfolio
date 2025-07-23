# ShyftOff Operational Analytics SQL Scripts
███████╗██╗  ██╗██╗   ██╗███████╗████████╗ ██████╗ ███████╗███████╗
██╔════╝██║  ██║╚██╗ ██╔╝██╔════╝╚══██╔══╝██╔═══██╗██╔════╝██╔════╝
███████╗███████║ ╚████╔╝ █████╗     ██║   ██║   ██║█████╗  █████╗
╚════██║██╔══██║  ╚██╔╝  ██╔══╝     ██║   ██║   ██║██╔══╝  ██╔══╝
███████║██║  ██║   ██║   ██║        ██║   ╚██████╔╝██║     ██║
╚══════╝╚═╝  ╚═╝   ╚═╝   ╚═╝        ╚═╝    ╚═════╝ ╚═╝     ╚═╝

> *"In Data We Trust, In Queries We Find Truth"* - Platform Team

A collection of SQL scripts designed to analyze, monitor, and improve operational performance on the ShyftOff platform.

---

## 📊 THE ANALYTICAL JOURNEY

### 🔍 PHASE 1: DISCOVERY
Scripts 01-06 established baseline metrics, uncovering critical anomalies in our data ecosystem. The hunt for truth began here.

### 🔬 PHASE 2: INVESTIGATION  
Scripts 07-15 dove deep into the anomalies, revealing systemic flaws in metric definitions and campaign operations.

### 📈 PHASE 3: STRATEGIC INSIGHTS
Scripts 16-22 transformed raw findings into executive insights and real-time monitoring capabilities.

---

## 📁 SCRIPT MANIFEST

All scripts target the `so` schema in production database.

### Foundation Layer (01-06)

| Script | Purpose | Status |
|--------|---------|--------|
| `01_productive_definition.sql` | Agent reliability trends & top performer identification | ⚠️ Template only |
| `02_check_bigquery_tables.sql` | Verify BigQuery replication status | ✅ Operational |
| `03_report_views_lookup.sql` | Find all report views in schema | ✅ Operational |
| `04_list_campaigns.sql` | List all active campaigns | ✅ Operational |
| `05_existing_tables_in_so.sql` | Schema discovery utility | ✅ Operational |
| `06_columns_in_allpeople.sql` | t_at_allpeople structure analysis | ✅ Operational |

### Discovery Layer (07-15)

| Script | Purpose | Status |
|--------|---------|--------|
| `07_safe_name_search.sql` | Safe agent lookup by name | ✅ Operational |
| `08_recent_import_of_self.sql` | Self-identification utility | ✅ Operational |
| `09_email_search_self.sql` | Email-based agent lookup | ✅ Operational |
| `10_columns_vrpt_demand2.sql` | Schema discovery for key view | ✅ Development tool |
| `11_today_locks.sql` | Current day lock extraction | ✅ Daily operations |
| `12_tomorrow_locks.sql` | Next-day lock pre-fetch | ✅ Automation enabler |
| `13_gsheets_nrtc_format.sql` | Google Sheets export format | ✅ NRTC-specific |
| `14_lock_anomaly_analysis.sql` | Statistical pattern analysis | ✅ Pattern detection |
| `15_Find specific_shift_intervals_with >100%_reliability.sql` | Data quality evidence | ✅ Critical finding |

### Strategic Layer (16-22)

| Script | Purpose | Status |
|--------|---------|--------|
| `16_Executive_Dashboard.sql` | C-suite ready metrics | ✅ Weekly exec meetings |
| `17_VPN_Detection.sql` | Security pattern analysis | ✅ Security monitoring |
| `18_real_time_monitor.sql` | Live performance tracking | ✅ Operations dashboard |
| `19_predictable_values.sql` | Automation opportunity finder | ✅ Process improvement |
| `20_agent_insights.sql` | Deep behavior analysis | 🔧 In development |
| `21_nrtc_microscope.sql` | NRTC forensic analysis | ✅ Crisis response |
| `22_negative_hours.sql` | Data anomaly investigation | ✅ Quality control |

---

## 🚨 KEY FINDINGS & BUSINESS IMPACT

### CRITICAL: Systemic Data Definition Flaw
- **Problem**: `actual_hrs` can exceed `locked_hrs`; `reliable_hrs` can exceed `scheduled_hrs`
- **Impact**: Fill Rate & Reliability KPIs are MEANINGLESS
- **Action**: Immediate metric redefinition required

### NRTC Campaign in Crisis
- **Reliability**: 71.6% (lowest across all campaigns)
- **Data Quality Incidents**: 1,260 over 14 days
- **Recommendation**: IMMEDIATE intervention required

### The "Healthy Campaign" Paradox
- **Surface**: Citizens shows ✅ "Healthy" (90.1% reliability)
- **Reality**: Highest understaffed interval count
- **Risk**: Service failures masked by flawed metrics

---

## 🛠️ USAGE GUIDE

### Daily Operations
Morning:  Run scripts 11, 18 for current state
Midday:   Check script 16 for executive dashboard
Evening:  Run script 12 to prep next day's locks

### Weekly Analysis
Monday:    Scripts 14, 15 for anomaly review
Wednesday: Script 19 for automation opportunities
Friday:    Scripts 7, 8 for executive report prep

### Crisis Response
Campaign Issues: Scripts 21 (NRTC), 22 (negative hours)
Security Alerts: Script 17 (VPN detection)
Data Quality:    Scripts 6, 8, 15

---

## 📋 NEXT STEPS

1. **DATA GOVERNANCE MEETING** (URGENT)
   - Present script 08 output as evidence
   
2. **METRIC REDEFINITION PROJECT**
   - Redefine actual_hrs, reliable_hrs, locked_hrs relationships
   
3. **NRTC INTERVENTION**
   - Use script 21 findings to drive immediate improvements

4. **AUTOMATION ROLLOUT**
   - Implement Google Sheets integration using scripts 11-13

---

### Scripts Directory

📂 scripts/
├── 📂 scripts/
│   └── 📄 google_sheets_lock_update.js
└── 📂 sql_scripts/
├── 📄 01_productive_definition.sql
├── 📄 02_check_bigquery_tables.sql
├── 📄 03_report_views_lookup.sql
└── ... (22 total SQL scripts)

---

*"Data doesn't lie, but metrics can deceive"*

**[EOF]**