
import 'package:crafty_bay/presentation/ui/screens/catagory_list_screen.dart';
import 'package:crafty_bay/presentation/ui/utils/assets_path.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
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
              const SizedBox(height: 16,),
              HomeBannerSlider(),
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
              const SizedBox(height: 200,
                  child: HorizontalProductListView(),)
            ],
          );
  }
Widget _buildNewProductSection() {
    return Column(
      children: [
        SectionHeader(
          title: 'New',
          onTap: (){},),
        const SizedBox(height: 200,
            child: HorizontalProductListView()),
      ],
    );
  }
Widget _buildSpecialProductSection() {
    return Column(
      children: [
        SectionHeader(
          title: 'Special',
          onTap: (){},),
        const SizedBox(height: 200,
            child: HorizontalProductListView()),
      ],
    );
  }
Widget _buildCatagoriesSection() {
    return Column(
            children: [
              SectionHeader(
                title: 'Catagories',
                onTap: (){
                  Get.to(() => const CatagoryListScreen());
                },),
              const SizedBox(height: 8,),

              const SizedBox(
                height: 120,
                child: HorizontalCatagoryListView(),
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













