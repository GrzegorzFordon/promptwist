import 'package:flutter/material.dart';

class CommonContainer extends StatelessWidget {
  final Widget? child;
  const CommonContainer({super.key, this.child});

  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    return Container(
      decoration: BoxDecoration(color: themeData.colorScheme.surfaceContainer, borderRadius: BorderRadius.circular(5)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: child,
      ),
    );
  }
}
