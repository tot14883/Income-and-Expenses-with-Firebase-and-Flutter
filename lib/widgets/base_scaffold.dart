import 'package:flutter/material.dart';
import 'package:smart_money/widgets/dialogs/loading_dialog.dart';

class BaseScaffold extends StatelessWidget {
  final Widget Function(BuildContext, BoxConstraints) bodyBuilder;
  final Widget? bottomNavigationBar;
  final Widget? bottomSheet;
  final PreferredSizeWidget? appBar;
  final bool extendBodyBehindAppBar;
  final bool resizeToAvoidBottomInset;
  final Color? bgColor;
  final bool isSafeBottom;
  final bool isSafeTop;
  final bool hasAppBar;
  final bool isAppearBottomBarWhenKeyboardShowing;
  final bool isWillPop;
  final Stream<bool>? isLoadingStream;
  final Widget? drawer;
  final String? imgBgPath;
  final BoxFit? fit;

  const BaseScaffold({
    Key? key,
    required this.bodyBuilder,
    this.bgColor,
    this.appBar,
    this.extendBodyBehindAppBar = false,
    this.resizeToAvoidBottomInset = true,
    this.isSafeBottom = true,
    this.isSafeTop = true,
    this.bottomNavigationBar,
    this.bottomSheet,
    this.hasAppBar = false,
    this.isAppearBottomBarWhenKeyboardShowing = false,
    this.isWillPop = false,
    this.isLoadingStream,
    this.drawer,
    this.imgBgPath,
    this.fit,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        WillPopScope(
          onWillPop: () async => isWillPop,
          child: Scaffold(
            drawer: drawer,
            bottomNavigationBar: Padding(
              padding: isAppearBottomBarWhenKeyboardShowing
                  ? MediaQuery.of(context).viewInsets
                  : EdgeInsets.zero,
              child: bottomNavigationBar,
            ),
            body: Container(
              height: MediaQuery.of(context).size.height,
              decoration: imgBgPath != null
                  ? BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(imgBgPath ?? ''),
                        fit: fit ?? BoxFit.fill,
                      ),
                    )
                  : null,
              child: GestureDetector(
                behavior: HitTestBehavior.translucent,
                onTap: () {
                  // for remove primary focus and trigger the keyboard to dismiss.
                  FocusManager.instance.primaryFocus?.unfocus();
                },
                child: SafeArea(
                  bottom: isSafeBottom,
                  top: isSafeTop,
                  child: LayoutBuilder(
                    builder: bodyBuilder,
                  ),
                ),
              ),
            ),
            appBar: appBar,
            backgroundColor: bgColor ?? Colors.white,
            extendBodyBehindAppBar: extendBodyBehindAppBar,
            resizeToAvoidBottomInset: resizeToAvoidBottomInset,
            bottomSheet: bottomSheet,
          ),
        ),
        if (isLoadingStream != null) LoadingDialog.stream(isLoadingStream!),
      ],
    );
  }
}
