import 'package:crafty_bay/Data/models/network_response.dart';

import 'package:crafty_bay/Data/services/network_caller.dart';
import 'package:crafty_bay/Data/utils/urls.dart';
import 'package:get/get.dart';

import '../../Data/models/catagory_list_model.dart';
import '../../Data/models/catagory_model.dart';

class CatagoryListController extends GetxController{

  bool _inProgress =false;
  String ? _errorMessage;

  List<CatagoryModel> _catagoryList =[];

  String ? get errorMessage => _errorMessage;

  List<CatagoryModel> get catagoryList => _catagoryList;
  bool get inProgress => _inProgress;

  Future<bool> getCatagoryList() async{
    bool isSuccess = false;
    _inProgress =true;
    update();
    final NetworkResponse response =

    await Get.find<NetworkCaller>().getRequest(url: Urls.catagoryListUrl);

    if(response.isSucess){
      isSuccess=true;
      _errorMessage =null;
      _catagoryList = CatagoryListModel.fromJson(response.responseData).catagoryList ??[];

    }else{
      _errorMessage =response.errorMessage;

    }
    _inProgress =false;
    update();
    return isSuccess;
  }

}