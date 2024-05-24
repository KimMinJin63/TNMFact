import 'package:flutter/material.dart';
import 'package:tnm2/utils/app_textstyle.dart';
import 'package:tnm2/view/widget/app_appbar_list.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer(
      {super.key,
      required this.accountName,
      required this.appListTile1,
      required this.appListTile2,
      required this.appListTile3,
      required this.appListTile4,
      required this.appListTile5,
      this.appListTileTap1,
      this.appListTileTap2,
      this.appListTileTap3,
      this.appListTileTap4,
      this.appListTileTap5,
      this.appListTileTap6,
      required this.appListTile6});
  final String accountName;
  final String appListTile1;
  final String appListTile2;
  final String appListTile3;
  final String appListTile4;
  final String appListTile5;
  final String appListTile6;
  final Function()? appListTileTap1;
  final Function()? appListTileTap2;
  final Function()? appListTileTap3;
  final Function()? appListTileTap4;
  final Function()? appListTileTap5;
  final Function()? appListTileTap6;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: MediaQuery.of(context).size.width / 2.2,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height / 5,
            child: UserAccountsDrawerHeader(
              accountName:
                  Text(accountName, style: AppTextStyle.koPtSemiBold16()),
              accountEmail: const Text(''),
              // currentAccountPicture: CircleAvatar(
              //   radius: ScreenUtil().setWidth(1),
              //   child: const ClipOval(),
              // ),
            ),
          ),
          AppBarList(
            text: appListTile1,
            onTap: appListTileTap1,
          ),
          AppBarList(text: appListTile2, onTap: appListTileTap2),
          AppBarList(text: appListTile3, onTap: appListTileTap3),
          AppBarList(text: appListTile4, onTap: appListTileTap4),
          AppBarList(text: appListTile5, onTap: appListTileTap5),
          AppBarList(text: appListTile6, onTap: appListTileTap6
              // () {

              // Get.dialog(Dialog(
              //   child: Padding(
              //     padding: const EdgeInsets.all(8.0),
              //     child: Column(
              //       mainAxisAlignment: MainAxisAlignment.start,
              //       crossAxisAlignment: CrossAxisAlignment.start,
              //       children: [
              //         Padding(
              //           padding: const EdgeInsets.all(8.0),
              //           child: Row(
              //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //             children: [
              //               const Text('로그인할 병원을 선택하세요'),
              //               TextButton(
              //                   onPressed: () {
              //                     Get.back();
              //                   },
              //                   child: Text(
              //                     '닫기',
              //                     style:
              //                         TextStyle(color: Colors.brown.shade300),
              //                   ))
              //             ],
              //           ),
              //         ),
              //         const SizedBox(
              //           height: 20,
              //         ),
              //         const Divider(
              //           height: 1,
              //         ),
              //         const AppListTile(text: '벤스의원 홍대점')
              //       ],
              //     ),
              //   ),
              // ));
              // },
              )
        ],
      ),
    );
  }
}
