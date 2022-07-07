import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pido_app/layout/cubit/pido_cubit.dart';
import 'package:pido_app/layout/pido_layout.dart';
import 'package:pido_app/modules/search/cubit/search_cubit.dart';
import 'package:pido_app/shared/network/local/cache_helper.dart';
import 'package:pido_app/shared/network/remote/dio_helper.dart';

import 'shared/my_bloc_observer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  DioHelper.init();
  await CacheHelper.init();

  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Color.fromRGBO(233, 213, 232, 1),
      statusBarBrightness: Brightness.dark,
      statusBarIconBrightness: Brightness.dark,
    ),
  );

  if(CacheHelper.getData(key: 'token') != null && CacheHelper.getData(key: 'dateEntry') != null){
    if (DateTime.now().isAtSameMomentAs(
        DateTime.parse(CacheHelper.getData(key: 'dateEntry'))
            .add(const Duration(hours: 24))) ||
        DateTime.now().isAfter(
            DateTime.parse(CacheHelper.getData(key: 'dateEntry'))
                .add(const Duration(hours: 24)))) {
      CacheHelper.removeData(key: 'token');
      CacheHelper.removeData(key: 'dateEntry');
    }
  }

  BlocOverrides.runZoned(
    () {
      runApp(const MyApp());
    },
    blocObserver: MyBlocObserver(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => PidoCubit()
            ..getCategories()
            ..getAllProducts()
            ..getOffers(),
        ),
        BlocProvider(create: (context) => SearchCubit()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Pido App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          fontFamily: 'SF-Pro',
        ),
        home: PidoLayout(),
      ),
    );
  }
}
