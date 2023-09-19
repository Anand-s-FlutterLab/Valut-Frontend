import 'package:dio/dio.dart';
import 'package:vault/Widgets/snackbar.dart';

class ErrorHandler {
  static void handleError(DioError error) {
    if (error.type == DioErrorType.connectionTimeout ||
        error.type == DioErrorType.receiveTimeout ||
        error.type == DioErrorType.sendTimeout) {
      customSnackBar("Connection Timeout", "Please check your internet connection and try again.");
    } else if (error.type == DioErrorType.badResponse) {
      switch (error.response!.statusCode) {
        case 400:
          customSnackBar("400", "Bad request.");
          break;
        case 401:
          customSnackBar("401", "Authentication failed.");
          break;
        case 403:
          customSnackBar("403", "The authenticated user is not allowed to access the specified API endpoint.");
          break;
        case 404:
          customSnackBar("404", "The requested resource does not exist.");
          break;
        case 405:
          customSnackBar("405", "Method not allowed. Please check the Allow header for the allowed HTTP methods.");
          break;
        case 415:
          customSnackBar("415", "Unsupported media type. The requested content type or version number is invalid.");
          break;
        case 422:
          customSnackBar("422", "Data validation failed.");
          break;
        case 429:
          customSnackBar("429", "Too many requests.");
          break;
        case 500:
          customSnackBar("500", "Internal server error.");
          break;
        case 503:
          customSnackBar("503", "Service Unavailable.");
          break;
        default:
          customSnackBar("Oops something went wrong!", "Ensure that the server is operational.");
          break;
      }
    } else {
      customSnackBar("Server Error", "Ensure that the server is operational.");
    }
  }
}
