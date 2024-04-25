import 'package:flutter/material.dart';
import 'package:task_fakestore_api_remove_and_undo/data/models/product_response.dart';

class CardItem extends StatelessWidget {
  const CardItem({super.key, required this.product});

  final ProductResponse product;

  @override
  Widget build(BuildContext context) {

    return Card(
      elevation: 8,
      child: Column(
        children: [
          Image.network(
            product.image!,
            height: 130,
            width: 130,
            fit: BoxFit.fill,
          ),
          Column(
            children: [
              Text(product.category!),
              Text(product.title!),
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
