import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:tnm2/controllers/edit_controller.dart';
import 'package:tnm2/firebase_options.dart';
import 'package:tnm2/utils/app_pages.dart';
import 'package:tnm2/view/pages/main_page.dart';

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(1080, 2220), // 디자인 크기 설정
      builder: (BuildContext context, Widget? child) {
        return GetMaterialApp(
          theme: ThemeData(
            scaffoldBackgroundColor: Colors.white,
          ),
          initialBinding: BindingsBuilder(() {
            Get.lazyPut(() => EditController(), fenix: true);
          }),
          getPages: AppPages.pages,
          home: MainPage(),
        );
      },
    );
  }
}
