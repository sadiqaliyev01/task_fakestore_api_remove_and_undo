import 'package:flutter/material.dart';
import 'package:task_fakestore_api_remove_and_undo/data/models/product_response.dart';
import 'package:task_fakestore_api_remove_and_undo/ui/presentation/trash/widgets/deleted_product_card_item.dart';

class DeletedProductGridView extends StatelessWidget {
  const DeletedProductGridView({
    super.key,
    required this.deleteItemPermanently,
    required this.products,
    required this.undoItem,
  });

  final void Function(int id) deleteItemPermanently;
  final List<ProductResponse> products;
  final void Function(int id) undoItem;

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
        return DeletedProductCardItem(
          undoItem: () => undoItem(productResponse.id!),
          product: productResponse,
          deleteItem: () => deleteItemPermanently(productResponse.id!),
        );
      },
    );
  }
}
