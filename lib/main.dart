import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:news_app/layout/homescreen.dart';
import 'package:news_app/my_provider.dart';
import 'package:news_app/my_theme.dart';
import 'package:news_app/screens/article_item_details.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  MyProvider provider = MyProvider();
  await provider.getLanguage();
  await EasyLocalization.ensureInitialized();

  /// runApp
  runApp(ChangeNotifierProvider<MyProvider>(
    create: (context) => provider,
    builder: (context, child) => EasyLocalization(
      supportedLocales: const [Locale('en'), Locale('ar')],
      path: 'assets/translations',
      fallbackLocale: const Locale('en'),
      child: const MyApp(),
    ),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<MyProvider>(context);
    return MaterialApp(
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: Locale(provider.selectedLanguage),
        debugShowCheckedModeBanner: false,
        theme: MyThemeData.lightMode,
        initialRoute: HomeScreen.routeName,
        routes: {
          HomeScreen.routeName: (context) => const HomeScreen(),
          ArticleItemDetails.routeName: (context) => const ArticleItemDetails(),
        }
        );
  }
}
