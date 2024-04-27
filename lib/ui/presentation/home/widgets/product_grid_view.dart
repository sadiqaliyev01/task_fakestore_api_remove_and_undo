import 'package:flutter/material.dart';
import 'package:task_fakestore_api_remove_and_undo/data/models/product_response.dart';
import 'package:task_fakestore_api_remove_and_undo/ui/presentation/home/widgets/card_item.dart';

class ProductGridView extends StatelessWidget {
  const ProductGridView(
      {super.key, required this.deleteItem, required this.products});

  final void Function(int id) deleteItem;
  final List<ProductResponse> products;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      primary: false,
      itemCount: products.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 4,
        crossAxisSpacing: 4,
        mainAxisExtent: 330,
      ),
      itemBuilder: (_, int index) {
        ProductResponse productResponse = products[index];
        return CardItem(
          product: productResponse,
          deleteItem: () => deleteItem(productResponse.id!),
        );
      },
    );
  }
}
