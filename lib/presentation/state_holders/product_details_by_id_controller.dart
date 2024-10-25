import 'package:crafty_bay/Data/models/network_response.dart';
import 'package:crafty_bay/Data/models/product_list_model.dart'; // Import the correct model
import 'package:crafty_bay/Data/services/network_caller.dart';
import 'package:get/get.dart';

import '../../Data/models/product_details_model.dart';
import '../../Data/models/product_model.dart';
import '../../Data/utils/urls.dart';

class ProductdetailsByIdController extends GetxController {
  // Loading states
  bool _inProgress = false;

  // Getters for loading states
  bool get inProgress  => _inProgress ;


  ProductDetailsModel?  _productModel;



  ProductDetailsModel? get product=> _productModel;


  String? _errorMessage;


  String? get errorMessage => _errorMessage;


  // Fetch products by remark
  Future<bool> getProductdetailsById(int productId) async {
    bool isSuccess = false;
     _inProgress=true;
    update();


    final NetworkResponse response = await Get.find<NetworkCaller>().getRequest(
      url: Urls.productdetailsById(productId),
    );


    if (response.isSucess) {
      _productModel =
          ProductDetailsModel.fromJson(response.responseData['data'][0]);
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
