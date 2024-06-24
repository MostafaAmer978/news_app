import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/bloc/home_cubit.dart';
import 'package:news_app/bloc/home_states.dart';
import 'package:news_app/network/remote/api_manager.dart';
import 'package:news_app/repository/remote_data_source_impl.dart';

import 'news_tab.dart';

class DataTab extends StatelessWidget {
  final String categoryId;
  final ApiManager apiManager;
  const DataTab({required this.categoryId,required this.apiManager, super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<HomeCubit>(
      create: (context) =>
      HomeCubit(homeRepository: RemoteDataSourceImpl(apiManager: apiManager))
        ..getSources(categoryId),
      child: BlocConsumer<HomeCubit, HomeStates>(
        listener: (context, state) {
          if (state is HomeGetSourcesLoadingState ||
              state is HomeGetNewsLoadingState) {
            const Center(child: CircularProgressIndicator());
          } else if (state is HomeGetSourcesSuccessState ||
              state is ChangeSelectedSource) {
            HomeCubit.getContext(context).getNewsData();
          }
        },
        builder: (context, state) {
          return NewsTab();
        },
      ),
    );
  }
}
