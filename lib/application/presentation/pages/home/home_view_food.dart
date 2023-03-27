import 'package:flutter/material.dart';

import '../../../domain/entities/food.dart';
import '../../widget/screen_configuration.dart';
import '../detail/detail_view.dart';

class ListViewFood extends StatelessWidget {
  const ListViewFood({Key? key, required this.lsFood}) : super(key: key);

  final List<Food> lsFood;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: lsFood.length,
        itemBuilder: (context, index) {
          return GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => DetailView(
                              id: lsFood[index].idMeal,
                              strMeal: lsFood[index].strMeal,
                              strMealThumb: lsFood[index].strMealThumb,
                            )));
              },
              child: SizedBox(
                height: ScreenConfiguration.screenHeight * 0.15,
                child: Card(
                  elevation: 5,
                  child: Row(
                    children: [
                      Image.network(lsFood[index].strMealThumb),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(child: Text(lsFood[index].strMeal)),
                    ],
                  ),
                ),
              ));
        });
  }
}
