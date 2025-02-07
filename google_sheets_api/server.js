const express = require('express');
const { google } = require('googleapis');
const app = express();
const port = 3000;

const sheets = google.sheets('v4');
const apiKey = ''; 
const spreadsheetId = ''; 

app.get('/api/trades', async (req, res) => {
  try {
    const response = await sheets.spreadsheets.values.get({
      spreadsheetId,
      range: 'Sheet1!A2:I', 
      key: apiKey,
    });

    const rows = response.data.values;
    const trades = rows.map(row => ({
      id: row[0],
      pair: row[1],
      type: row[2],
      entry: row[3],
      tp: row[4],
      sl: row[5],
      rrr: row[6],
      link: row[7],
      result: row[8],
    }));
    console.log(trades);
    res.json(trades);
  } catch (err) {
    res.status(500).send(err.toString());
  }
});

app.listen(port, () => {
  console.log(`API running at http://localhost:${port}`);
});