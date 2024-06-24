import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/bloc/home_states.dart';
import 'package:news_app/models/news_data_model.dart';
import 'package:news_app/models/source_response.dart';
import 'package:news_app/repository/repository.dart';


class HomeCubit extends Cubit<HomeStates> {
  HomeCubit({required this.homeRepository}) : super(InitialState());

  List<Sources> sources = [];
  List<Articles> articles = [];
  int selectedIndex = 0;
  HomeRepository homeRepository;


  static HomeCubit getContext(BuildContext context) => BlocProvider.of(context);

  /// GetSources
  Future<void> getSources(String categoryId) async {
      emit(HomeGetSourcesLoadingState());
    try {
      var sourceResponse = await homeRepository.getSources(categoryId);
      sources = sourceResponse.sources ?? [];
      emit(HomeGetSourcesSuccessState());
    } catch (e) {
      emit(HomeGetSourcesErrorState(e.toString()));
    }
  }

  /// GetNewsData
  Future<void> getNewsData() async {
    emit(HomeGetNewsLoadingState());
    try {
      var newsDataModel =
          await homeRepository.getNewsData(sources[selectedIndex].id ?? "");
      articles = newsDataModel.articles ?? [];
      emit(HomeGetNewsSuccessState());
    } catch (e) {
      emit(HomeGetNewsErrorState(e.toString()));
    }
  }

  void changeSelectedSource(int index) {
    selectedIndex = index;
    emit(ChangeSelectedSource());
  }

}
