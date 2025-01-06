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
    const sql = 'call sp_login(?,?)';
    const params = [
        req.body.email,
        req.body.password,
    ];

    const result = await executeQuery(sql, params)
    res.send(result)

})

router.post('/signup', async function (req, res) {
    const sql = 'call sp_signup(?,?,?,?,?)';
    const params = [
        req.body.name,
        req.body.email,
        req.body.phone,
        req.body.password,
        req.body.device_token
    ];

    const result = await executeQuery(sql, params)
    res.send(result)

})

router.post('/updateDeviceToken', async function (req, res) {
    const sql = 'call sp_updateDeviceToken(?,?)';
    const params = [
        req.body.user_id,
        req.body.device_token
    ];

    const result = await executeQuery(sql, params)
    res.send(result)

})

export default router;

