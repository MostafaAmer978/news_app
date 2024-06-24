import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/my_provider.dart';
import 'package:provider/provider.dart';

class ShowBottomSheet extends StatelessWidget {
  const ShowBottomSheet({super.key});

  static const int englishLanguage = 1;
  static const int arabicLanguage = 2;

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<MyProvider>(context);
    return ChangeNotifierProvider<MyProvider>(
      create: (context) => MyProvider(),
      builder: (context, child) => Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  "english".tr(),
                  style: GoogleFonts.getFont(
                    "Inter",
                    color: Colors.white,
                    fontSize: 23,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Expanded(
                  child: SizedBox(
                    width: double.infinity,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    provider.getClickLanguage(englishLanguage);
                    Navigator.pop(context);
                    context.setLocale(const Locale("en"));
                  },
                  icon: Icon(
                    provider.isEnglish == true
                        ? Icons.check_box
                        : Icons.check_box_outline_blank_outlined,
                    color: Colors.white,
                    size: 28,
                  ),
                )
              ],
            ),
            Row(
              children: [
                Text(
                  "arabic".tr(),
                  style: GoogleFonts.getFont(
                    "Inter",
                    color: Colors.white,
                    fontSize: 23,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Expanded(
                  child: SizedBox(
                    width: double.infinity,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    provider.getClickLanguage(arabicLanguage);
                    Navigator.pop(context);
                    context.setLocale(const Locale("ar"));
                  },
                  icon: Icon(
                    provider.isEnglish == false
                        ? Icons.check_box
                        : Icons.check_box_outline_blank_outlined,
                    color: Colors.white,
                    size: 28,
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
