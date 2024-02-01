import 'package:bookly_app/constants.dart';
import 'package:bookly_app/features/splash/presentation/views/splash_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const BooklyApp());
}

class BooklyApp extends StatelessWidget {
  const BooklyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  GetMaterialApp( // Change Material App to GetMaterial from get
    debugShowCheckedModeBanner: false,
       theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor:kPrimaryColor,
        textTheme: GoogleFonts.montserratTextTheme(ThemeData.dark().textTheme),
       ),
       
      home: const SplashView(),
    );
  }
}

