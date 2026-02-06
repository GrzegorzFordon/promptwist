import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:promptwist/providers/chosen_categories_provider.dart';
import 'package:promptwist/providers/palette_provider.dart';

class PromptCard extends ConsumerWidget {
  final String textCategory;
  final String textItem;
  const PromptCard({super.key, required this.textCategory, required this.textItem});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ThemeData themeData = Theme.of(context);
    List<HSVColor> palette = ref.watch(paletteProvider);
    TextStyle textStyle = GoogleFonts.robotoMono(
      color: themeData.colorScheme.surfaceDim,
      letterSpacing: 1.2,
      fontWeight: FontWeight.bold,
    );
    return GestureDetector(
      key: ValueKey(textCategory),
      onTap: () => ref.read(chosenCategoriesProvider.notifier).remove(textCategory),
      child: AnimatedContainer(
        width: double.infinity,
        duration:const Duration(milliseconds: 500),
        curve: Curves.fastEaseInToSlowEaseOut,
        decoration: BoxDecoration(
          // color: themeData.colorScheme.tertiaryContainer,
          color: palette[3].toColor(),
          borderRadius: BorderRadius.circular(5),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                textCategory,
                key: ValueKey(textCategory),
                style: textStyle.copyWith(fontSize: 14, fontWeight: FontWeight.normal),
              ),
              Text(textItem, key: ValueKey(textItem), style: textStyle.copyWith(fontSize: 28),maxLines: 1,overflow: TextOverflow.ellipsis,),
            ],
          ),
        ),
      ),
    );
  }
}
