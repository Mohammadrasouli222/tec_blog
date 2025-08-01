import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:tec_blog/binding.dart';
import 'package:tec_blog/component/my_colors.dart';
import 'package:tec_blog/my_http_override.dart';
import 'package:tec_blog/view/articel_list_screen.dart';
import 'package:tec_blog/view/main_screen/main_screen.dart';
import 'package:tec_blog/view/my_cats.dart';
import 'package:tec_blog/view/single.dart';
import 'package:tec_blog/view/splash_screen.dart';
import 'package:get_storage/get_storage.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  HttpOverrides.global = MyHttpOverrides();

  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarColor: SolidColors.statusBarColor,
      statusBarIconBrightness: Brightness.dark,
      systemNavigationBarColor: SolidColors.systemNavigationBarColor,
      systemNavigationBarIconBrightness: Brightness.dark,
    ),
  );
      
  await GetStorage.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;

    return GetMaterialApp(
      key: UniqueKey(), // اضافه شده
      initialBinding: RegisterBinding(), // فعال شده
      locale: const Locale('fa'), // const اضافه شده
      theme: lightTheme(textTheme),
      debugShowCheckedModeBanner: false,
      initialRoute: '/', // اضافه شده
      getPages: [
        GetPage(
          name: routeMainScreen, 
          page: () => MainScreen(),
          binding: RegisterBinding(),
          preventDuplicates: true,
        ),
        GetPage(
          name: routeSingleArticle, 
          page: () => Single(),
          binding: ArticleBinding(),
          preventDuplicates: true, // اضافه شده
        ),
      ],
      home: SplashScreen(), // یک صفحه اولیه مشخص کنید
    );
  }

  ThemeData lightTheme(TextTheme textTheme) {
    return ThemeData(
      inputDecorationTheme: InputDecorationTheme(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(width: 2),
        ),
        filled: true,
        fillColor: Colors.white,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          textStyle: MaterialStateProperty.resolveWith((states) {
            if (states.contains(MaterialState.pressed)) {
              return textTheme.headlineLarge;
            }
            return textTheme.headlineSmall;
          }),
          backgroundColor: MaterialStateProperty.resolveWith((states) {
            if (states.contains(MaterialState.pressed)) {
              return SolidColors.seeMore;
            }
            return SolidColors.primaryColor;
          }),
        ),
      ),
      fontFamily: 'dana',
      textTheme: TextTheme(
        headlineLarge: const TextStyle(
          fontFamily: 'dana',
          fontSize: 16,
          fontWeight: FontWeight.w700,
          color: SolidColors.posterTitle,
        ),
        headlineMedium: const TextStyle(
          fontFamily: 'dana',
          fontSize: 14,
          color: Colors.white,
          fontWeight: FontWeight.w300,
        ),
        headlineSmall: TextStyle(
          fontFamily: 'dana',
          fontSize: 14,
          color: SolidColors.seeMore,
          fontWeight: FontWeight.w700,
        ),
        titleLarge: const TextStyle(
          fontFamily: 'dana',
          fontSize: 20,
          fontWeight: FontWeight.w900,
          color: Color.fromARGB(199, 7, 19, 46),
        ),
        titleSmall: const TextStyle(
          fontFamily: 'dana',
          fontSize: 14,
          fontWeight: FontWeight.w300,
          color: SolidColors.posterSubTitle,
        ),
        titleMedium: const TextStyle(
          fontFamily: 'dana',
          fontSize: 14,
          fontWeight: FontWeight.w700,
          color: SolidColors.hintText,
        ),
        bodyLarge: const TextStyle(
          fontFamily: 'dana',
          fontSize: 15,
          fontWeight: FontWeight.w700,
          color: SolidColors.textTitle,
        ),
        bodyMedium: const TextStyle(
          fontFamily: 'dana',
          fontSize: 14,
          color: Color.fromARGB(255, 70, 70, 70),
          fontWeight: FontWeight.w700,
        ),
        bodySmall: const TextStyle(
          fontFamily: 'dana',
          fontSize: 14,
          color: Colors.green,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}

const String routeMainScreen = "/MainScreen";
const String routeSingleArticle = "/SingleArticle";