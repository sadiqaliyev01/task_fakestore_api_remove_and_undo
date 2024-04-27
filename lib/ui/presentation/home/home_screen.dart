import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_fakestore_api_remove_and_undo/cubits/products/products_cubit.dart';
import 'package:task_fakestore_api_remove_and_undo/ui/presentation/home/widgets/product_grid_view.dart';
import 'package:task_fakestore_api_remove_and_undo/ui/presentation/home/widgets/app_bar_delete_icon.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Fake Store"),
          actions: const [
            AppBarDeleteIcon(deletedProductsCount: "0"),
          ],
        ),
        body: BlocConsumer<ProductsCubit, ProductsState>(
          listener: (context, state) {},
          builder: (_, state) {
            //log(state.runtimeType.toString());
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
              return ProductGridView(
                deleteItem: (id) {
                  context.read<ProductsCubit>().removeProducts(id);
                },
                products: products,
              );
            }
            return const Text("Error");
          },
        ),
      ),
    );
  }
}
