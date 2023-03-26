import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodies/application/presentation/widget/screen_configuration.dart';

import '../../../domain/entities/category.dart';
import '../../bloc/food/food_bloc.dart';

class DropDownCategory extends StatefulWidget {
  final List<FoodCategory> lsFoodCategory;
  const DropDownCategory({Key? key, required this.lsFoodCategory})
      : super(key: key);

  @override
  State<DropDownCategory> createState() => _DropDownCategoryState();
}

class _DropDownCategoryState extends State<DropDownCategory> {
  String selectedValue = "Beef";

  @override
  Widget build(BuildContext context) {
    return Container(
      height: ScreenConfiguration.screenHeight * 0.07,
      margin: EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(10.0),
      decoration: const BoxDecoration(
          color: Colors.orangeAccent,
          borderRadius: BorderRadius.all(Radius.circular(10))),
      child: LayoutBuilder(builder: (context, constraints) {
        return Row(
          children: [
            SizedBox(
                width: ScreenConfiguration.screenWidth * 0.3,
                child: Text(
                  'Food Category',
                  style: Theme.of(context).textTheme.overline!.apply(
                      color: Colors.white,
                      fontWeightDelta: 1,
                      fontSizeDelta: constraints.maxHeight * 0.2),
                )),
            Expanded(
              child: Align(
                alignment: Alignment.centerRight,
                child: Container(
                  width: constraints.maxWidth * 0.4,
                  padding: const EdgeInsets.all(5.0),
                  color: Colors.white60,
                  child: DropdownButton(
                    isExpanded: true,
                    items: widget.lsFoodCategory.map((item) {
                      return DropdownMenuItem(
                        value: item.strCategory,
                        child: Text(item.strCategory),
                      );
                    }).toList(),
                    onChanged: (dynamic newVal) {
                      setState(() {
                        selectedValue = newVal;
                        context
                            .read<FoodBloc>()
                            .add(GetListFood(selectedValue));
                      });
                    },
                    value: selectedValue,
                  ),
                ),
              ),
            ),
          ],
        );
      }),
    );
  }
}
