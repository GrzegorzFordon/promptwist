import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ActivePaletteTypesWidget extends ConsumerWidget {
  const ActivePaletteTypesWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Row(
      children: [
        IconButton(onPressed: () {
          
        }, icon: Icon(Icons.abc))
      ],
    );
  }
}
