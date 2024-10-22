import 'package:crafty_bay/presentation/state_holders/bottom_nav_bar_controller.dart';
import 'package:crafty_bay/presentation/state_holders/new_product_list_controller.dart';
import 'package:crafty_bay/presentation/ui/utils/assets_path.dart';
import 'package:crafty_bay/presentation/ui/widgets/centered_circular_progress_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../../state_holders/catagory_list_controller.dart';
import '../../state_holders/popular_product_list_controller.dart';
import '../../state_holders/special_product_list_controller.dart';
import '../widgets/widgets.dart';





class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [

              SearchTextField(textEditingController: TextEditingController(),),
              const HomeBannerSlider(),
              const SizedBox(height: 16,),


              _buildCatagoriesSection(),
              _buildPopularProductSection(),
              const SizedBox(height: 16,),
              _buildNewProductSection(),
              const SizedBox(height: 16,),
              _buildSpecialProductSection(),
              const SizedBox(height: 16,),

            ],
          ),
        ),
      ),

    );
  }

  Widget _buildPopularProductSection() {
    return Column(
      children: [
        SectionHeader(
          title: 'Popular',
          onTap: (){},),
        SizedBox(height: 200,
            child: GetBuilder<PopularProductListController>(
                builder: (popularProductListController) {
                  return Visibility(
                      visible: !popularProductListController.inProgress,
                      replacement: CenteredCircularProgressIndicator(),

                      child: HorizontalProductListView(
                        productList: popularProductListController.productList,
                      ));
                }
            )),
       // const SizedBox(height: 200, child: HorizontalProductListView(),)
      ],
    );
  }
  Widget _buildNewProductSection() {
    return Column(
      children: [
        SectionHeader(
          title: 'New',
          onTap: (){},),
         SizedBox(height: 200,
            child: GetBuilder<NewProductListController>(
              builder: (newProductListController) {
                return Visibility(
                  visible: !newProductListController.inProgress,
                    replacement: CenteredCircularProgressIndicator(),

                    child: HorizontalProductListView(
                    productList: newProductListController.productList,
                    ));
              }
            )),
      ],
    );
  }
  Widget _buildSpecialProductSection() {
    return Column(
      children: [
        SectionHeader(
          title: 'Special',
          onTap: (){},),

        SizedBox(height: 200,
            child: GetBuilder<SpecialProductListController>(
                builder: (specialProductListController) {
                  return Visibility(
                      visible: !specialProductListController.inProgress,
                      replacement: CenteredCircularProgressIndicator(),

                      child: HorizontalProductListView(
                        productList: specialProductListController.productList,
                      ));
                }
            )),
       // const SizedBox(height: 200, child: HorizontalProductListView()),
      ],
    );
  }
  Widget _buildCatagoriesSection() {
    return Column(
      children: [
        SectionHeader(
          title: 'Catagories',
          onTap: (){
            Get.find<BottomNavBarController>().SelectCatagory();
          },),
        const SizedBox(height: 8,),

        SizedBox(
          height: 120,
          child: GetBuilder<CatagoryListController>(
              builder: (catagoryListController) {
                return Visibility(
                    visible: !catagoryListController.inProgress,
                    replacement: CenteredCircularProgressIndicator(),
                    child: HorizontalCatagoryListView(catagoryList: catagoryListController.catagoryList,));
              }
          ),
        ),
      ],
    );
  }




  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: Colors.white,
      title: SvgPicture.asset(AssetsPath.applogonav),
      actions: [
        AppBarIconButton(onTap: () {  }, iconData: Icons.person,),
        const SizedBox(width: 8,),
        AppBarIconButton(onTap: () {  }, iconData: Icons.call,),
        const SizedBox(width: 8,),
        AppBarIconButton(onTap: () {  }, iconData: Icons.notification_important_outlined,),
      ],
    );
  }
}