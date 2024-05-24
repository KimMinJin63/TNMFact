import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tnm2/utils/app_textstyle.dart';

class AppListTile extends StatelessWidget {
  const AppListTile(
      {super.key, required this.headline, required this.image, this.onpressed});
  final String headline;
  final Image image;
  final Function()? onpressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: onpressed,
        child: Container(
          color: Colors.grey.shade200,
          width: MediaQuery.of(context).size.width,
          height: 80,
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: AspectRatio(
                  aspectRatio: 1.5 / 1,
                  child: Container(
                    color: Colors.red.shade100,
                    height: 75,
                    child: image,
                  ),
                ),
              ),
              Flexible(
                  child: Text(headline,
                  overflow: TextOverflow.ellipsis,
                      style: AppTextStyle.koPtBold20(),
                      )),
              SizedBox()
            ],
          ),
        ),
      ),
    );
  }
}
