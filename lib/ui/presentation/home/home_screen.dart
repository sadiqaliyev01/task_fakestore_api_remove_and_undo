import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_fakestore_api_remove_and_undo/cubits/products/products_cubit.dart';
import 'package:task_fakestore_api_remove_and_undo/data/models/product_response.dart';
import 'package:task_fakestore_api_remove_and_undo/ui/presentation/home/widgets/card_item.dart';

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
            log(state.runtimeType.toString());
            if (state is ProductsLoading) {
              return const Center(
                child: SizedBox(
                  height: 44,
                  width: 44,
                  child: CircularProgressIndicator(),
                ),
              );
            } else if (state is ProductsSuccess) {
              final products = state.products;
              return GridView.builder(
                shrinkWrap: true,
                primary: false,
                itemCount: products.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 4,
                  crossAxisSpacing: 4,
                  mainAxisExtent: 300,
                ),
                itemBuilder: (_, int index) {
                  ProductResponse productResponse = products[index];
                  return CardItem(
                    product: productResponse,
                  );
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
