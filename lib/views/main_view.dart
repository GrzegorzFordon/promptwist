
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:promptwist/providers/page_controller_provider.dart';
import 'package:promptwist/views/category_view.dart';
import 'package:promptwist/widgets/roll_button.dart';
import 'package:promptwist/widgets/screens/prompts_panel.dart';
import 'package:promptwist/widgets/screens/swatches_panel.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class MainView extends StatelessWidget {
  final bool isWide;
  const MainView({super.key, required this.isWide});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(padding: EdgeInsetsGeometry.all(8.0), child: isWide ? MainViewTwoPanels() : MainViewSinglePanel()),
      ],
    );
  }
}

class MainViewSinglePanel extends HookConsumerWidget {
  const MainViewSinglePanel({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var pageController = ref.watch(pageControllerProvider);

    return PageView(
      pageSnapping: true,
      controller: pageController,
      scrollDirection: Axis.horizontal,
      children: [HomePage(), CategoryPage(withButton: false)],
    );
  }
}

class MainViewTwoPanels extends StatelessWidget {
  const MainViewTwoPanels({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 8,
      children: [
        Expanded(flex: 3, child: HomePage()),
        Expanded(flex: 2, child: CategoryPage(withButton: true)),
      ],
    );
  }
}

class HomePage extends HookWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    var ratio = useState(0.5);

    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        var maxHeight = constraints.maxHeight - 12;
        return Column(
          // spacing: 2,
          children: [
            SizedBox(height: maxHeight * ratio.value, child: PromptsPanel()),
            Container(
              height: 8,
              // color: Colors.pink,
              child: MouseRegion(
                cursor: SystemMouseCursors.resizeRow,
                child: GestureDetector(
                  onVerticalDragUpdate: (details) {
                    ratio.value += details.delta.dy / maxHeight;
                    ratio.value = ratio.value.clamp(0.2, 0.8);
                  },
                ),
              ),
            ),
            SizedBox(height: maxHeight * (1 - ratio.value), child: SwatchesPanel()),
          ],
        );
      },
    );
  }
}

class CategoryPage extends StatelessWidget {
  final bool withButton;
  const CategoryPage({super.key, required this.withButton});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 8,
      children: [
        Expanded(child: CategoryView()),
        if (withButton) RollButton(),
      ],
    );
  }
}
