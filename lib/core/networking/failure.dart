abstract class Failure {}

// No internet connection
// No internet connection
// No internet connection
// No internet connection
class OfflineFailure extends Failure {}

// Server Error (api doesn't return data from server)
// Server Error (api doesn't return data from server)
// Server Error (api doesn't return data from server)
// Server Error (api doesn't return data from server)
class ServerFailure extends Failure {}

// Empty cash exception
// Empty cash exception
// Empty cash exception
// Empty cash exception
class EmptyDataFailure extends Failure {}

// getErrorMessage method to get the error message based on the failure type
// getErrorMessage method to get the error message based on the failure type
// getErrorMessage method to get the error message based on the failure type
// getErrorMessage method to get the error message based on the failure type
