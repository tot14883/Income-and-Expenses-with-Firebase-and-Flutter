import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:smart_money/core/style/app_color.dart';

class BaseAppBar extends StatelessWidget implements PreferredSizeWidget {
  const BaseAppBar({
    Key? key,
    this.leading,
    this.leadingWidth,
    this.title,
    required this.bgColor,
    this.isCenterTitle,
    this.iconThemeData,
    this.elevation,
    this.actions,
    this.titleSpacing,
    this.hideBackButton = false,
    this.bottom,
  }) : super(key: key);

  final Widget? leading;
  final double? leadingWidth;
  final Widget? title;
  final Color bgColor;
  final bool? isCenterTitle;
  final IconThemeData? iconThemeData;
  final double? elevation;
  final List<Widget>? actions;
  final double? titleSpacing;
  final bool hideBackButton;
  final PreferredSizeWidget? bottom;

  @override
  Widget build(BuildContext context) {
    Widget? _leading;
    if (leading == null) {
      _leading = IconButton(
        onPressed: () {
          context.pop();
        },
        icon: const Icon(
          Icons.arrow_back_ios,
          color: AppColor.darkGreyColor,
          size: 16.0,
        ),
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
      );
    }
    return AppBar(
      titleSpacing: titleSpacing?.w ?? 0,
      leading: hideBackButton ? Container() : leading ?? _leading,
      leadingWidth: hideBackButton ? 0 : leadingWidth?.w,
      title: title,
      centerTitle: isCenterTitle ?? false,
      backgroundColor: bgColor,
      iconTheme: iconThemeData,
      actions: actions,
      elevation: elevation ?? 2,
      bottom: bottom,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(
        kToolbarHeight + (bottom?.preferredSize.height.h ?? 0.0),
      );
}
