import '../../helper/dialog_helper.dart';
import '../../model/services/app_exceptions.dart';

class BaseController {
  static void handleError(error) {
    print('___________________________error___________________________');
    print(error);
    //hideLoading();
    if (error is BadRequestException) {
      var message = error.message;
      DialogHelper.showErroDialog(description: message);
    } else if (error is FetchDataException) {
      var message = error.message;
      DialogHelper.showErroDialog(description: message);
    } else if (error is ApiNotRespondingException) {
      var message = error.message;

      DialogHelper.showErroDialog(description: message);
    } else if (error is NotFoundException) {
      var message = error.message;

      DialogHelper.showErroDialog(description: message);
    }
  }

  /* static showLoading([String? message]) {
    DialogHelper.showLoading(message);
  }

  static hideLoading() {
    DialogHelper.hideLoading();
  } */
}
