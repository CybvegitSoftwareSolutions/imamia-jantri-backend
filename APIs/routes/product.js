import { Router } from 'express';
const router = Router();
import { executeQuery } from '../helper/db.js'
import { uploadBase64Image } from '../helper/imageUploader.js';
import axios from 'axios';
import { v4 as uuidv4 } from 'uuid';
import path from 'path';
import fs from 'fs';


function getDirectDownloadLink(shareableLink) {
    const match = shareableLink.match(/\/d\/(.*?)\//);
    if (match && match[1]) {
        const fileId = match[1];
        return `https://drive.google.com/uc?export=download&id=${fileId}`;
    }
    throw new Error("Invalid Google Drive link");
}

async function downloadPDFFile(url, savePath) {
    const response = await axios({
        url,
        method: 'GET',
        responseType: 'stream'
    });

    // Create a unique filename
    const filename = `${uuidv4()}.pdf`;
    const filePath = path.join(savePath, filename);

    // Create a writable stream to save the file
    const writer = fs.createWriteStream(filePath);

    // Pipe the response stream to the file writer
    response.data.pipe(writer);

    // Return a promise that resolves when the file is fully downloaded
    return new Promise((resolve, reject) => {
        writer.on('finish', () => resolve(filePath)); // Resolve with the file path
        writer.on('error', reject);
    });
}

router.post('/createPDF', async function (req, res) {

    const savePath = '../../images';
    try {
        // Step 1: Convert shareable link to direct download link
        const directDownloadLink = getDirectDownloadLink(req.body.url);

        // Step 2: Download the PDF
        const filePath = await downloadPDFFile(directDownloadLink, savePath);
        console.log('File downloaded successfully:', filePath);

        // Step 3: Generate public URL
        const publicUrl = `http://194.233.69.219/images//${path.basename(filePath)}`;
        console.log('Public URL:', publicUrl);

        // Step 4: Save the document info to the database
        const sql = 'call sp_upsertDocument(?,?,?,?)';
        const params = [
            req.body.name,
            req.body.image,
            req.body.year,
            publicUrl
        ];

        const result = await executeQuery(sql, params);
        res.send(result);
    } catch (error) {
        console.error('Error:', error);
        res.status(500).send('Error processing request');
    }
});

router.get('/getAllDocuments', async function (req, res) {

    const sql = 'call sp_getAllDocuments()';

    const result = await executeQuery(sql, []);
    res.send(result);
});

router.post('/uploadImage', async (req, res) => {
    const result = await uploadBase64Image(req.body.base64);
    res.send(result);
});

router.post('/createCalendarDate', async function (req, res) {

    const sql = 'call sp_upsertEvent(?,?,?)';

    const result = await executeQuery(sql, [
        req.body.date,
        req.body.english,
        req.body.urdu
    ]);
    res.send(result);
});

router.get('/getAllCalendarDates', async function (req, res) {

    const sql = 'call sp_getAllCalendarRecords()';

    const result = await executeQuery(sql, []);
    res.send(result);
});



export default router;

