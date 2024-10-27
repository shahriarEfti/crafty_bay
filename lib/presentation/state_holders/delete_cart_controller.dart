import 'package:get/get.dart';
import '../../Data/models/network_response.dart';
import '../../Data/services/network_caller.dart';
import '../../Data/utils/urls.dart';

class DeleteCartController extends GetxController {
  bool _inProgress = false;
  bool get inProgress => _inProgress;

  String? _errorMessage;
  String? get errorMessage => _errorMessage;

  Future<bool> deleteCartItem(int cartItemId) async {
    bool isSuccess = false;
    _inProgress = true;
    update();

    final NetworkResponse response = await Get.find<NetworkCaller>().postRequest(
      url: Urls.deleteCartUrl,
      body: {
        'cart_item_id': cartItemId,
      },
    );

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
