import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_money/core/style/app_color.dart';
import 'package:smart_money/generated/fonts.gen.dart';

class AppStyle {
  AppStyle._();

  static TextStyle txtHeader1 = TextStyle(
    fontFamily: FontFamily.itim,
    color: AppColor.darkGreyColor,
    fontSize: 32.sp,
    fontWeight: FontWeight.w700,
    height: 1.4,
  );

  static TextStyle txtHeader2 = TextStyle(
    fontFamily: FontFamily.itim,
    color: AppColor.darkGreyColor,
    fontSize: 24.sp,
    fontWeight: FontWeight.w700,
    height: 1.4,
  );

  static TextStyle txtHeader3 = TextStyle(
    fontFamily: FontFamily.itim,
    color: AppColor.darkGreyColor,
    fontSize: 20.sp,
    fontWeight: FontWeight.w700,
    height: 1.4,
  );

  static TextStyle txtBody = TextStyle(
    fontFamily: FontFamily.itim,
    color: AppColor.darkGreyColor,
    fontSize: 16.sp,
    fontWeight: FontWeight.w600,
    height: 1.5,
  );

  static TextStyle txtBody2 = TextStyle(
    fontFamily: FontFamily.itim,
    color: AppColor.darkGreyColor,
    fontSize: 14.sp,
    fontWeight: FontWeight.w400,
    height: 1.5,
  );

  static TextStyle txtCaption = TextStyle(
    fontFamily: FontFamily.itim,
    color: AppColor.darkGreyColor,
    fontSize: 12.sp,
    fontWeight: FontWeight.w600,
    height: 1.33,
  );

  static TextStyle txtError = TextStyle(
    fontFamily: FontFamily.itim,
    color: AppColor.errorColor,
    fontSize: 12.sp,
    fontWeight: FontWeight.w600,
    height: 1.33,
  );
}
