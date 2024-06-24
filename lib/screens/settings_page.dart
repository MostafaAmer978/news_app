import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/my_provider.dart';
import 'package:news_app/widgets/show_bottom_sheet.dart';
import 'package:provider/provider.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<MyProvider>(context);
    return ChangeNotifierProvider<MyProvider>(
      create: (context) => MyProvider(),
      builder: (context, child) => Container(
        padding: const EdgeInsets.all(30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("language".tr(),
                style: GoogleFonts.getFont("Poppins",
                    fontWeight: FontWeight.w700, fontSize: 15)),
            const SizedBox(
              height: 20,
            ),
            InkWell(
              onTap: () {
                // emit(ShowBottomSheet());
                showModalBottomSheet(
                  isDismissible: true,
                  isScrollControlled: false,
                  backgroundColor: const Color(0xFF39A552),
                  context: context,
                  builder: (context) {
                    return const ShowBottomSheet();
                  },
                );
              },
              child: Container(
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                    border: Border.all(color: const Color(0xFF39A552))),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                        provider.selectedLanguage == "en"
                            ? "english".tr()
                            : "arabic".tr(),
                        style: GoogleFonts.getFont("Inter",
                            fontWeight: FontWeight.w400,
                            fontSize: 17,
                            color: const Color(0xFF39A552))),
                    const Icon(Icons.keyboard_arrow_down,
                        color: Color(0xFF39A552))
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
