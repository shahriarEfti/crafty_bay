
import 'package:crafty_bay/presentation/ui/screens/home_screen.dart';
import 'package:crafty_bay/presentation/ui/screens/splash_screen.dart';
import 'package:crafty_bay/presentation/ui/utils/app_color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

class CraftyBayApp extends StatefulWidget {
  const CraftyBayApp({super.key});

  @override
  State<CraftyBayApp> createState() => _CraftyBayAppState();
}

class _CraftyBayAppState extends State<CraftyBayApp> {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          titleTextStyle: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w500,
            color: Colors.black54
          )
        ),
        progressIndicatorTheme: ProgressIndicatorThemeData(
          color: AppColor.themecolor,

        ),
        textTheme: TextTheme(headlineLarge: TextStyle(fontSize: 32,
            fontWeight: FontWeight.w600),
        ),
        inputDecorationTheme: InputDecorationTheme(
          hintStyle: TextStyle(
            fontWeight: FontWeight.w400,
          ),
            border:_outlineinputborder(),
          enabledBorder: _outlineinputborder(),
          focusedBorder: _outlineinputborder(),
          errorBorder: _outlineinputborder(Colors.red),
          contentPadding: EdgeInsets.symmetric(horizontal: 16,
          vertical: 8)
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
    backgroundColor: AppColor.themecolor,
    foregroundColor: Colors.white,
    padding: EdgeInsets.symmetric(vertical: 12),
    shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(8)
    ),
    fixedSize: Size.fromWidth(double.maxFinite),
    textStyle: TextStyle(
    fontSize: 16,

    )),
        ),

        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            foregroundColor: AppColor.themecolor,
           textStyle: TextStyle(
             fontSize: 16,
           )
          )
        )
      ),


      home: HomeScreen(),
      debugShowCheckedModeBanner: false,
    );

  }
  OutlineInputBorder _outlineinputborder([Color ? color]){
    return OutlineInputBorder(
      borderSide: BorderSide(color : color?? AppColor.themecolor,width: 1),
      borderRadius: BorderRadius.circular(8)

    );

  }

}
