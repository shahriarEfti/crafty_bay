import 'package:flutter/material.dart';


import '../../../../Data/models/catagory_model.dart';
import '../catagory_card.dart';

class HorizontalCatagoryListView extends StatelessWidget {
  const HorizontalCatagoryListView({
    super.key, required this.catagoryList,
  });

  final List<CatagoryModel> catagoryList;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: catagoryList.length,
      scrollDirection: Axis.horizontal,

      itemBuilder: (context, index){
        return CatagoryCard(

          catagoryModel: catagoryList[index],
        );
      }, separatorBuilder: (_, __)=>SizedBox(
      width: 8,
    ),


    );
  }
}

