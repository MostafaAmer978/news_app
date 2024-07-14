import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/models/news_data_model.dart';
import 'package:news_app/my_theme.dart';
import 'package:url_launcher/url_launcher.dart';

class ArticleItemDetails extends StatelessWidget {
  static const String routeName = "ArticleItemDetails";

  const ArticleItemDetails({super.key});

  @override
  Widget build(BuildContext context) {
    var articleArgument =
        ModalRoute.of(context)!.settings.arguments! as Articles;
    return Container(
      height: MediaQuery.of(context).size.height,
      decoration: const BoxDecoration(
        color: Colors.white,
        image: DecorationImage(
          fit: BoxFit.fill,
          image: AssetImage("assets/images/background.png"),
        ),
      ),
      child: Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(70),
          child: AppBar(
            title: Text("article_details".tr()),
            shape: Theme.of(context).appBarTheme.shape,
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: CachedNetworkImage(
                  imageUrl: articleArgument.urlToImage ?? "",
                  width: MediaQuery.of(context).size.width,
                  fit: BoxFit.fill,
                  height: 300,
                  progressIndicatorBuilder: (context, url, progress) =>
                      const Center(child: CircularProgressIndicator()),
                  errorWidget: (context, url, error) =>
                      const Center(child: Icon(Icons.error)),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(articleArgument.source!.name ?? "",
                        style: GoogleFonts.getFont("Poppins",
                            color: MyThemeData.greyColor,
                            fontSize: 15,
                            fontWeight: FontWeight.bold)),
                    SizedBox(
                      height: 10,
                    ),
                    Text(articleArgument.description ?? "",
                        style: GoogleFonts.getFont("Poppins",
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                            fontSize: 15)),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                            articleArgument.publishedAt
                                .toString()
                                .substring(0, 10),
                            style: GoogleFonts.getFont("Poppins",
                                color: MyThemeData.greyColor,
                                fontSize: 15,
                                fontWeight: FontWeight.w500)),
                        const Text("  &  "),
                        Text(
                            articleArgument.publishedAt
                                .toString()
                                .substring(11, 16),
                            style: GoogleFonts.getFont("Poppins",
                                color: MyThemeData.greyColor,
                                fontSize: 15,
                                fontWeight: FontWeight.w500)),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(articleArgument.content ?? "",
                        style: GoogleFonts.getFont(
                          "Poppins",
                          color: MyThemeData.blackColor,
                          fontWeight: FontWeight.w500,
                          fontSize: 15,
                        )),
                    SizedBox(
                      height: 20,
                    ),
                    InkWell(
                      onTap: () {
                        getArticleURL(articleArgument.url ?? "");
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            "view_full_article".tr(),
                            style: GoogleFonts.getFont("Poppins",
                                fontWeight: FontWeight.bold,
                                color: const Color(0xFF42505C)),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          const Icon(
                            Icons.play_arrow,
                            color: Color(0xFF42505C),
                            size: 17,
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],

          ),
        ),
      ),
    );
  }

  void getArticleURL(String articleURL) {
    Uri url = Uri.parse(articleURL);
    launchUrl(url, mode: LaunchMode.inAppWebView);
  }
}
