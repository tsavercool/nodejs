const express = require('express');

const app = express();
const PORT = process.env.PORT || 3000;

app.get('/health', (req, res) => {
    res.json({ status: 'ok' });
});

app.get('/ready', (req, res) => {
    // Readiness probe endpoint
    res.status(200).json({ ready: true });
});

app.get('/live', (req, res) => {
    // Liveness probe endpoint
    res.status(200).json({ alive: true });
});

app.listen(PORT, () => {
    console.log(`Server is running on port ${PORT}`);
});