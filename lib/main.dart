import 'dart:io';
import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:promptwist/providers/chosen_categories_provider.dart';
import 'package:promptwist/providers/page_controller_provider.dart';
import 'package:promptwist/providers/palette_provider.dart';
import 'package:promptwist/providers/theme_provider.dart';
import 'package:promptwist/views/main_view.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:promptwist/widgets/bottom_bar.dart';
import 'package:promptwist/widgets/categories_eager_initializer.dart';
import 'package:window_manager/window_manager.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb) {
    BrowserContextMenu.disableContextMenu();
  } else if (Platform.isWindows || Platform.isLinux || Platform.isMacOS) {
    await windowManager.ensureInitialized();
    WindowOptions windowOptions = WindowOptions(size: Size(420, 650), minimumSize: Size(420, 650));
    windowManager.waitUntilReadyToShow(windowOptions, () async {
      await windowManager.show();
      await windowManager.focus();
    });
  }

  runApp(ProviderScope(child: CategoriesEagerInitializer(child: const MainApp())));
}

class MainApp extends ConsumerWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    double width = MediaQuery.sizeOf(context).width;
    bool isWide = width >= 600;

    ThemeData themeData = ref.watch(themeProvider);
    List<HSVColor> palette = ref.watch(paletteProvider);
    PageController pageController = ref.watch(pageControllerProvider);

    TextStyle textStyleTitle = GoogleFonts.caveatBrush(
      fontSize: 72,
      fontWeight: FontWeight.bold,
      letterSpacing: 1.2,
      color: palette[2].toColor(),
      shadows: [
        Shadow(color: palette[0].toColor(), offset: Offset(3, 3)),
        Shadow(color: themeData.colorScheme.surfaceDim, offset: Offset(2, 2)),
      ],
    );

    TextStyle textStyleRollButton = GoogleFonts.caveatBrush(
      fontSize: 60,
      letterSpacing: 1.2,
      fontWeight: FontWeight.bold,
      color: themeData.colorScheme.surfaceDim,
    );
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: themeData,
      home: Scaffold(
        appBar: AppBar(
          forceMaterialTransparency: true,
          title: AnimatedDefaultTextStyle(
            style: textStyleTitle,
            duration: Duration(milliseconds: 500),
            curve: Curves.fastEaseInToSlowEaseOut,
            child: Text("PrompTwist"),
          ),
          centerTitle: true,
          clipBehavior: Clip.none,
        ),
        body: MainView(isWide: isWide),
        floatingActionButton: ListenableBuilder(
          listenable: pageController,
          builder: (_, _) {
            double sizeMult = 1 - clampDouble(pageController.hasClients ? pageController.page ?? 0.0 : 0.0, 0.0, 1.0);
            return SizedBox(
              height: isWide ? 0 : 120 * sizeMult,
              width: isWide ? 0 : 120 * sizeMult,
              child: FloatingActionButton(
                shape: CircleBorder(),
                backgroundColor: palette[3].toColor(),
                onPressed: () {
                  ref.read(chosenCategoriesProvider.notifier).roll();
                  ref.read(paletteProvider.notifier).roll();
                },
                child: Text(
                  "ROLL",
                  style: textStyleRollButton.copyWith(fontSize: textStyleRollButton.fontSize! * sizeMult),
                ),
              ),
            );
          },
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: isWide ? null : Bottombar(),
      ),
    );
  }
}
