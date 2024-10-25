import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../Data/models/network_response.dart';
import '../../Data/services/network_caller.dart';
import '../../Data/utils/urls.dart';

class EmailVerificationController extends GetxController {
  bool _inProgress = false;
  bool get inProgress => _inProgress;

  String? _errorMessage;
  String? get errorMessage => _errorMessage;

  Future<bool> verifyEmail(String email) async {
    bool isSuccess = false;
    _inProgress = true;
    update();

    final NetworkResponse response =
    await Get.find<NetworkCaller>().getRequest(url: Urls.verifyemail(email));

    if (response.isSucess) {
      if (response.responseData['msg'] == 'success') {
        isSuccess = true;
        _errorMessage = null;
      } else {
        _errorMessage = response.responseData['msg'] ?? 'Unknown error';
      }
    } else {
      _errorMessage = response.errorMessage ?? 'Request failed or network error.';
    }

    _inProgress = false;
    update();
    return isSuccess;
  }
}
