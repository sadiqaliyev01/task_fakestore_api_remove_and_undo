import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_fakestore_api_remove_and_undo/cubits/products/products_cubit.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Fake Store"),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.restore_from_trash_sharp,
              ),
            ),
          ],
        ),
        body: BlocConsumer<ProductsCubit, ProductsState>(
          listener: (context, state) {},
          builder: (_, state) {
            if (state is ProductsLoading) {
              return const SizedBox(
                height: 24,
                width: 24,
                child: CircularProgressIndicator(),
              );
            } else if (state is ProductsSuccess) {
              return GridView.builder(
                itemCount: 10,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 4,
                  crossAxisSpacing: 4,
                  mainAxisExtent: 300,
                ),
                itemBuilder: (_, int index) {
                  return const Text("data");
                },
              );
            }
            return const Text("Error");
          },
        ),
      ),
    );
  }
}
