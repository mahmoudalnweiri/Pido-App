import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pido_app/modules/search/cubit/search_states.dart';
import 'package:pido_app/shared/network/end_points.dart';
import 'package:pido_app/shared/network/local/cache_helper.dart';
import 'package:pido_app/shared/network/remote/dio_helper.dart';

import '../../../models/product_model.dart';
import '../../../models/search_suggestions_model.dart';

class SearchCubit extends Cubit<SearchStates> {
  SearchCubit() : super(InitialSearchState());

  static SearchCubit get(context) => BlocProvider.of(context);

  List<String> recent = CacheHelper.getListString(key: 'recent') ?? [];

  void removeSuggestion(int index){
    recent.removeAt(index);
    CacheHelper.setListString(key: 'recent', value: recent);
    emit(RemoveSuggestionState());
  }

  List<SearchSuggestionsModel> searchSuggestions = [];

  void getSearchSuggestions({required String keyWord}) {
    emit(LoadingGetSearchSuggestionsState());
    DioHelper.postData(
      url: SUGGESTIONS,
      data: {
        'name': keyWord,
      },
    ).then((value) {
      searchSuggestions = [];
      for (var suggestion in value.data) {
        searchSuggestions.add(SearchSuggestionsModel.fromJson(suggestion));
      }
      emit(SuccessGetSearchSuggestionsState());
    }).catchError((error) {
      print(error.toString());
      emit(ErrorGetSearchSuggestionsState());
    });
  }

  List<ProductModel> searchResults = [];

  void getSearchResults({required String keyWord}) {
    emit(LoadingGetResultsSearchState());
    DioHelper.postData(
      url: SEARCH_RESULTS,
      data: {
        'text': keyWord,
      },
    ).then((value) {
      searchResults = [];
      for(var item in value.data){
        searchResults.add(ProductModel.fromJson(item));
      }
      emit(SuccessGetResultsSearchState());
    }).catchError((error) {
      print(error.toString());
      emit(ErrorGetResultsSearchState());
    });
  }
}
