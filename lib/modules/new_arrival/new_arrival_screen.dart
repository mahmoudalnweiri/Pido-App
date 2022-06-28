import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pido_app/layout/cubit/pido_cubit.dart';
import 'package:pido_app/layout/cubit/pido_states.dart';

import '../../shared/components/widgets.dart';
import '../product_details.dart';

class NewArrivalScreen extends StatelessWidget {
  const NewArrivalScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PidoCubit, PidoStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = PidoCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            title: const Text(
              'New Arrival',
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            ),
            iconTheme: const IconThemeData(color: Colors.black),
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            elevation: 0,
            systemOverlayStyle: SystemUiOverlayStyle(
              statusBarColor: Theme.of(context).scaffoldBackgroundColor,
              statusBarBrightness: Brightness.dark,
              statusBarIconBrightness: Brightness.dark,
            ),
          ),
          body: cubit.newArrivalProducts.isEmpty
              ? const Center(
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                  ),
                )
              : GridView.builder(
                  padding: const EdgeInsets.all(10.0),
                  physics: const BouncingScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 200,
                    mainAxisExtent: 330,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                  ),
                  itemCount: cubit.newArrivalProducts.length,
                  itemBuilder: (context, index) {
                    return buildProductItem(
                      context: context,
                      model: cubit.newArrivalProducts[index],
                      cubit: cubit,
                      index: index,
                      onTap: () {
                        cubit.getSimilarProducts(
                            subId:
                                cubit.newArrivalProducts[index].subcategoryId!,
                            pId: cubit.newArrivalProducts[index].id!);
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => ProductDetails(
                                    model: cubit.newArrivalProducts[index])));
                      },
                    );
                  },
                ),
        );
      },
    );
  }
}
