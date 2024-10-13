import 'package:flutter/material.dart';

class SearchTextField extends StatelessWidget {
  const SearchTextField({
    super.key,
    required this.textEditingController,
  });
  final TextEditingController textEditingController;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: textEditingController,

      decoration: InputDecoration(
        hintText: 'Search',
        fillColor: Colors.grey.shade200,
        prefixIcon: Icon(Icons.search),
        filled: true,
        contentPadding: EdgeInsets.symmetric(horizontal: 16),
        border: OutlineInputBorder(
            borderSide: BorderSide.none
        ),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide.none
        ),
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide.none
        ),
      ),

    );
  }
}