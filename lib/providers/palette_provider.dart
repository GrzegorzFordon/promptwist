import 'dart:math';

import 'package:flutter/painting.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'palette_provider.g.dart';

@riverpod
class Palette extends _$Palette {
  @override
  List<HSVColor> build() {
    return _getNewPalette();
  }

  void roll() {
    state = _getNewPalette();
  }

  List<HSVColor> _getNewPalette() {
    ColorShiftModel shiftModel = ColorShiftModel(20, .15, .15, .15);
    List<HSVColor> newPalette;
    double rnd = Random().nextDouble();

    newPalette = switch (rnd) {
      > .25 => _getComplementaryPalette(shiftModel),
      > .5 => _getMonochromePalette(shiftModel),
      > .75 => _getTriadicPalette(shiftModel),
      double() => _getTetradicPalette(shiftModel),
    };

    newPalette = _getOverlaidPalette(newPalette);

    return newPalette;
  }

  List<HSVColor> _getComplementaryPalette(ColorShiftModel shiftModel) {
    List<HSVColor> newPalette = [];
    HSVColor baseColor = _getRandomColor();
    HSVColor complementaryColor = HSVColor.fromAHSV(
      1,
      (baseColor.hue + 180) % 360,
      1 - baseColor.saturation,
      1 - baseColor.value,
    );
    newPalette.add(_getShiftedColor(baseColor, shiftModel, -2));
    newPalette.add(_getShiftedColor(baseColor, shiftModel, -1));
    newPalette.add(baseColor);
    newPalette.add(complementaryColor);
    newPalette.add(_getShiftedColor(complementaryColor, shiftModel, 1));

    return newPalette;
  }

  List<HSVColor> _getMonochromePalette(ColorShiftModel shiftModel) {
    List<HSVColor> newPalette = [];
    HSVColor baseColor = _getRandomColor();
    newPalette.add(_getShiftedColor(baseColor, shiftModel, -2));
    newPalette.add(_getShiftedColor(baseColor, shiftModel, -1));
    newPalette.add(baseColor);
    newPalette.add(_getShiftedColor(baseColor, shiftModel, 1));
    newPalette.add(_getShiftedColor(baseColor, shiftModel, 2));

    return newPalette;
  }

  List<HSVColor> _getTriadicPalette(ColorShiftModel shiftModel) {
    List<HSVColor> newPalette = [];
    HSVColor baseColor = _getRandomColor();
    HSVColor shiftedColorA = HSVColor.fromAHSV(
      1,
      (baseColor.hue + 120) % 360,
      1 - baseColor.saturation,
      1 - baseColor.value,
    );
    HSVColor shiftedColorB = HSVColor.fromAHSV(
      1,
      (baseColor.hue - 120) % 360,
      1 - baseColor.saturation,
      1 - baseColor.value,
    );

    newPalette.add(_getShiftedColor(shiftedColorA, shiftModel, -1));
    newPalette.add(shiftedColorA);
    newPalette.add(baseColor);
    newPalette.add(shiftedColorB);
    newPalette.add(_getShiftedColor(shiftedColorB, shiftModel, 1));

    return newPalette;
  }

  List<HSVColor> _getTetradicPalette(ColorShiftModel shiftModel) {
    List<HSVColor> newPalette = [];
    HSVColor baseColor = _getRandomColor();
    HSVColor shiftedBaseColor = HSVColor.fromAHSV(
      1,
      (baseColor.hue + 90) % 360,
      1 - baseColor.saturation,
      1 - baseColor.value,
    );

    HSVColor complementaryColor = HSVColor.fromAHSV(
      1,
      (baseColor.hue + 180) % 360,
      1 - baseColor.saturation,
      1 - baseColor.value,
    );
    HSVColor shiftedComplementaryColor = HSVColor.fromAHSV(
      1,
      (complementaryColor.hue + 90) % 360,
      1 - baseColor.saturation,
      1 - baseColor.value,
    );

    newPalette.add(_getShiftedColor(shiftedBaseColor, shiftModel, -1));
    newPalette.add(shiftedBaseColor);
    newPalette.add(baseColor);
    newPalette.add(complementaryColor);
    newPalette.add(shiftedComplementaryColor);
    return newPalette;
  }

  HSVColor _getRandomColor() {
    final rndHue = Random().nextDouble() * 360;
    final rndSat = 0.4 + Random().nextDouble() * 0.2;
    final rndVal = 0.4 + Random().nextDouble() * 0.2;
    HSVColor rndColor = HSVColor.fromAHSV(1.0, rndHue, rndSat, rndVal);
    return rndColor;
  }

  HSVColor _getShiftedColor(HSVColor base, ColorShiftModel shiftModel, int stepAmount) {
    Random random = Random();
    final hueDelta = shiftModel.maxDelta * random.nextDouble() * 10;
    final satDelta = shiftModel.maxDelta * random.nextDouble();
    final valDelta = shiftModel.maxDelta * random.nextDouble();

    final shiftedHue = (base.hue + (shiftModel.hueStep + hueDelta) * stepAmount).clamp(0.0, 360.0);
    final shiftedSat = (base.saturation + (shiftModel.satStep + satDelta) * stepAmount).clamp(0.0, 1.0);
    final shiftedVal = (base.value + (shiftModel.valStep + valDelta) * stepAmount).clamp(0.0, 1.0);

    final shiftedColor = HSVColor.fromAHSV(1.0, shiftedHue, shiftedSat, shiftedVal);
    return shiftedColor;
  }

  List<HSVColor> _getOverlaidPalette(List<HSVColor> base) {
    final overlayAlpha = 0.2 + (0.6 - 0.2) * Random().nextDouble();
    final overlayColor = _getRandomColor().withAlpha(overlayAlpha);
    List<HSVColor> overlaidPalette = base;
    for (int i = 0; i < base.length; i++) {
      overlaidPalette[i] = HSVColor.fromColor(Color.alphaBlend(overlayColor.toColor(), overlaidPalette[i].toColor()));
    }
    return overlaidPalette;
  }
}

class ColorShiftModel {
  ColorShiftModel(this.hueStep, this.satStep, this.valStep, this.maxDelta);

  final double hueStep;
  final double satStep;
  final double valStep;

  final double maxDelta;
}
