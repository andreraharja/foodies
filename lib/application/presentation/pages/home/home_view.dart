import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodies/application/presentation/bloc/category/category_bloc.dart';
import 'package:foodies/application/presentation/bloc/food/food_bloc.dart';
import 'package:foodies/application/presentation/widget/screen_configuration.dart';
import 'package:lottie/lottie.dart';

import '../detail/detail_view.dart';
import 'home_view_category.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScreenConfiguration().init(context);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            SizedBox(height: ScreenConfiguration.screenStatusBar),
            Center(
              child: SizedBox(
                  height: ScreenConfiguration.screenHeight * 0.1,
                  child: Lottie.asset('assets/82624-foodies.json')),
            ),
            BlocBuilder<CategoryBloc, CategoryState>(
              builder: (context, state) {
                if (state is LoadingCategory) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is HasDataCategory) {
                  return DropDownCategory(lsFoodCategory: state.lsFoodCategory);
                } else {
                  return const Text('Error');
                }
              },
            ),
            Expanded(
              child: BlocBuilder<FoodBloc, FoodState>(
                builder: (context, state) {
                  if (state is LoadingFood) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (state is HasDataFood) {
                    return ListView.builder(
                        itemCount: state.lsFood.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => DetailView(
                                              id: state.lsFood[index].idMeal,
                                              strMeal:
                                                  state.lsFood[index].strMeal,
                                              strMealThumb: state
                                                  .lsFood[index].strMealThumb,
                                            )));
                              },
                              child: SizedBox(
                                height: ScreenConfiguration.screenHeight * 0.15,
                                child: Card(
                                  elevation: 5,
                                  child: Row(
                                    children: [
                                      Image.network(
                                          state.lsFood[index].strMealThumb),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Expanded(
                                          child: Text(
                                              state.lsFood[index].strMeal)),
                                    ],
                                  ),
                                ),
                              ));
                        });
                  } else {
                    return Container();
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
