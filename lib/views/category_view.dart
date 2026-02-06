import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:promptwist/providers/data_provider.dart';
import 'package:promptwist/widgets/category_card.dart';
import 'package:promptwist/widgets/common/common_container.dart';

class CategoryView extends ConsumerWidget {
  const CategoryView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var data = ref.watch(dataProvider);
    
    List<String> keys = data.maybeWhen(data: (data) => data.data.keys.toList(), orElse: () => []);
    return CommonContainer(
      child: SizedBox(
        width: double.infinity,
        child: ListView.separated(
          itemBuilder: (_, index) => CategoryCard(title: keys[index]),
          separatorBuilder: (_, _) => SizedBox(height: 5),
          itemCount: keys.length,
        ),
      ),
    );
  }
}
