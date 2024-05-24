import 'package:tnm2/view/pages/detail_news_page.dart';
import 'package:tnm2/view/pages/edit_page.dart';
import 'package:tnm2/view/pages/fisrt_quarter_page.dart';
import 'package:tnm2/view/pages/fourth_quarter_page.dart';
import 'package:tnm2/view/pages/main_news_page.dart';
import 'package:tnm2/view/pages/main_page.dart';
import 'package:tnm2/view/pages/second_quarter_page.dart';
import 'package:tnm2/view/pages/third_quarter_page.dart';

class AppRoutes {
  static const main = MainPage.route; //메인페이지
  static const detailNews = DetailNewsPage.route; //상세 기사페이지
  static const firstQuarter = FirstQuarterPage.route; //1분기 페이지
  static const secondQuarter = SecondQuarterPage.route; //2분기 페이지
  static const thirdQuarter = ThirdQuarterPage.route; //3분기 페이지
  static const fourthQuarter = FourthQuarterPage.route; //4분기 페이지
  static const mainNews = MainNewsPage.route; //주요뉴스 페이지
  static const edit = EditPage.route; //기사작성 페이지

}