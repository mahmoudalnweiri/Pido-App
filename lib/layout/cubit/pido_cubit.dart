import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pido_app/layout/cubit/pido_states.dart';
import 'package:pido_app/shared/network/end_points.dart';
import 'package:pido_app/shared/network/remote/dio_helper.dart';

import '../../models/category_model.dart';
import '../../models/product_model.dart';

class PidoCubit extends Cubit<PidoStates> {
  PidoCubit() : super(InitialState());

  static PidoCubit get(context) => BlocProvider.of(context);

  List<CategoryModel> categories = [];

  void getCategories() {
    emit(LoadingGetCategoriesState());
    DioHelper.getData(
      url: CATEGORIES,
    ).then((value) {
      categories = [];
      for (var item in value.data) {
        categories.add(CategoryModel.fromJson(item));
      }
      emit(SuccessGetCategoriesState());
    }).catchError((error) {
      print(error.toString());
      emit(ErrorGetCategoriesState());
    });
  }

  List<ProductModel> newArrivalProducts = [];

  void getNewArrival() {
    emit(LoadingGetNewArrivalState());
    DioHelper.getData(
      url: NEWARRIVAL,
    ).then((value) {
      newArrivalProducts = [];
      for (var item in value.data) {
        newArrivalProducts.add(ProductModel.fromJson(item));
      }
      emit(SuccessGetNewArrivalState());
    }).catchError((error) {
      print(error.toString());
      emit(ErrorGetNewArrivalState());
    });
  }

  int discountPercentage({required int price, required int priceOffer}) {
    double finalPrice = ((price - priceOffer) / price) * 100;
    emit(ExportDiscountPercentageState());
    return finalPrice.round();
  }

  List<ProductModel> offers = [];

  void getOffers() {
    emit(LoadingGetOffersState());
    DioHelper.getData(
      url: OFFERS,
      lang: 'en',
    ).then((value) {
      for (var item in value.data) {
        offers.add(ProductModel.fromJson(item));
      }
      emit(SuccessGetOffersState());
    }).catchError((error) {
      print(error.toString());
      emit(ErrorGetOffersState());
    });
  }

  String? filter;

  void changeFilter({required String newValue}) {
    filter = newValue;
    emit(ChangeFilterState());
  }

  Map<String, List<ProductModel>> categoryProducts = {
    'All': [],
    'Men': [],
    'Women': [],
    'Gadgets': [],
    'Gaming': [],
    'Devices': [],
    'Pets': [],
    'Camping': [],
  };

  void getAllProducts() {
    emit(LoadingGetAllProductsState());
    DioHelper.getData(url: PRODUCTS, lang: 'en', type: 'all').then((value) {
      categoryProducts['All'] = [];
      for (var item in value.data) {
        categoryProducts['All']!.add(ProductModel.fromJson(item));
      }
      emit(SuccessGetAllProductsState());
    }).catchError((error) {
      print(error.toString());
      emit(ErrorGetAllProductsState());
    });
  }

  void getMenProducts() {
    emit(LoadingGetMenProductsState());
    DioHelper.getData(url: PRODUCTS, lang: 'en', type: 'men').then((value) {
      categoryProducts['Men'] = [];
      for (var item in value.data) {
        categoryProducts['Men']!.add(ProductModel.fromJson(item));
      }
      emit(SuccessGetMenProductsState());
    }).catchError((error) {
      print(error.toString());
      emit(ErrorGetMenProductsState());
    });
  }

  void getWomenProducts() {
    emit(LoadingGetWomenProductsState());
    DioHelper.getData(url: PRODUCTS, lang: 'en', type: 'women').then((value) {
      categoryProducts['Women'] = [];
      for (var item in value.data) {
        categoryProducts['Women']!.add(ProductModel.fromJson(item));
      }
      emit(SuccessGetWomenProductsState());
    }).catchError((error) {
      print(error.toString());
      emit(ErrorGetWomenProductsState());
    });
  }

  void getGadgetsProducts() {
    emit(LoadingGetGadgetsProductsState());
    DioHelper.getData(url: PRODUCTS, lang: 'en', type: 'gadgets').then((value) {
      categoryProducts['Gadgets'] = [];
      for (var item in value.data) {
        categoryProducts['Gadgets']!.add(ProductModel.fromJson(item));
      }
      emit(SuccessGetGadgetsProductsState());
    }).catchError((error) {
      print(error.toString());
      emit(ErrorGetGadgetsProductsState());
    });
  }

  void getGamingProducts() {
    emit(LoadingGetGamingProductsState());
    DioHelper.getData(url: PRODUCTS, lang: 'en', type: 'gaming').then((value) {
      categoryProducts['Gaming'] = [];
      for (var item in value.data) {
        categoryProducts['Gaming']!.add(ProductModel.fromJson(item));
      }
      emit(SuccessGetGamingProductsState());
    }).catchError((error) {
      print(error.toString());
      emit(ErrorGetGamingProductsState());
    });
  }

  void getDevicesProducts() {
    emit(LoadingGetDevicesProductsState());
    DioHelper.getData(url: PRODUCTS, lang: 'en', type: 'devices').then((value) {
      categoryProducts['Devices'] = [];
      for (var item in value.data) {
        categoryProducts['Devices']!.add(ProductModel.fromJson(item));
      }
      emit(SuccessGetDevicesProductsState());
    }).catchError((error) {
      print(error.toString());
      emit(ErrorGetDevicesProductsState());
    });
  }

  void getPetsProducts() {
    emit(LoadingGetPetsProductsState());
    DioHelper.getData(url: PRODUCTS, lang: 'en', type: 'pets').then((value) {
      categoryProducts['Pets'] = [];
      for (var item in value.data) {
        categoryProducts['Pets']!.add(ProductModel.fromJson(item));
      }
      emit(SuccessGetPetsProductsState());
    }).catchError((error) {
      print(error.toString());
      emit(ErrorGetPetsProductsState());
    });
  }

  void getCampingProducts() {
    emit(LoadingGetCampingProductsState());
    DioHelper.getData(url: PRODUCTS, lang: 'en', type: 'camping').then((value) {
      categoryProducts['Camping'] = [];
      for (var item in value.data) {
        categoryProducts['Camping']!.add(ProductModel.fromJson(item));
      }
      emit(SuccessGetCampingProductsState());
    }).catchError((error) {
      print(error.toString());
      emit(ErrorGetCampingProductsState());
    });
  }

  List<ProductModel> similarProducts = [];

  void getSimilarProducts({
    required int subId,
    required int pId,
  }) {
    emit(LoadingGetSimilarProductsState());
    DioHelper.getData(
      url: SIMILAR,
      lang: 'en',
      type: subId,
      pId: pId,
    ).then((value) {
      similarProducts = [];
      for(var item in value.data){
        similarProducts.add(ProductModel.fromJson(item));
      }
      print(similarProducts.length);
      emit(SuccessGetSimilarProductsState());
    }).catchError((error) {
      print(error.toString());
      emit(ErrorGetSimilarProductsState());
    });
  }
}
