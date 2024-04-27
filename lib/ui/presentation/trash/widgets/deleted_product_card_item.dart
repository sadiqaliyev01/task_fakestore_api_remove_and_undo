import 'package:flutter/material.dart';
import 'package:task_fakestore_api_remove_and_undo/data/models/product_response.dart';

class DeletedProductCardItem extends StatelessWidget {
  const DeletedProductCardItem({
    super.key,
    required this.product,
    required this.deleteItem,
    this.undoItem,
  });

  final ProductResponse product;
  final void Function()? deleteItem;
  final void Function()? undoItem;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 8,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                onPressed: undoItem,
                icon: const Icon(
                  Icons.undo,
                ),
              ),
              IconButton(
                  onPressed: deleteItem,
                  icon: const Icon(Icons.delete_outline_rounded)),
            ],
          ),
          Image.network(
            product.image ?? "",
            height: 130,
            width: 130,
            fit: BoxFit.fill,
          ),
          Column(
            children: [
              Text(product.category!),
              Text(product.title ?? ""),
              Row(
                children: [
                  Text(product.rating!.rate.toString()),
                  const Spacer(),
                  Text(product.price!.toString()),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
