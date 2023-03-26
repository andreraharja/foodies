import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodies/application/domain/entities/detail.dart';
import 'package:foodies/application/presentation/bloc/detail/detail_bloc.dart';
import 'package:foodies/application/presentation/widget/screen_configuration.dart';
import 'package:foodies/injection.dart' as di;

import 'detail_view_appbar.dart';

class DetailView extends StatelessWidget {
  final String id;
  final String strMeal;
  final String strMealThumb;
  const DetailView(
      {Key? key,
      required this.id,
      required this.strMeal,
      required this.strMealThumb})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarBackground(strMeal, strMealThumb, context),
      body: BlocProvider(
        create: (context) => di.locator<DetailBloc>()..add(GetDetailFood(id)),
        child: BlocBuilder<DetailBloc, DetailState>(
          builder: (context, state) {
            if (state is LoadingDetail) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is HasDataDetail) {
              return ListView(
                children: [
                  const SizedBox(
                    height: 15,
                  ),
                  DetailViewIngredient(lsDetail: state.lsDetail),
                  const SizedBox(
                    height: 10,
                  ),
                  DetailViewInstruction(
                    lsDetail: state.lsDetail,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                ],
              );
            } else {
              return const Text('Error');
            }
          },
        ),
      ),
    );
  }
}

class DetailViewInstruction extends StatelessWidget {
  const DetailViewInstruction({Key? key, required this.lsDetail})
      : super(key: key);

  final List<Detail> lsDetail;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(5.0),
        decoration: const BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
              offset: Offset(1, 1), //(x,y)
              blurRadius: 1,
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Instructions',
              style: Theme.of(context)
                  .textTheme
                  .headline6!
                  .apply(fontWeightDelta: 1),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(lsDetail[0].strInstructions!)
          ],
        ));
  }
}

class DetailViewIngredient extends StatelessWidget {
  const DetailViewIngredient({Key? key, required this.lsDetail})
      : super(key: key);

  final List<Detail> lsDetail;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      decoration: const BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            offset: Offset(1, 1), //(x,y)
            blurRadius: 1,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Ingredients",
            style: Theme.of(context)
                .textTheme
                .headline6!
                .apply(fontWeightDelta: 1),
          ),
          const SizedBox(
            height: 10,
          ),
          lsDetail[0].strIngredient1 != "" && lsDetail[0].strIngredient1 != null
              ? displayIngredient(
                  lsDetail[0].strIngredient1!, lsDetail[0].strMeasure1!)
              : Container(),
          lsDetail[0].strIngredient2 != "" && lsDetail[0].strIngredient2 != null
              ? displayIngredient(
                  lsDetail[0].strIngredient2!, lsDetail[0].strMeasure2!)
              : Container(),
          lsDetail[0].strIngredient3 != "" && lsDetail[0].strIngredient3 != null
              ? displayIngredient(
                  lsDetail[0].strIngredient3!, lsDetail[0].strMeasure3!)
              : Container(),
          lsDetail[0].strIngredient4 != "" && lsDetail[0].strIngredient4 != null
              ? displayIngredient(
                  lsDetail[0].strIngredient4!, lsDetail[0].strMeasure4!)
              : Container(),
          lsDetail[0].strIngredient5 != "" && lsDetail[0].strIngredient5 != null
              ? displayIngredient(
                  lsDetail[0].strIngredient5!, lsDetail[0].strMeasure5!)
              : Container(),
          lsDetail[0].strIngredient6 != "" && lsDetail[0].strIngredient6 != null
              ? displayIngredient(
                  lsDetail[0].strIngredient6!, lsDetail[0].strMeasure6!)
              : Container(),
          lsDetail[0].strIngredient7 != "" && lsDetail[0].strIngredient7 != null
              ? displayIngredient(
                  lsDetail[0].strIngredient7!, lsDetail[0].strMeasure7!)
              : Container(),
          lsDetail[0].strIngredient8 != "" && lsDetail[0].strIngredient8 != null
              ? displayIngredient(
                  lsDetail[0].strIngredient8!, lsDetail[0].strMeasure8!)
              : Container(),
          lsDetail[0].strIngredient9 != "" && lsDetail[0].strIngredient9 != null
              ? displayIngredient(
                  lsDetail[0].strIngredient9!, lsDetail[0].strMeasure9!)
              : Container(),
          lsDetail[0].strIngredient10 != "" &&
                  lsDetail[0].strIngredient10 != null
              ? displayIngredient(
                  lsDetail[0].strIngredient10!, lsDetail[0].strMeasure10!)
              : Container(),
          lsDetail[0].strIngredient11 != "" &&
                  lsDetail[0].strIngredient11 != null
              ? displayIngredient(
                  lsDetail[0].strIngredient11!, lsDetail[0].strMeasure11!)
              : Container(),
          lsDetail[0].strIngredient12 != "" &&
                  lsDetail[0].strIngredient12 != null
              ? displayIngredient(
                  lsDetail[0].strIngredient12!, lsDetail[0].strMeasure12!)
              : Container(),
          lsDetail[0].strIngredient13 != "" &&
                  lsDetail[0].strIngredient13 != null
              ? displayIngredient(
                  lsDetail[0].strIngredient13!, lsDetail[0].strMeasure13!)
              : Container(),
          lsDetail[0].strIngredient14 != "" &&
                  lsDetail[0].strIngredient14 != null
              ? displayIngredient(
                  lsDetail[0].strIngredient14!, lsDetail[0].strMeasure14!)
              : Container(),
          lsDetail[0].strIngredient15 != "" &&
                  lsDetail[0].strIngredient15 != null
              ? displayIngredient(
                  lsDetail[0].strIngredient15!, lsDetail[0].strMeasure15!)
              : Container(),
          lsDetail[0].strIngredient16 != "" &&
                  lsDetail[0].strIngredient16 != null
              ? displayIngredient(
                  lsDetail[0].strIngredient16!, lsDetail[0].strMeasure16!)
              : Container(),
          lsDetail[0].strIngredient17 != "" &&
                  lsDetail[0].strIngredient17 != null
              ? displayIngredient(
                  lsDetail[0].strIngredient17!, lsDetail[0].strMeasure17!)
              : Container(),
          lsDetail[0].strIngredient18 != "" &&
                  lsDetail[0].strIngredient18 != null
              ? displayIngredient(
                  lsDetail[0].strIngredient18!, lsDetail[0].strMeasure18!)
              : Container(),
          lsDetail[0].strIngredient19 != "" &&
                  lsDetail[0].strIngredient19 != null
              ? displayIngredient(
                  lsDetail[0].strIngredient19!, lsDetail[0].strMeasure19!)
              : Container(),
          lsDetail[0].strIngredient20 != "" &&
                  lsDetail[0].strIngredient20 != null
              ? displayIngredient(
                  lsDetail[0].strIngredient20!, lsDetail[0].strMeasure20!)
              : Container(),
        ],
      ),
    );
  }

  Widget displayIngredient(String a, String b) {
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(
              width: ScreenConfiguration.screenWidth * 0.4, child: Text(a)),
          const Text(" : "),
          Expanded(child: Text(b)),
        ],
      ),
    );
  }
}
