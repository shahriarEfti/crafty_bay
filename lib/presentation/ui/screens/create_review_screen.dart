import 'package:flutter/material.dart';

import '../widgets/app_logo_widget.dart';

class CreateReviewScreen extends StatefulWidget {
  const CreateReviewScreen({super.key});

  @override
  State<CreateReviewScreen> createState() => _CreateReviewScreenState();
}

class _CreateReviewScreenState extends State<CreateReviewScreen> {

  final TextEditingController _firstnameTEController = TextEditingController();
  final TextEditingController _lastnameTEController = TextEditingController();
  final TextEditingController _writereviewTEController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Create a Review"),


      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            children: [
              SizedBox(height: 16,),
              TextFormField(
                controller: _firstnameTEController,
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(
                    hintText: 'First Name'
                ),
              ),
              SizedBox(height: 16,),
              TextFormField(
                controller: _lastnameTEController,
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(
                    hintText: 'Last Name'
                ),
              ),
              SizedBox(height: 16,),
              TextFormField(
                maxLines: 4,
                controller: _writereviewTEController,
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    hintText: 'Write a review'
                ),
              ),


              SizedBox(height: 16,),
              ElevatedButton(


                  onPressed: () {}, child: Text('Submit')),

            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _firstnameTEController.dispose();
    _lastnameTEController.dispose();
    _writereviewTEController.dispose();
    super.dispose();
  }
}
