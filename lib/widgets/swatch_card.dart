import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SwatchCard extends StatelessWidget {
  // final String colorHexValue;
  final HSVColor color;
  const SwatchCard({super.key, required this.color});

  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    TextStyle textStyleHex = GoogleFonts.robotoMono(color: themeData.colorScheme.onSurfaceVariant, height: 1,fontSize: 18);
    return Expanded(
      child: AnimatedContainer(
        padding: EdgeInsets.all(4.0),
        duration: const Duration(milliseconds: 500),
        curve: Curves.fastEaseInToSlowEaseOut,
        decoration: BoxDecoration(color: color.toColor(), borderRadius: BorderRadius.circular(5)),
        child: Align(
          alignment: Alignment.centerRight,
          child: Container(
            width: 100,
            // height: 45,
            decoration: BoxDecoration(color: themeData.colorScheme.surfaceDim.withAlpha(200), borderRadius: BorderRadius.circular(5)),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal:  8.0),
              child: Center(child: Text(_hexFromColor(color.toColor()), style: textStyleHex)),
            ),
          ),
        ),
      ),
    );
  }
}

String _hexFromColor(Color color) {
  return "#${color.toARGB32().toRadixString(16).toUpperCase().substring(2)}";
}
