import 'package:get/get.dart';
import 'package:tnm2/utils/app_routes.dart';
import 'package:tnm2/view/pages/detail_news_page.dart';
import 'package:tnm2/view/pages/edit_page.dart';
import 'package:tnm2/view/pages/fisrt_quarter_page.dart';
import 'package:tnm2/view/pages/fourth_quarter_page.dart';
import 'package:tnm2/view/pages/main_news_page.dart';
import 'package:tnm2/view/pages/main_page.dart';
import 'package:tnm2/view/pages/second_quarter_page.dart';
import 'package:tnm2/view/pages/third_quarter_page.dart';

class AppPages {
  static final pages =[
 GetPage(
        name: AppRoutes.main,
        page: () => const MainPage(),
        transition: Transition.circularReveal), //메인 페이지
 GetPage(
        name: AppRoutes.detailNews,
        page: () => const DetailNewsPage(),
        transition: Transition.circularReveal), //상세 기사페이지
 GetPage(
        name: AppRoutes.firstQuarter,
        page: () => const FirstQuarterPage(),
        transition: Transition.circularReveal), //1분기 페이지
 GetPage(
        name: AppRoutes.secondQuarter,
        page: () => const SecondQuarterPage(),
        transition: Transition.circularReveal), //2분기 페이지
 GetPage(
        name: AppRoutes.thirdQuarter,
        page: () => const ThirdQuarterPage(),
        transition: Transition.circularReveal), //3분기 페이지
 GetPage(
        name: AppRoutes.fourthQuarter,
        page: () => const FourthQuarterPage(),
        transition: Transition.circularReveal), //4분기 페이지
 GetPage(
        name: AppRoutes.mainNews,
        page: () => const MainNewsPage(),
        transition: Transition.circularReveal), //메인뉴스 페이지
 GetPage(
        name: AppRoutes.edit,
        page: () => const EditPage(),
        transition: Transition.circularReveal), //기사작성 페이지
  ];
}