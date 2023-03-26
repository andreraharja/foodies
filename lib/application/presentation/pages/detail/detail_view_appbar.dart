import 'package:flutter/material.dart';
import 'package:foodies/application/presentation/widget/screen_configuration.dart';

PreferredSizeWidget appBarBackground(
    String moduleName, String image, BuildContext context) {
  return PreferredSize(
    preferredSize: Size.fromHeight(ScreenConfiguration.screenHeight * 0.2),
    child: AppBar(
      centerTitle: true,
      flexibleSpace: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: NetworkImage(image),
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(
                    Colors.black.withOpacity(0.5), BlendMode.darken))),
      ),
      automaticallyImplyLeading: false,
      title: Text(moduleName),
      backgroundColor: Colors.transparent,
    ),
  );
}
