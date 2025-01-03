import mysql from 'mysql2/promise';
import { errorResponse, successResponse } from '../helper/response.js';

/**
 * Database connection configuration
 */
const dbConfig = {
    host: 'localhost',
    user: 'root',
    database: 'dealer',
    password: 'hamza1134'
};

/**
 * Generic function to execute a SQL query.
 * @param {string} sql - The SQL query string.
 * @param {Array} params - The parameters for the query.
 * @returns {Promise<Object>} - The formatted response using successResponse or errorResponse.
 */
export async function executeQuery(sql, params) {
    let connection;
    try {
        // Open a new database connection
        connection = await mysql.createConnection(dbConfig);

        // Execute the query
        const [[rows]] = await connection.execute(sql, params);
        console.log("rows ====>", rows);

        // Check if rows contain valid data and return a formatted response
        if (rows.length > 0) {
            return successResponse(rows?.length > 1 ? rows : rows[0], 'Query executed successfully', true, rows.length);
        } else {
            return successResponse([], 'Query executed successfully but no data found', true, 0);
        }
    } catch (err) {
        console.error("Database Error:", err.message);
        // Return the error response
        return errorResponse(err.message, 500);
    } finally {
        // Close the connection if it was opened
        if (connection) {
            await connection.end();
        }
    }
}
