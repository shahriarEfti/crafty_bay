import 'package:crafty_bay/presentation/ui/screens/create_review_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../utils/app_color.dart';

class ReviewScreen extends StatefulWidget {
  const ReviewScreen({super.key});

  @override
  State<ReviewScreen> createState() => _ReviewScreenState();
}

class _ReviewScreenState extends State<ReviewScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Reviews"),
      ),
      body: Column(
        children: [
          Expanded(
            // Wrapping ListView.builder with Expanded to handle dynamic height
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: ListView.builder(
                itemCount: 4, // Number of reviews
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 16.0),
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Padding(
                        padding: EdgeInsets.all(16.0),
                        child: Row(
                          children: [
                            CircleAvatar(
                              radius: 20,

                              child: Icon(Icons.person_4_outlined,color: Colors.grey,),
                            ),
                            SizedBox(width: 16.0),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Shahriar Efti",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16.0,
                                    ),
                                  ),
                                  SizedBox(height: 8.0),
                                  Text(
                                    'Reference site about Lorem Ipsum, giving information on its origins, '
                                        'as well as a random Lipsum generator. Reference site about Lorem Ipsum, '
                                        'giving information on its origins.',
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 14.0,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          _buildTotalReviewAndAddReviewSection(),


        ],
      ),


    );
  }
  Widget _buildTotalReviewAndAddReviewSection() {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
          color: AppColor.themecolor.withOpacity(0.1),
          borderRadius: const BorderRadius.only(
              topRight: Radius.circular(8),
              topLeft: Radius.circular(8)
          )
      ),

      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Text("Reviews(1000)",style: TextStyle(fontSize: 15,

                fontWeight: FontWeight.w300),),
              ),

           ],
          ),




              FloatingActionButton(
backgroundColor: AppColor.themecolor,
                child: const Icon(Icons.add,color: Colors.white,),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(32)
                ),

                  onPressed: (){

  Get.to(()=>const CreateReviewScreen());

              },
              ),
        ],
      ),
    );
  }
}
