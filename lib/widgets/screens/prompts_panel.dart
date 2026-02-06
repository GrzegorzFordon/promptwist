
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:promptwist/providers/chosen_categories_provider.dart';
import 'package:promptwist/widgets/common/common_container.dart';
import 'package:promptwist/widgets/prompt_card.dart';

class PromptsPanel extends ConsumerWidget {
  const PromptsPanel({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<(String, String)> chosenCategories = ref.watch(chosenCategoriesProvider);
    return CommonContainer(
      child: ReorderableListView.builder(

        itemBuilder: (context, index) => Padding(
          key: ValueKey(index),
          padding: const EdgeInsets.symmetric(vertical: 2.0),
          child: PromptCard(textCategory: chosenCategories[index].$1, textItem: chosenCategories[index].$2),
        ),
        // separatorBuilder: (context, index) => SizedBox(height: 5),
        itemCount: chosenCategories.length,
        onReorder: (int oldIndex, int newIndex) {
          if(oldIndex<newIndex)newIndex--;
          final item = chosenCategories.removeAt(oldIndex);
          chosenCategories.insert(newIndex, item);
        },
      ),
    );
    // return Text("$chosenCategories");
  }
}
