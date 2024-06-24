import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/models/category_model.dart';

class CategoryItem extends StatelessWidget {
  final CategoryModel model;
  final int index;

  const CategoryItem({super.key, required this.model, required this.index});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: model.color,
          borderRadius: BorderRadiusDirectional.only(
            bottomEnd:
                index.isEven ? const Radius.circular(25) : Radius.zero,
            bottomStart:
                index.isOdd ? const Radius.circular(25) : Radius.zero,
            topStart: const Radius.circular(25),
            topEnd: const Radius.circular(25),
          )),
      child: Column(
        children: [
          Expanded(
              child: Image.asset(
            model.image,
            fit: BoxFit.cover,
          )),
          Text(
            model.title,
            style: GoogleFonts.getFont("Exo",
                color: Colors.white,
                fontSize: 22,
                fontWeight: FontWeight.w400),
          )
        ],
      ),
    );
  }
}
