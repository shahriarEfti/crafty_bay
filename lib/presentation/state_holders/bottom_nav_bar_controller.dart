 import 'package:get/get.dart';

class BottomNavBarController extends  GetxController{

  int _selectedIndex =0;

  int get selectedIndex =>  _selectedIndex;

  void changedIndex(int index){
    _selectedIndex = index;
       update();

  }

  void SelectCatagory(){

   changedIndex(1);

  }


  void BackToHome(){

    changedIndex(0);

  }
}