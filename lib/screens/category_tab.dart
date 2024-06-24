import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:news_app/models/category_model.dart';
import 'package:news_app/my_theme.dart';
import 'package:news_app/widgets/category_item.dart';

class CategoryTab extends StatelessWidget {
  final Function onClick;

  CategoryTab({super.key, required this.onClick});

  var categories = CategoryModel.getCategory();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          Text(
            maxLines: 2,
            textAlign: TextAlign.center,
            "pick_your_category_of_interest".tr(),
            style: Theme.of(context).textTheme.titleSmall!.copyWith(
                color: MyThemeData.blackColor,
                fontSize: 30,
                fontWeight: FontWeight.bold),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.only(top: 25),
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 20),
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      onClick(categories[index]);
                    },
                    child: CategoryItem(
                      model: categories[index],
                      index: index,
                    ),
                  );
                },
                itemCount: categories.length,
              ),
            ),
          )
        ],
      ),
    );
  }
}
