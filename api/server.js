const express = require('express');
const app = express();
const port = 3000;

app.get('/signal', (req, res) => {
  res.json({
    pair: 'GBP / USD',
    action: 'Short',
    entry: 1.24776,
    tp: 1.24000,
    sl: 1.25000,
    rrr: 3.44,
    lastUpdate: '02/04/2025'
  });
});

app.listen(port, () => {
  console.log(`API listening at http://localhost:${port}`);
}); 