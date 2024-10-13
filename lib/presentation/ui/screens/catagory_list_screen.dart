import 'package:crafty_bay/presentation/ui/widgets/catagory_card.dart';
import 'package:flutter/material.dart';

class CatagoryListScreen extends StatelessWidget {
  const CatagoryListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Catagories'),
      ),
      body: GridView.builder(
        itemCount: 20,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,childAspectRatio: 0.75
      ),
          itemBuilder: (context,index)
      { return CatagoryCard();

      }),

    );
  }
}
