// error-handler.js

// Global error handler middleware
function errorHandler(err, req, res, next) {
    console.error(err); // Log the error
    res.status(500).json({ error: 'Internal Server Error' }); // Send an error response to the client
}

export default errorHandler;
