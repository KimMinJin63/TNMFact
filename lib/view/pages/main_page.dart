import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';
import 'package:tnm2/controllers/main_controller.dart';
import 'package:tnm2/view/pages/detail_news_page.dart';
import 'package:tnm2/view/pages/edit_page.dart';
import 'package:tnm2/view/pages/fisrt_quarter_page.dart';
import 'package:tnm2/view/pages/fourth_quarter_page.dart';
import 'package:tnm2/view/pages/second_quarter_page.dart';
import 'package:tnm2/view/pages/third_quarter_page.dart';
import 'package:tnm2/view/widget/app_drawer.dart';
import 'package:tnm2/view/widget/app_list_tile.dart';

class MainPage extends GetView<MainController> {
  const MainPage({super.key});
  static const route = '/main';

  @override
  Widget build(BuildContext context) {
    final box = GetStorage();

    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          // leading: IconButton(
          //   onPressed: () {
          //     // leading 아이콘을 눌렀을 때 Drawer 열기
          //     Scaffold.of(context).openDrawer();
          //   },
          //   icon: Icon(Icons.menu),
          // ),
          title: SizedBox(
              height: 35,
              child: Image.asset(
                'assets/images/tnm.png',
              ))),
      drawer: AppDrawer(
        accountName: '김병국 기자',
        appListTile1: '주요뉴스',
        appListTileTap1: () {},
        appListTile2: '1분기',
        appListTileTap2: () {
          Get.toNamed(FirstQuarterPage.route);
        },
        appListTile3: '2분기',
        appListTileTap3: () {
          Get.toNamed(SecondQuarterPage.route);
        },
        appListTile4: '3분기',
        appListTileTap4: () {
          Get.toNamed(ThirdQuarterPage.route);
        },
        appListTile5: '4분기',
        appListTileTap5: () {
          Get.toNamed(FourthQuarterPage.route);
        },
        appListTile6: '글쓰기',
        appListTileTap6: () {
          Get.toNamed(EditPage.route);
        },
      ),
      body: SafeArea(
          child: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection('posts')
            .orderBy('timestamp', descending: true)
            .snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return CircularProgressIndicator();
          }
          final documents = snapshot.data!.docs;
          return Column(
            children: [
              // Container(
              //   decoration: BoxDecoration(color: Colors.blue.shade100),
              //   width: MediaQuery.of(context).size.width,
              //   height: MediaQuery.of(context).size.height / 6.3,
              //   child: Padding(
              //     padding: const EdgeInsets.fromLTRB(8, 16, 8, 16),
              //     child: Text(
              //       '제 식구 감싸느라 비판은 \'귓등\'...\n포항시 비리덮기 언제까지',
              //       style: TextStyle(
              //         fontWeight: FontWeight.bold,
              //         fontSize: ScreenUtil().setSp(70),
              //       ),
              //     ),
              //   ),
              // ),
              // SizedBox(
              //   height: 15,
              // ),
              Container(
                decoration: BoxDecoration(color: Colors.blue.shade100),
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 6,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(8, 16, 8, 8),
                      child: Container(
                        height: 25,
                        width: MediaQuery.of(context).size.width / 4.5,
                        decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(30)),
                        child: Center(child: Text('주요 뉴스')),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        '영천시, 수도권 원정 고향사랑기부제 홍보',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: ScreenUtil().setSp(65),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Expanded(
                child: ListView.builder(
                    padding: EdgeInsets.zero,
                    shrinkWrap: true,
                    // physics: NeverScrollableScrollPhysics(),
                    // reverse: true,
                    itemCount: documents.length,
                    itemBuilder: (context, index) {
                      final title = documents[index]['title'] ?? '';
                      final image = documents[index]['image'] ?? '';
                      final content = documents[index]['content'] ?? '';
                      final timeStamp = documents[index]['timestamp'] ?? '';
                      final documentId = documents[index]['documentId'] ?? '';
                      final dateTime = (timeStamp as Timestamp).toDate();
                      final formattedDateTime =
                          DateFormat('yyyy-MM-dd HH:mm:ss').format(dateTime);
                      // box.write('title', title);
                      // box.write('image', image);
                      // box.write('content', content);
                      // box.write('documentId', documentId);

                      print(dateTime);
                      return AppListTile(
                        onpressed: () {
                          print(documentId);
                          Get.toNamed(DetailNewsPage.route, arguments: [
                            title,
                            image,
                            content,
                            formattedDateTime,
                            documentId
                          ]);
                        },
                        headline: title,
                        image: Image.network(
                          image,
                          fit: BoxFit.cover,
                        ),
                      );
                    }),
              )
              // AppListTile(
              //   onpressed: () {
              //     Get.toNamed(DetailNewsPage.route, arguments: [
              //       '의성군, 미래항공 모빌리티 산업 육성',
              //       'https://picsum.photos/500/300'
              //     ]);
              //   },
              //   headline: '의성군, 미래항공 모빌리티 산업 육성',
              //   image: Image.network(
              //     'https://picsum.photos/500/300',
              //     fit: BoxFit.cover,
              //   ),
              // ),
              // AppListTile(
              //   headline: '의성군, 미래항공 모빌리티 산업 육성',
              //   image: Image.network(
              //     'https://picsum.photos/500/300',
              //     fit: BoxFit.cover,
              //   ),
              // ),
              // AppListTile(
              //   headline: '의성군, 미래항공 모빌리티 산업 육성',
              //   image: Image.network(
              //     'https://picsum.photos/500/300',
              //     fit: BoxFit.cover,
              //   ),
              // ),
              // AppListTile(
              //   headline: '의성군, 미래항공 모빌리티 산업 육성',
              //   image: Image.network(
              //     'https://picsum.photos/500/300',
              //     fit: BoxFit.cover,
              //   ),
              // ),
              // AppListTile(
              //   headline: '의성군, 미래항공 모빌리티 산업 육성',
              //   image: Image.network(
              //     'https://picsum.photos/500/300',
              //     fit: BoxFit.cover,
              //   ),
              // ),
            ],
          );
        },
      )),
    );
  }
}
