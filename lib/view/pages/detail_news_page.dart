import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:tnm2/utils/app_textstyle.dart';
import 'package:tnm2/view/pages/edit_page.dart';

class DetailNewsPage extends StatelessWidget {
  const DetailNewsPage({super.key});
  static const route = '/detailNews';

  @override
  Widget build(BuildContext context) {
    final headline = Get.arguments != null ? Get.arguments[0] ?? '' : '';
    final picture = Get.arguments != null ? Get.arguments[1] ?? '' : '';
    final content = Get.arguments != null ? Get.arguments[2] ?? '' : '';
    final dateTime = Get.arguments != null ? Get.arguments[3] ?? '' : '';
    final documentId = Get.arguments != null ? Get.arguments[4] ?? '' : '';
    print(documentId);
    print('이미지는 뭘까? : $picture');
    return Scaffold(
      appBar: AppBar(
        actions: [
          TextButton(
            onPressed: () async {
              // 수정을 위해 EditPage로 이동
              var result = await Get.toNamed(EditPage.route, arguments: {
                // var result = await Get.offNamed(EditPage.route, arguments: {
                'headline': headline,
                'picture': picture,
                'content': content,
                'isEditing': true,
                'dateTime': dateTime,
                'documentId': documentId,
              });

              // EditPage에서 돌아온 후 UI 업데이트
              if (result != null && result is bool && result == true) {
                print('수정 후 UI 업데이트');
              }
            },
            child: Text('수정하기'),
          )
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Column(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: Text(
                          headline,                          // softWrap: true,
                          // overflow: TextOverflow.ellipsis,
                          maxLines: 3,
                          style: AppTextStyle.koPtBold27(),
                        ),
                      ),
                    ),
                    Align(
                        alignment: Alignment.centerLeft, child: Text(dateTime)),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.width / 2,
                  child: Image.network(picture),
                ),
                const SizedBox(
                  height: 30,
                ),
                Align(alignment: Alignment.centerLeft, child: Text(content))
              ],
            ),
          ),
        ),
      ),
    );
  }
  //   ),
  // ),
  // )
  // ),
  // );
}
// }
