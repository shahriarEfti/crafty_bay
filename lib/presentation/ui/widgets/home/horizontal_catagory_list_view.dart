import 'package:flutter/material.dart';


import '../catagory_card.dart';

class HorizontalCatagoryListView extends StatelessWidget {
  const HorizontalCatagoryListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: 10,
      scrollDirection: Axis.horizontal,

      itemBuilder: (context, index){
        return CatagoryCard();
      }, separatorBuilder: (_, __)=>SizedBox(
      width: 8,
    ),


    );
  }
}

