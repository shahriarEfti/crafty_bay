import 'package:crafty_bay/Data/models/network_response.dart';
import 'package:crafty_bay/Data/models/product_list_model.dart'; // Import the correct model
import 'package:crafty_bay/Data/services/network_caller.dart';
import 'package:get/get.dart';

import '../../Data/models/product_model.dart';
import '../../Data/utils/urls.dart';

class PopularProductListController extends GetxController {
  // Loading states
  bool _inProgress = false;

  // Getters for loading states
  bool get inProgress  => _inProgress ;


  List<ProductModel> _productList = [];



  List<ProductModel> get productList =>_productList;


  String? _errorMessage;


  String? get errorMessage => _errorMessage;


  // Fetch products by remark
  Future<bool> getPopularProductList() async {
    bool isSuccess = false;
     _inProgress=true;
    update();


    final NetworkResponse response = await Get.find<NetworkCaller>().getRequest(
      url: Urls.productListByRemark('popular'),
    );


    if (response.isSucess) {
      _productList =
      ProductListModel
          .fromJson(response.responseData)
          .productList ?? [];
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
