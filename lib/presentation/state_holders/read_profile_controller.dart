import 'package:crafty_bay/Data/models/network_response.dart';
import 'package:crafty_bay/Data/models/product_list_model.dart'; // Import the correct model
import 'package:crafty_bay/Data/services/network_caller.dart';
import 'package:crafty_bay/presentation/state_holders/auth_controller.dart';
import 'package:get/get.dart';

import '../../Data/models/product_model.dart';
import '../../Data/utils/urls.dart';

class ReadProfileController extends GetxController {
  // Loading states
  bool _inProgress = false;
  bool _isProfileCompleted =false;


  // Getters for loading states
  bool get inProgress  => _inProgress ;
  bool get isProfileCompleted  => _isProfileCompleted ;




  String? _errorMessage;


  String? get errorMessage => _errorMessage;


  // Fetch products by remark
  Future<bool> getProfileDetails(String token) async {
    bool isSuccess = false;
     _inProgress=true;
    update();


    final NetworkResponse response = await Get.find<NetworkCaller>().getRequest(
      url: Urls.readProfileUrl,
      token: token,
    );


    if (response.isSucess) {
     if(response.responseData['data'] != null){

       _isProfileCompleted =true;
      await Get.find<AuthController>().saveAccessToken(token);
     }
      isSuccess == true;
      _errorMessage = null;
    }

      else {
        _errorMessage =response.errorMessage;
      }



   _inProgress = false;
    update(); // Notify UI about data or loading state change
    return isSuccess;
  }
}
