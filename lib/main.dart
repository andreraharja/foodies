import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodies/application/presentation/bloc/category/category_bloc.dart';
import 'package:foodies/application/presentation/bloc/food/food_bloc.dart';
import 'application/presentation/pages/home/home_view.dart';
import 'injection.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<CategoryBloc>(
            create: (_) =>
                di.locator<CategoryBloc>()..add(GetListCategory())),
        BlocProvider<FoodBloc>(
            create: (_) =>
                di.locator<FoodBloc>()..add(const GetListFood('Beef'))),
      ],
      child: MaterialApp(
        title: 'Foodies',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.deepOrange,
        ),
        home: const HomePage(),
      ),
    );
  }
}
