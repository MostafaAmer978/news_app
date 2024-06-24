import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DrawerPage extends StatelessWidget {
  final Function onClick;

  const DrawerPage({required this.onClick, super.key});

  static int categoryId = 1;
  static int settingsId = 2;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            bottomRight: const Radius.circular(30),
            topRight: const Radius.circular(30),
          ),
          color: Colors.white),
      width: MediaQuery.of(context).size.width * 0.75,
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
                color: const Color(0xFF39A552),
                borderRadius:
                    BorderRadius.only(topRight: const Radius.circular(30))),
            height: 120,
            child: Center(
              child: Text(
                "news_app!".tr(),
                style: GoogleFonts.getFont("Poppins",
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.w700),
              ),
            ),
          ),
          Container(
            padding:
                EdgeInsetsDirectional.only(top: 12, start: 12, end: 12),
            child: Column(
              children: [
                InkWell(
                  onTap: () {
                    onClick(categoryId);
                  },
                  child: Row(
                    children: [
                      const Icon(
                        Icons.category_rounded,
                        color: Color(0xFF303030),
                        size: 30,
                      ),
                      SizedBox(
                        width: 7,
                      ),
                      Text(
                        "categories".tr(),
                        style: GoogleFonts.getFont("Poppins",
                            fontSize: 24,
                            fontWeight: FontWeight.w700,
                            color: const Color(0xFF303030)),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                InkWell(
                  onTap: () {
                    onClick(settingsId);
                  },
                  child: Row(
                    children: [
                      const Icon(
                        Icons.settings,
                        color: Color(0xFF303030),
                        size: 30,
                      ),
                      SizedBox(
                        width: 7,
                      ),
                      Text(
                        "settings".tr(),
                        style: GoogleFonts.getFont("Poppins",
                            fontSize: 24,
                            fontWeight: FontWeight.w700,
                            color: const Color(0xFF303030)),
                      )
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
