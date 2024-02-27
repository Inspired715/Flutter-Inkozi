// import 'package:firebase_core/firebase_core.dart';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:inkozi/UTILIS/app_router.dart';
import 'package:inkozi/UTILIS/theme.dart';
import 'package:inkozi/screens/SPLASH/C/controller.dart';
import 'package:inkozi/screens/SPLASH/V/splash.dart';
import 'bloc/category_bloc/category_blocs.dart';
import 'bloc/category_bloc/category_events.dart';
import 'repo/category_repositories.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

void main() async {
  HttpOverrides.global = new MyHttpOverrides();
  //await Location().requestPermission();
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();

  runApp(MultiBlocProvider(providers: [
    BlocProvider<CategoryBloc>(
      create: (context) =>
          CategoryBloc(CategoryRepository())..add(LoadCategoryEvent()),
    ),
  ], child: const MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    Get.put(SplashController());
    SplashController.to.splashgetintrovideo();
    SplashController.to.checkFirsttime().then((value) {
      if (value) {
        SplashController.to.getonboardingpages();
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(375, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return GetMaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Inkozi',
            theme: theme(),
            onGenerateRoute: AppRouter.onGenerateRoute,
            initialRoute: MyCustomSplashScreen.routeName,
          );
        });
  }
}
