import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_fakestore_api_remove_and_undo/cubits/products/products_cubit.dart';
import 'package:task_fakestore_api_remove_and_undo/ui/presentation/trash/trash_screen.dart';

class AppBarDeleteIcon extends StatelessWidget {
  const AppBarDeleteIcon({super.key, required this.deletedProductsCount});

  final String deletedProductsCount;

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ProductsCubit>();
    return Stack(
      alignment: Alignment.topRight,
      children: [
        IconButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(
              builder: (context) {
                return BlocProvider.value(
                  value: cubit,
                  child: const TrashScreen(),
                );
              },
            ));
          },
          icon: const Icon(
            Icons.restore_from_trash_sharp,
          ),
        ),
        Positioned(
          right: 6,
          top: 6,
          child: Container(
            width: 18,
            height: 18,
            decoration: const BoxDecoration(
              color: Colors.red,
              shape: BoxShape.circle,
            ),
            child: Center(
              child: BlocBuilder<ProductsCubit, ProductsState>(
                builder: (context, state) {
                  return Text(
                    state is ProductsSuccess
                        ? context
                            .read<ProductsCubit>()
                            .deletedProducts
                            .length
                            .toString()
                        : "0",
                  );
                },
              ),
            ),
          ),
        ),
      ],
    );
  }
}
