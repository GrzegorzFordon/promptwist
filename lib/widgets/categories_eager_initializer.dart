// ignore: implementation_imports
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:promptwist/providers/chosen_categories_provider.dart';

class CategoriesEagerInitializer extends ConsumerWidget {
  final Widget child;
  const CategoriesEagerInitializer({super.key, required this.child});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (ref.read(chosenCategoriesProvider).isEmpty) ref.read(chosenCategoriesProvider.notifier).addRandom(2);
    return child;
  }
}
