import express, { Router } from 'express';
const app = express();
import fs from 'fs';
import path from 'path';
import { v4 as uuidv4 } from 'uuid';
import bodyParser from 'body-parser';
import stream from 'stream';
import admin from 'firebase-admin';
import axios from 'axios';
import { createPool } from 'mysql2';
const router = Router();

import { executeQuery } from '../helper/db.js'

router.post('/login', async function (req, res) {
    console.log("inside login request !!!!");

    const sql = 'call sp_login(?,?)';
    const params = [
        req.body.email,
        req.body.password,
    ];

    const result = await executeQuery(sql, params)
    console.log("result ====>", result);
    res.send(result)

})

router.post('/signup', async function (req, res) {
    console.log("inside signup request !!!!");

    const sql = 'call sp_signup(?,?,?,?,?)';
    const params = [
        req.body.name,
        req.body.email,
        req.body.phone,
        req.body.password,
        req.body.device_token
    ];

    const result = await executeQuery(sql, params)
    console.log("result ====>", result);
    res.send(result)

})


export default router;

