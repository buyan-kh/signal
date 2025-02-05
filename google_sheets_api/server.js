const express = require('express');
const { google } = require('googleapis');
const app = express();
const port = 3000;

const sheets = google.sheets('v4');
const apiKey = 'YOUR_API_KEY'; // Replace with your API key
const spreadsheetId = 'YOUR_SPREADSHEET_ID'; // Replace with your spreadsheet ID

app.get('/api/trades', async (req, res) => {
  try {
    const response = await sheets.spreadsheets.values.get({
      spreadsheetId,
      range: 'Sheet1!A1:E10', // Adjust the range as needed
      key: apiKey,
    });

    const rows = response.data.values;
    if (rows.length) {
      res.json(rows);
    } else {
      res.status(404).send('No data found.');
    }
  } catch (err) {
    res.status(500).send(err.toString());
  }
});

app.listen(port, () => {
  console.log(`API running on port ${port}`);
});