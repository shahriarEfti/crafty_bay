import 'package:crafty_bay/Data/models/network_response.dart';
import 'package:crafty_bay/Data/models/product_model.dart';
import 'package:crafty_bay/Data/services/network_caller.dart';
import 'package:get/get.dart';

import '../../Data/models/product_list_model.dart';
import '../../Data/utils/urls.dart';

class ProductListByRemarkController extends GetxController {

  bool _popularProductInProgress = false;
  bool _newProductInProgress = false;
  bool _specialProductInProgress = false;


  bool get popularProductInProgress => _popularProductInProgress;
  bool get newProductInProgress => _newProductInProgress;
  bool get specialProductInProgress => _specialProductInProgress;


  List<ProductModel> _popularProducts = [];
  List<ProductModel> _newProducts = [];
  List<ProductModel> _specialProducts = [];


  List<ProductModel> get popularProducts => _popularProducts;
  List<ProductModel> get newProducts => _newProducts;
  List<ProductModel> get specialProducts => _specialProducts;


  String? _popularErrorMessage;
  String? _newErrorMessage;
  String? _specialErrorMessage;


  String? get popularErrorMessage => _popularErrorMessage;
  String? get newErrorMessage => _newErrorMessage;
  String? get specialErrorMessage => _specialErrorMessage;


  Future<bool> getProductByRemark(String remark) async {
    bool isSuccess = false;


    if (remark == "popular") {
      _popularProductInProgress = true;
    } else if (remark == 'new') {
      _newProductInProgress = true;
    } else {
      _specialProductInProgress = true;
    }

    update();

    final NetworkResponse response = await Get.find<NetworkCaller>().getRequest(
      url: Urls.productListByRemark(remark),
    );


    if (response.isSucess) {
      if (remark == "popular") {
        _popularErrorMessage = null;
        _popularProducts = ProductListModel.fromJson(response.responseData).productList ?? [];
      } else if (remark == 'new') {
        _newErrorMessage = null;
        _newProducts = ProductListModel.fromJson(response.responseData).productList ?? [];
      } else if (remark == "special") {
        _specialErrorMessage = null;
        _specialProducts = ProductListModel.fromJson(response.responseData).productList ?? [];
      }
      isSuccess = true; // Set success flag
    } else {
      // Handle errors for each category
      if (remark == "popular") {
        _popularErrorMessage = response.errorMessage;
      } else if (remark == 'new') {
        _newErrorMessage = response.errorMessage;
      } else if (remark == "special") {
        _specialErrorMessage = response.errorMessage;
      }
    }



    update(); // Notify UI about data or loading state change
    return isSuccess;
  }
}