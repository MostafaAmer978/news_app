import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:news_app/models/category_model.dart';
import 'package:news_app/network/remote/api_manager.dart';
import 'package:news_app/screens/category_tab.dart';
import 'package:news_app/screens/data_tab.dart';
import 'package:news_app/screens/drawer_page.dart';
import 'package:news_app/screens/news_item.dart';
import 'package:news_app/screens/settings_page.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = "HomeScreen";

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isSearch = false;
  String searchQuery = "";
  TextEditingController controller = TextEditingController();
  ApiManager apiManager = ApiManager();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage("assets/images/background.png")),
      ),
      child: Scaffold(
        /// AppBar
        appBar: isSearch
            ? PreferredSize(
                preferredSize: const Size.fromHeight(70),
                child: AppBar(
                  title: TextField(
                    controller: controller,
                    onChanged: (value) {
                      searchQuery = value;
                      setState(() {});
                    },
                    decoration: InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      hintText: "search_article".tr(),
                      prefixIcon: IconButton(
                        onPressed: () {
                          isSearch = !isSearch;
                          setState(() {});
                        },
                        icon: const Icon(Icons.close,
                            color: Color(0xFF39A552), size: 30),
                      ),
                      suffixIcon: Padding(
                        padding: const EdgeInsetsDirectional.only(end: 15),
                        child: IconButton(
                            onPressed: () {
                              controller.text = searchQuery;
                              controller.clear();
                              searchQuery = "";
                              setState(() {});
                            },
                            icon: const Icon(
                              Icons.delete,
                              color: Color(0xFF39A552),
                              size: 30,
                            )),
                      ),
                      hintStyle: TextStyle(
                          color: const Color(0xFF39A552).withOpacity(0.5)),
                      border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(50)),
                          borderSide:
                              BorderSide(color: Colors.black, width: 5)),
                      focusedBorder: const OutlineInputBorder(
                          borderRadius:
                              BorderRadius.all(Radius.circular(100)),
                          borderSide:
                              BorderSide(color: Colors.transparent)),
                      enabledBorder: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(50)),
                          borderSide:
                              BorderSide(color: Colors.transparent)),
                    ),
                  ),
                ),
              )
            : PreferredSize(
                preferredSize: const Size.fromHeight(70),
                child: AppBar(
                  actions: [
                    Padding(
                      padding: const EdgeInsetsDirectional.only(end: 15),
                      child: IconButton(
                        onPressed: () {
                          isSearch = !isSearch;
                          setState(() {});
                        },
                        icon: const Icon(
                          Icons.search,
                          size: 40,
                        ),
                      ),
                    )
                  ],
                  title: Text(
                    drawerNumber == DrawerPage.settingsId
                        ? "settings".tr()
                        : categoryModel == null
                            ? "news_title".tr()
                            : categoryModel!.title,
                    style: Theme.of(context).appBarTheme.titleTextStyle,
                  ),
                ),
              ),
        drawer: isSearch
            ? null
            : DrawerPage(
                onClick: onDrawerClicked,
              ),

        /// Body
        body: drawerNumber == DrawerPage.settingsId
            ? (isSearch
                ? FutureBuilder(
                    future: ApiManager.getSearch(searchQuery),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(child: CircularProgressIndicator());
                      }
                      if (snapshot.hasError) {
                        return Center(
                          child: Text(
                            "search_engine_is_empty_..".tr(),
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20),
                          ),
                        );
                      }

                      var articles = snapshot.data?.articles ?? [];
                      return ListView.builder(
                        itemBuilder: (context, index) {
                          return NewsItem(article: articles[index]);
                        },
                        itemCount: articles.length,
                      );
                    },
                  )
                : const SettingsPage())
            : categoryModel == null
                ? (isSearch
                    ? FutureBuilder(
                        future: ApiManager.getSearch(searchQuery),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return const Center(
                                child: CircularProgressIndicator());
                          }
                          if (snapshot.hasError) {
                            return Center(
                              child: Text(
                                "search_engine_is_empty_..".tr(),
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20),
                              ),
                            );
                          }

                          var articles = snapshot.data?.articles ?? [];
                          return ListView.builder(
                            itemBuilder: (context, index) {
                              return NewsItem(article: articles[index]);
                            },
                            itemCount: articles.length,
                          );
                        },
                      )
                    : CategoryTab(onClick: onCategoryClicked))
                : (isSearch
                    ? FutureBuilder(
                        future: ApiManager.getSearch(searchQuery),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return const Center(
                                child: CircularProgressIndicator());
                          }
                          if (snapshot.hasError) {
                            return Center(
                              child: Text(
                                "search_engine_is_empty_..".tr(),
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20),
                              ),
                            );
                          }

                          var articles = snapshot.data?.articles ?? [];
                          return ListView.builder(
                            itemBuilder: (context, index) {
                              return NewsItem(article: articles[index]);
                            },
                            itemCount: articles.length,
                          );
                        },
                      )
                    : DataTab(categoryId: categoryModel!.id, apiManager: apiManager,)),
      ),
    );
  }

  CategoryModel? categoryModel;
  int? drawerNumber;

  onCategoryClicked(catModel) {
    categoryModel = catModel;
    setState(() {});
  }

  onDrawerClicked(val) {
    if (DrawerPage.categoryId == val) {
      drawerNumber = DrawerPage.categoryId;
      categoryModel = null;
      Navigator.pop(context);
      setState(() {});
    } else if (DrawerPage.settingsId == val) {
      drawerNumber = DrawerPage.settingsId;
      Navigator.pop(context);
      setState(() {});
    }
  }
}
