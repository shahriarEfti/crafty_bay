

import 'package:carousel_slider/carousel_slider.dart';

import 'package:flutter/material.dart';

import '../utils/app_color.dart';

class ProductImageBannerSlider extends StatefulWidget {
   const ProductImageBannerSlider({
    super.key, required this.sliderUrls,
  });

   final List<String> sliderUrls;


  @override
  State<ProductImageBannerSlider> createState() => _ProductImageBannerSliderState();
}

class _ProductImageBannerSliderState extends State<ProductImageBannerSlider> {
  final ValueNotifier<int>  _selectedIndex = ValueNotifier(0);
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CarouselSlider(
          options: CarouselOptions(height: 200,onPageChanged: (index,reason){
            _selectedIndex.value = index;

          },viewportFraction:1,
          ),

          items: widget.sliderUrls.map((imageUrl) {
            return Builder(
              builder: (BuildContext context) {
                return Container(



                   decoration: BoxDecoration(



                     color: Colors.grey.shade100,
                     image: DecorationImage(image: NetworkImage(imageUrl)
                       ,
                     ),)


                );
              },
            );
          }).toList(),
        ),

       const SizedBox(height: 8,),
       Positioned(

         bottom: 12,
         right: 0,
         left: 0,
         child: ValueListenableBuilder(
           valueListenable: _selectedIndex,
           builder: (context,currentIndex, _) {
             return Row(
             mainAxisAlignment: MainAxisAlignment.center,
               children: [

                 for(int i=0; i<widget.sliderUrls.length ; i++)
                   Container(
                    margin: const EdgeInsets.only(right: 4),
                     height: 12,
                     width: 12,
                     decoration: BoxDecoration(
                         borderRadius: BorderRadius.circular(12),

                         color: currentIndex ==i? AppColor.themecolor: Colors.white

                     ),
                   )
               ],
             );
           }
         ),
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