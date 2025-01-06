import { Router } from 'express';
const router = Router();

import { executeQuery } from '../helper/db.js'
import { uploadBase64Image } from '../helper/imageUploader.js';

router.post('/createProduct', async function (req, res) {
    const sql = 'call sp_createProduct(?,?,?,?,?)';
    const params = [
        req.body.user_id,
        req.body.title,
        req.body.image,
        req.body.price,
        req.body.description
    ];

    const result = await executeQuery(sql, params)
    res.send(result)

})

router.get('/getProducts', async function (req, res) {
    const sql = 'call sp_getProducts(?)';
    const params = [
        req.query.user_id
    ];

    const result = await executeQuery(sql, params)
    res.send(result)

})


router.post('/uploadImage', async (req, res) => {
    console.log();
    const result = await uploadBase64Image(req.body.base64);
    res.send(result);
});


export default router;

