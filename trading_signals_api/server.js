   // server.js
   const express = require('express');
   const app = express();
   const port = 3000;

   app.use(express.json());

   // Sample data
   let signals = [
     {
       id: 1,
       pair: 'GBP/USD',
       type: 'Short',
       currentPrice: 1.24776,
       tpPrice: 1.24000,
       slPrice: 1.25000,
       rrr: 3.44,
       date: '02/04/2025',
       setupLink: 'http://example.com/setup'
     }
   ];

   // Get all signals
   app.get('/api/signals', (req, res) => {
     res.json(signals);
   });

   // Add more endpoints as needed

   app.listen(port, () => {
     console.log(`API running at http://localhost:${port}`);
   });