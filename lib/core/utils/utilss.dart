
import '../common/custom_exception.dart';

String extractErrorMessage(Exception? ex) {
  var message = 'something went wrong';
  if (ex is NoInternetError) {
    message = 'please check internet connection';
  } else if (ex is ServerError) {
    message = ex.serverMessage ?? 'something went wrong';
  } else if (ex is DioHttpException) {
    message = ex.exception?.message ?? 'something went wrong';
  }
  return message;
}
