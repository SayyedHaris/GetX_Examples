import 'package:flutter/material.dart';
// import 'package:get_x_/Languages/languages.dart';
import 'package:get_x_/home_page.dart';
import 'package:get/get.dart';
import 'package:get_x_/screen_one.dart';
import 'package:get_x_/screen_three.dart';
import 'package:get_x_/screen_two.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        // translations: Languages(),
        // fallbackLocale: Locale('en', 'US'),
        getPages: [
          GetPage(name: '/', page: () => const HomePage()),
          GetPage(name: '/screenOne', page: () => const ScreenOne()),
          GetPage(name: '/screenTwo', page: () => const ScreenTwo()),
          GetPage(
            name: "/screenThree",
            page: () => const ScreenThree(),
          )
        ],
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(primarySwatch: Colors.blue),
        home: const HomePage());
  }
}
