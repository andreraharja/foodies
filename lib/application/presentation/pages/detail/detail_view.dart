import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodies/application/presentation/bloc/detail/detail_bloc.dart';
import 'package:foodies/injection.dart' as di;

import 'detail_view_appbar.dart';
import 'detail_view_instruction.dart';
import 'detali_view_ingredient.dart';

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
