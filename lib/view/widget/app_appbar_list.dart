import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tnm2/utils/app_textstyle.dart';

class AppBarList extends StatelessWidget {
  const AppBarList({super.key, required this.text, this.onTap});
  final String text;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          title: Text(text, style: AppTextStyle.koPtRegular40()),
          trailing: Icon(Icons.navigate_next),
          onTap: onTap,
        ),
        Divider(
          height: 1,
          color: Colors.black12,
        )
      ],
    );
  }
}
