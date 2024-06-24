import 'dart:ui';

import 'package:easy_localization/easy_localization.dart';

class CategoryModel {
  String id;
  String title;
  String image;
  Color color;

  CategoryModel(
      {required this.id,
      required this.title,
      required this.image,
      required this.color});

  static List<CategoryModel> getCategory() {
    return [
      CategoryModel(
          id: "sports",
          title: "sports".tr(),
          image: "assets/images/sports.png",
          color: const Color(0xFFC91C22)),
      CategoryModel(
          id: "general",
          title: "politics".tr(),
          image: "assets/images/Politics.png",
          color: const Color(0xFF003E90)),
      CategoryModel(
          id: "health",
          title: "health".tr(),
          image: "assets/images/health.png",
          color: const Color(0xFFED1E79)),
      CategoryModel(
          id: "business",
          title: "business".tr(),
          image: "assets/images/business.png",
          color: const Color(0xFFCF7E48)),
      CategoryModel(
          id: "entertainment",
          title: "environment".tr(),
          image: "assets/images/environment.png",
          color: const Color(0xFF4882CF)),
      CategoryModel(
          id: "science",
          title: "science".tr(),
          image: "assets/images/science.png",
          color: const Color(0xFFF2D352)),
    ];
  }
}
