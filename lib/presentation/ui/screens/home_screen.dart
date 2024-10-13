import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:crafty_bay/presentation/ui/utils/app_color.dart';
import 'package:crafty_bay/presentation/ui/utils/assets_path.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../widgets/app_bar_icon_button.dart';
import '../widgets/home_banner_slider.dart';
import '../widgets/search_text_field.dart';
import '../widgets/section_header.dart';

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
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
           SearchTextField(textEditingController: TextEditingController(),),
            SizedBox(height: 16,),
            HomeBannerSlider(),
            SizedBox(height: 16,),

            SectionHeader(
              title: 'Catagories',
              onTap: (){},),
          ],
        ),
      ),

    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: Colors.white,
      title: SvgPicture.asset(AssetsPath.applogonav),
      actions: [
        AppBarIconButton(onTap: () {  }, iconData: Icons.person,),
        SizedBox(width: 8,),
        AppBarIconButton(onTap: () {  }, iconData: Icons.call,),
        SizedBox(width: 8,),
        AppBarIconButton(onTap: () {  }, iconData: Icons.notification_important_outlined,),
      ],
    );
  }
}








