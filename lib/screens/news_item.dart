import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/models/news_data_model.dart';
import 'package:news_app/my_theme.dart';
import 'package:news_app/screens/article_item_details.dart';

class NewsItem extends StatelessWidget {
  final Articles article;

  const NewsItem({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, ArticleItemDetails.routeName,
            arguments: article);
      },
      child: Container(
        margin: const EdgeInsets.all(12),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(const Radius.circular(15)),
            border: Border.all(color: Colors.black, width: 2),
            color: Colors.white),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(13),
              child: CachedNetworkImage(
                imageUrl: article.urlToImage ?? "",
                width: MediaQuery.of(context).size.width,
                height: 250,
                fit: BoxFit.fill,
                progressIndicatorBuilder: (context, url, downloadProgress) =>
                    Center(
                  child: CircularProgressIndicator(
                      value: downloadProgress.progress),
                ),
                errorWidget: (context, url, error) =>
                    const Center(child: Icon(Icons.error)),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(article.source?.name ?? "",
                      style: Theme.of(context).textTheme.titleSmall!.copyWith(
                          color: MyThemeData.greyColor,
                          fontSize: 13,
                          fontWeight: FontWeight.bold)),
                  Text(article.title ?? "",
                      style: Theme.of(context).textTheme.titleSmall!.copyWith(
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                          fontSize: 15)),
                  Text(article.description ?? "",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.titleSmall!.copyWith(
                            color: MyThemeData.blackColor,
                            fontWeight: FontWeight.w500,
                            fontSize: 15,
                          )),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(article.publishedAt.toString().substring(0, 10),
                          style: GoogleFonts.getFont(
                            "Inter",
                            color: MyThemeData.greyColor,
                            fontWeight: FontWeight.w500,
                            fontSize: 13,
                          )),
                      const Text("  &  "),
                      Text(article.publishedAt.toString().substring(11, 16),
                          style: GoogleFonts.getFont(
                            "Inter",
                            color: MyThemeData.greyColor,
                            fontWeight: FontWeight.w500,
                            fontSize: 13,
                          )),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
