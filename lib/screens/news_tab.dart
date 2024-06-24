import 'package:flutter/material.dart';
import 'package:news_app/bloc/home_cubit.dart';
import 'package:news_app/network/remote/api_manager.dart';
import 'package:news_app/network/remote/source_item.dart';

import 'news_item.dart';

class NewsTab extends StatefulWidget {
  @override
  State<NewsTab> createState() => _NewsTabState();
}

class _NewsTabState extends State<NewsTab> {
  ApiManager apiManager = ApiManager();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DefaultTabController(
          length: HomeCubit
              .getContext(context)
              .sources
              .length,
          child: TabBar(
              isScrollable: true,
              onTap: (value) {
                HomeCubit.getContext(context).changeSelectedSource(value);
              },
              dividerColor: Colors.transparent,
              indicatorColor: Colors.transparent,
              tabs: HomeCubit
                  .getContext(context)
                  .sources
                  .map(
                    (e) =>
                    Tab(
                      child: SourcesItem(
                        source: e,
                        selected: HomeCubit
                            .getContext(context)
                            .sources
                            .elementAt(HomeCubit
                            .getContext(context)
                            .selectedIndex) == e,
                      ),
                    ),
              )
                  .toList()),
        ),
        Expanded(
          child: ListView.builder(
            itemBuilder: (context, index) {
              return NewsItem(
                  article: HomeCubit
                      .getContext(context)
                      .articles[index]);
            },
            itemCount: HomeCubit
                .getContext(context)
                .articles
                .length,
          ),
        )
      ],
    );
  }
}
