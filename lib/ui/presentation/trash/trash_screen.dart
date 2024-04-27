import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_fakestore_api_remove_and_undo/cubits/products/products_cubit.dart';
import 'package:task_fakestore_api_remove_and_undo/ui/presentation/trash/widgets/deleted_products_grid_view.dart';
import 'package:task_fakestore_api_remove_and_undo/ui/presentation/trash/widgets/remove_all_items.dart';

class TrashScreen extends StatelessWidget {
  const TrashScreen({
    super.key,
    this.deleteAllItemsPermanently,
  });

  final void Function()? deleteAllItemsPermanently;

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ProductsCubit>();
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Deleted Products"),
          actions: [
            RemoveAllItems(
              deleteAllItemsPermanently: cubit.removeAllProductsPermanently,
            ),
          ],
        ),
        body: BlocBuilder<ProductsCubit, ProductsState>(
          builder: (context, state) {
            return DeletedProductGridView(
              deleteItemPermanently: (id) {
                log("deleted id: $id");
                cubit.removeProductPermanently(id);
              },
              products: cubit.deletedProducts,
              undoItem: (int id) {
                cubit.undoProducts(id);
              },
            );
          },
        ),
      ),
    );
  }
}
