import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_fakestore_api_remove_and_undo/cubits/products/products_cubit.dart';
import 'package:task_fakestore_api_remove_and_undo/ui/presentation/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: BlocProvider(
        create: (context) {
          return ProductsCubit()..getProducts();
        },
        child: const HomeScreen(),
      ),
    );
  }
}
