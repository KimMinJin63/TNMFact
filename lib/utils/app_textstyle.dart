import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tnm2/utils/app_color.dart';

class AppTextStyle {
  static TextStyle koPtBold35white() => const TextStyle(
      fontFamily: 'PretendardBold', fontSize: 35, color: AppColor.white);

  static TextStyle koPtBold32() => const TextStyle(
      fontFamily: 'PretendardBold', fontSize: 32, color: AppColor.black);

  static TextStyle koPtBold27() => const TextStyle(
      fontFamily: 'PretendardBold', fontSize: 27, color: AppColor.black);

  static TextStyle koPtBold20() => const TextStyle(
      fontFamily: 'PretendardBold', fontSize: 20, color: AppColor.black);

  static TextStyle koPtBold16() => TextStyle(
      fontFamily: 'PretendardBold', fontSize: ScreenUtil().setSp(16), color: AppColor.black);

  static TextStyle koPtBold16red() => TextStyle(
      fontFamily: 'PretendardBold', fontSize: ScreenUtil().setSp(16), color: AppColor.red);

  static TextStyle koPtBold14darkgrey() => const TextStyle(
      fontFamily: 'PretendardBold', fontSize: 14, color: AppColor.darkgrey);

  static TextStyle koPtSemiBold32() => const TextStyle(
      fontFamily: 'PretendardSemiBold', fontSize: 32, color: AppColor.black);

  static TextStyle koPtSemiBold24() => const TextStyle(
      fontFamily: 'PretendardSemiBold', fontSize: 24, color: AppColor.black);

  static TextStyle koPtSemiBold20white() => const TextStyle(
      fontFamily: 'PretendardSemiBold', fontSize: 20, color: AppColor.white);

  static TextStyle koPtSemiBold16() => const TextStyle(
      fontFamily: 'PretendardSemiBold', fontSize: 16, color: AppColor.black);

  static TextStyle koPtRegular40() => TextStyle(
      fontFamily: 'PretendardRegular', fontSize: ScreenUtil().setSp(40), color: AppColor.black);

  static TextStyle koPtRegular22() => const TextStyle(
      fontFamily: 'PretendardRegular', fontSize: 22, color: AppColor.black);

  static TextStyle koPtRegular18white() => const TextStyle(
      fontFamily: 'PretendardRegular', fontSize: 18, color: AppColor.white);

  static TextStyle koPtRegular16grey() => const TextStyle(
      fontFamily: 'PretendardRegular', fontSize: 16, color: AppColor.grey);

  static TextStyle koPtRegular16() =>  TextStyle(
      fontFamily: 'PretendardRegular', fontSize: ScreenUtil().setSp(16), color: AppColor.black);

  static TextStyle koPtRegular16white() => const TextStyle(
      fontFamily: 'PretendardRegular', fontSize: 16, color: AppColor.white);

  static TextStyle koPtRegular14() => const TextStyle(
      fontFamily: 'PretendardRegular', fontSize: 14, color: AppColor.black);
}
