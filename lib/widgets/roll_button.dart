import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:promptwist/providers/chosen_categories_provider.dart';
import 'package:promptwist/providers/palette_provider.dart';

class RollButton extends ConsumerWidget {
  const RollButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ThemeData themeData = Theme.of(context);
    List<HSVColor> palette = ref.watch(paletteProvider);

    TextStyle textStyle = GoogleFonts.caveatBrush(
      fontSize: 72,
      color: themeData.colorScheme.surfaceDim,
      fontWeight: FontWeight.bold,
    );

    return AnimatedContainer(
      duration: Duration(milliseconds: 500),
      curve: Curves.fastEaseInToSlowEaseOut,
      decoration: BoxDecoration(color: palette[4].toColor(), borderRadius: BorderRadius.circular(5)),
      width: double.infinity,
      height: 100,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(5),
        child: Material(
          color: palette[4].toColor(),
          child: InkWell(
            onTap: () {
              ref.read(chosenCategoriesProvider.notifier).roll();
              ref.read(paletteProvider.notifier).roll();
            },
            child: Center(
              child: Text("ROLL", style: textStyle, overflow: TextOverflow.clip),
            ),
          ),
        ),
      ),
    );
  }
}
