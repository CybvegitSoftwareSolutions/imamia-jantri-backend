export function successResponse(data, message, success, count) {
    return {
        code: 200,
        success,
        data,
        message,
        count
    };
}

// Function to generate an error response
export function errorResponse(message, code) {
    return {
        code,
        sucess: false,
        message,
    };
}