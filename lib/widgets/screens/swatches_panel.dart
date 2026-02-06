import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:promptwist/providers/palette_provider.dart';
import 'package:promptwist/widgets/common/common_container.dart';
import 'package:promptwist/widgets/swatch_card.dart';

class SwatchesPanel extends ConsumerWidget {
  const SwatchesPanel({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<HSVColor> paletteModel = ref.watch(paletteProvider);
    return CommonContainer(
      child: SizedBox(
        width: double.infinity,
        child: Column(spacing: 5, children: [for (int i = 0; i < 5; i++) SwatchCard(color: paletteModel[i])]),
      ),
    );
  }
}