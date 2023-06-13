import 'package:flutter/material.dart';
import 'package:MEWA/models/category.dart';

class CategoryGridItem extends StatelessWidget {
  const CategoryGridItem(
      {super.key, required this.category, required this.onSelectCategory});

  final Category category;
  final void Function() onSelectCategory;

  Color darken(Color color, [double amount = .1]) {
    assert(amount >= 0 && amount <= 1);

    final hsl = HSLColor.fromColor(color);
    final hslDark = hsl.withLightness((hsl.lightness - amount).clamp(0.0, 1.0));

    return hslDark.toColor();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(15),
      child: InkWell(
        onTap: onSelectCategory,
        splashColor: Theme.of(context).primaryColor,
        borderRadius: BorderRadius.circular(16),
        child: Container(
            height: 100,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                //color: category.color
                gradient: LinearGradient(colors: [
                  darken(category.color, .2),
                  category.color.withOpacity(0.8)
                ], begin: Alignment.topLeft, end: Alignment.bottomRight)),
            child: Align(
                alignment: const Alignment(0, 0),
                child: Text(
                  category.title,
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        color: Theme.of(context).colorScheme.onBackground,
                      ),
                ))),
      ),
    );
  }
}
