// import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:get/get.dart';
// import 'package:textile_app/Screens/Spalsh/splash_screen.dart';

// Future<void> main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp();
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return ScreenUtilInit(
//       designSize: const Size(375, 812),
//       child: GetMaterialApp(
//         debugShowCheckedModeBanner: false,
//         theme: ThemeData(
//           colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF0D5785)),
//           primaryColor: const Color(0xFF0D5785),
//           fontFamily: 'Mulish',
//           scaffoldBackgroundColor: Colors.white,
//           appBarTheme: AppBarTheme.of(context).copyWith(
//             backgroundColor: Colors.white,
//           ),
//         ),
//         home: const SplashScreen(),
//       ),
//     );
//   }
// }
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:textile_app/Screens/Forgot/forgot_password_screen.dart';
import 'package:textile_app/Screens/Spalsh/splash_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      child: GetMaterialApp(
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF0D5785)),
          primaryColor: const Color(0xFF0D5785),
          fontFamily: 'Mulish',
          scaffoldBackgroundColor: Colors.white,
          appBarTheme: AppBarTheme.of(context).copyWith(
            backgroundColor: Colors.white,
          ),
        ),
        debugShowCheckedModeBanner: false,
        title: 'Textile App',
        home: const SplashScreen(),
      ),
    );
  }
}
