import express, { json, urlencoded } from 'express';
const app = express();
app.use(json())
import mysql from 'mysql2';
import cors from 'cors';
import bodyParser from 'body-parser';
const { json: _json } = bodyParser;
app.use(cors());

app.use(json({ verify: (req, res, buf) => { req.rawBody = buf; }, limit: '50mb' }));
app.use(urlencoded({ limit: '50mb', extended: true }));


app.use(_json({ limit: '5mb' }));

import auth from './APIs/routes/auth.js';
import errorHandler from './error-handler.js';
app.use(errorHandler);

app.use('/api/auth', auth)

app.use((req, res, next) => {
    console.log(`Received ${req.method} request for ${req.url}`);
    next();
});


app.use((req, res, next) => {
    const error = new Error("Not Found");
    error.status = 404;
    next(error);
});

app.use((error, req, res, next) => {
    console.log("Not found !");
    res.status(error.status || 500);
    res.json({

        message: error.message,

    });
});

const port = 3000
app.listen(port, () => {
    console.log(`listening on port ${port}`);
})