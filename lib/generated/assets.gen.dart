/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';

class $AssetsImgsGen {
  const $AssetsImgsGen();

  /// File path: assets/imgs/img_bg.jpg
  AssetGenImage get imgBg => const AssetGenImage('assets/imgs/img_bg.jpg');

  /// File path: assets/imgs/img_calendar.png
  AssetGenImage get imgCalendar =>
      const AssetGenImage('assets/imgs/img_calendar.png');

  /// File path: assets/imgs/img_email.png
  AssetGenImage get imgEmail =>
      const AssetGenImage('assets/imgs/img_email.png');

  /// File path: assets/imgs/img_logo_app.png
  AssetGenImage get imgLogoApp =>
      const AssetGenImage('assets/imgs/img_logo_app.png');

  /// File path: assets/imgs/img_password.png
  AssetGenImage get imgPassword =>
      const AssetGenImage('assets/imgs/img_password.png');

  /// List of all assets
  List<AssetGenImage> get values =>
      [imgBg, imgCalendar, imgEmail, imgLogoApp, imgPassword];
}

class Assets {
  Assets._();

  static const $AssetsImgsGen imgs = $AssetsImgsGen();
}

class AssetGenImage {
  const AssetGenImage(this._assetName);

  final String _assetName;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = false,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.low,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  ImageProvider provider({
    AssetBundle? bundle,
    String? package,
  }) {
    return AssetImage(
      _assetName,
      bundle: bundle,
      package: package,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
