import 'package:flutter/material.dart';

import '../utils/app_color.dart';

class CatagoryCard extends StatelessWidget {
  const CatagoryCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding:EdgeInsets.all(16),
          decoration:BoxDecoration(
              color: AppColor.themecolor.withOpacity(0.2),
              borderRadius: BorderRadius.circular(10)

          ),

          child: Icon(Icons.computer,size: 48,color: AppColor.themecolor,),
        ),
        SizedBox(height: 4,),
        Text("Electonics",style: TextStyle(
            color: AppColor.themecolor
        ),)
      ],
    );
  }
}