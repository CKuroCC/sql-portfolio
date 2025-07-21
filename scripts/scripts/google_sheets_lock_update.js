// --- CONFIGURATION ---
const SHEET_NAME = 'NRTC Report';
const CAMPAIGN_NAME = 'NRTC';

const DB_HOST = 'shyftoff-atc-dw-rr.ceqivmk0kdii.us-east-1.rds.amazonaws.com';
const DB_PORT = 5432;
const DB_NAME = 'shyftoff';
const DB_USER = 'SOWeb';
const DB_PASS = 'B8QZsjPSJ9AqXxr';

// --- MAIN FUNCTION ---
function updateLockData() {
  const dbUrl = `jdbc:google:postgresql://${DB_HOST}:${DB_PORT}/${DB_NAME}?ssl=true&sslmode=require`;

  const sqlQuery = `
    SELECT
        campaign_nm AS "Campaign",
        TO_CHAR(shift_start, 'MM/DD/YYYY') AS "Date",
        TO_CHAR(shift_start, 'HH:MI AM') AS "Time-Frame",
        locked_hrs AS "Lock",
        '' AS "Actual",
        '' AS "Percentage"
    FROM
        so.vrpt_campaign_shift_demand2
    WHERE
        shift_start::date = CURRENT_DATE
        AND campaign_nm = '${CAMPAIGN_NAME}'
    ORDER BY
        shift_start;
  `;

  var connection;
  try {
    Logger.log('Connecting to database with URL: ' + dbUrl);
    connection = Jdbc.getConnection(dbUrl, DB_USER, DB_PASS);
    Logger.log('Connection successful.');

    const statement = connection.createStatement();
    const results = statement.executeQuery(sqlQuery);
    const data = [];
    const columnCount = results.getMetaData().getColumnCount();
    const headers = [];
    for (let i = 1; i <= columnCount; i++) {
      headers.push(results.getMetaData().getColumnLabel(i));
    }
    data.push(headers);
    while (results.next()) {
      const row = [];
      for (let i = 1; i <= columnCount; i++) {
        row.push(results.getString(i));
      }
      data.push(row);
    }

    if (data.length > 1) {
      const sheet = SpreadsheetApp.getActiveSpreadsheet().getSheetByName(SHEET_NAME);
      sheet.clear();
      sheet.getRange(1, 1, data.length, data[0].length).setValues(data);
      Logger.log('Data successfully written to sheet: ' + SHEET_NAME);
    } else {
      Logger.log('No data found for campaign: ' + CAMPAIGN_NAME);
    }
  } catch (err) {
    Logger.log('ERROR: ' + err.message);
  } finally {
    if (connection) {
      connection.close();
      Logger.log('Connection closed.');
    }
  }
}
