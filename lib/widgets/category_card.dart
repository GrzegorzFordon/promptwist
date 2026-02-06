import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:promptwist/providers/chosen_categories_provider.dart';
import 'package:promptwist/providers/palette_provider.dart';

class CategoryCard extends ConsumerWidget {
  final String title;
  const CategoryCard({super.key, required this.title});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<HSVColor> palette = ref.watch(paletteProvider);

    var chosenCategories = ref.watch(chosenCategoriesProvider);
    bool isActive = chosenCategories.any((element) => element.$1 == title);
    ThemeData themeData = Theme.of(context);
    TextStyle style = GoogleFonts.robotoMono(
      color: isActive ? palette[3].toColor() : themeData.colorScheme.surfaceDim,
      fontSize: 20,
      // fontWeight: FontWeight.w200
    );
    Color color = isActive ? themeData.colorScheme.onTertiary : palette[3].toColor();
    return MouseRegion(
      cursor: isActive ? SystemMouseCursors.basic : SystemMouseCursors.click,
      child: GestureDetector(
        onTap: !isActive ? () => ref.read(chosenCategoriesProvider.notifier).add(title) : null,
        child: AnimatedContainer(
          duration:const Duration(milliseconds: 500),
          curve: Curves.fastEaseInToSlowEaseOut,
          padding:const EdgeInsets.all(4.0),
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(5),
            boxShadow: isActive
                ? null
                : [BoxShadow(offset: Offset(1, 1), blurRadius: 1, color: themeData.colorScheme.onSecondaryFixed)],
          ),
          child: Center(
            child: Text(title, style: style, maxLines: 1, overflow: TextOverflow.ellipsis),
          ),
        ),
      ),
    );
  }
}
