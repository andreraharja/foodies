import 'package:flutter/material.dart';

import '../../../domain/entities/detail.dart';

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