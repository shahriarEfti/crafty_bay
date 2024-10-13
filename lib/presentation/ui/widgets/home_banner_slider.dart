

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../utils/app_color.dart';

class HomeBannerSlider extends StatefulWidget {
   HomeBannerSlider({
    super.key,
  });



  @override
  State<HomeBannerSlider> createState() => _HomeBannerSliderState();
}

class _HomeBannerSliderState extends State<HomeBannerSlider> {
  final ValueNotifier<int>  _selectedIndex = ValueNotifier(0);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider(
          options: CarouselOptions(height: 180,onPageChanged: (index,reason){
            _selectedIndex.value = index;
          }),
          items: [1,2,3,4,5].map((i) {
            return Builder(
              builder: (BuildContext context) {
                return Container(
                    alignment: Alignment.center,
                    width: MediaQuery.of(context).size.width,
                    margin: EdgeInsets.symmetric(horizontal: 5.0),
                    decoration: BoxDecoration(
                        color: AppColor.themecolor
                    ),
                    child: Text('text $i', style: TextStyle(fontSize: 16.0),)
                );
              },
            );
          }).toList(),
        ),

       const SizedBox(height: 8,),
       ValueListenableBuilder(
         valueListenable: _selectedIndex,
         builder: (context,currentIndex, _) {
           return Row(
           mainAxisAlignment: MainAxisAlignment.center,
             children: [

               for(int i=0; i<5 ; i++)
                 Container(
                  margin: EdgeInsets.only(right: 4),
                   height: 12,
                   width: 12,
                   decoration: BoxDecoration(
                       borderRadius: BorderRadius.circular(12),
                       border: Border.all(color: Colors.grey),
                       color: currentIndex ==i? AppColor.themecolor: null

                   ),
                 )
             ],
           );
         }
       ),

      ],
    );

  }

  @override
  void dispose() {
   _selectedIndex.dispose();
    super.dispose();
  }
}