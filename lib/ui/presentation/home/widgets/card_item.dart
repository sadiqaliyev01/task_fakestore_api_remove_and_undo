import 'package:flutter/material.dart';
import 'package:task_fakestore_api_remove_and_undo/data/models/product_response.dart';

class CardItem extends StatelessWidget {
  const CardItem({
    super.key,
    required this.product,
    required this.deleteItem,
  });

  final ProductResponse product;
  final void Function()? deleteItem;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 8,
      child: Column(
        children: [
          IconButton(
            onPressed: deleteItem,
            icon: const Icon(Icons.delete_outline_rounded),
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
