import fs from 'fs';
import path from 'path';
import { v4 as uuidv4 } from 'uuid';
import stream from 'stream';
import { successResponse, errorResponse } from '../helper/response.js';

/**
 * Uploads a base64 image to the specified directory.
 * @param {string} base64Image - The base64 encoded image string.
 * @returns {Promise<Object>} - A formatted response using successResponse or errorResponse.
 */


export async function uploadBase64Image(base64Image) {
    try {
        const imageBuffer = Buffer.from(base64Image, 'base64');
        const imageName = `${uuidv4()}.png`;

        // Specify the full path including the file name
        const savePath = '../../images';
        const imagePath = path.join(savePath, imageName);

        // Check if the directory exists, create it if it doesn't
        if (!fs.existsSync(savePath)) {
            fs.mkdirSync(savePath, { recursive: true });
        }

        // Use a writable stream to write the image data
        const writeStream = fs.createWriteStream(imagePath);
        const bufferStream = new stream.PassThrough();
        bufferStream.end(imageBuffer);
        bufferStream.pipe(writeStream);

        // Return a Promise that resolves on stream completion
        return new Promise((resolve, reject) => {
            writeStream.on('finish', () => {
                const imageUrl = `http://194.233.69.219/images/${imageName}`;
                resolve(successResponse(imageUrl, 'Image uploaded successfully!', true));
            });

            writeStream.on('error', (error) => {
                reject(errorResponse(error.message, 500));
            });
        });
    } catch (error) {
        console.error('Error uploading image:', error);
        throw errorResponse(error.message, 500);
    }
}
