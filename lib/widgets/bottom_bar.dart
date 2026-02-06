import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';
import 'package:promptwist/providers/page_controller_provider.dart';
import 'package:promptwist/providers/palette_provider.dart';

class Bottombar extends HookConsumerWidget {
  const Bottombar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    PageController pageController = ref.watch(pageControllerProvider);

    return BottomAppBar(
      shape: const CircularNotchedRectangle(),
      notchMargin: 8.0,
      height: 72,
      child: ListenableBuilder(
        listenable: pageController,
        builder: (BuildContext context, Widget? child) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              ViewButton(myPage: 0, iconData: Symbols.home_rounded, curPage: pageController.page ?? 0.0),
              ViewButton(myPage: 1, iconData: Symbols.bookmark_stacks_rounded, curPage: pageController.page ?? 0.0),
            ],
          );
        },
      ),
    );
  }
}

class ViewButton extends ConsumerWidget {
  final int myPage;
  final double curPage;
  final IconData iconData;
  const ViewButton({super.key, required this.myPage, required this.curPage, required this.iconData});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<HSVColor> palette = ref.watch(paletteProvider);
    PageController pageController = ref.watch(pageControllerProvider);
    bool isActive = curPage != myPage;
    Duration duration = const Duration(milliseconds: 500);
    Curve curve = Curves.fastEaseInToSlowEaseOut;
    return IconButton(
      onPressed: isActive ? () => pageController.animateToPage(myPage, duration: duration, curve: curve) : null,
      icon: Icon(iconData, size: 32, color: palette[2].toColor()),
    );
  }
}
