/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';

class $ImagesGen {
  const $ImagesGen();

  /// File path: images/banking.png
  AssetGenImage get banking => const AssetGenImage('images/banking.png');

  /// File path: images/hard_working.png
  AssetGenImage get hardWorking =>
      const AssetGenImage('images/hard_working.png');

  /// File path: images/icon_add.png
  AssetGenImage get iconAdd => const AssetGenImage('images/icon_add.png');

  /// File path: images/icon_edit.png
  AssetGenImage get iconEdit => const AssetGenImage('images/icon_edit.png');

  /// File path: images/icon_time.png
  AssetGenImage get iconTime => const AssetGenImage('images/icon_time.png');

  /// File path: images/meditate.png
  AssetGenImage get meditate => const AssetGenImage('images/meditate.png');

  /// File path: images/social_frends.png
  AssetGenImage get socialFrends =>
      const AssetGenImage('images/social_frends.png');

  /// File path: images/work_meeting.png
  AssetGenImage get workMeeting =>
      const AssetGenImage('images/work_meeting.png');

  /// File path: images/workout.png
  AssetGenImage get workout => const AssetGenImage('images/workout.png');

  /// List of all assets
  List<AssetGenImage> get values => [
        banking,
        hardWorking,
        iconAdd,
        iconEdit,
        iconTime,
        meditate,
        socialFrends,
        workMeeting,
        workout
      ];
}

class Assets {
  Assets._();

  static const $ImagesGen images = $ImagesGen();
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
