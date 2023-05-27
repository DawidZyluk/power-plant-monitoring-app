import 'package:flutter/material.dart';
import 'package:mewa/models/category.dart';

class CategoryGridItem extends StatelessWidget {
  const CategoryGridItem({super.key, required this.category, required this.onSelectCategory});

  final Category category;
  final void Function() onSelectCategory;

  
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onSelectCategory,
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        // padding: const EdgeInsets.all(16),
        height: 100,
        margin: const EdgeInsets.only(top: 25, left: 25, right: 25),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: category.color
          // gradient: LinearGradient(
          //   colors: [
          //     category.color.withOpacity(0.55),
          //     category.color.withOpacity(0.9)
          //   ],
          //   begin: Alignment.topLeft,
          //   end: Alignment.bottomRight
          // )
        ),
        child: Align(
          alignment: const Alignment(0, 0),
          child: Text(
          category.title, 
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
            color: Theme.of(context).colorScheme.onBackground,
          ),)
        )
      ),
    );
  }
}
