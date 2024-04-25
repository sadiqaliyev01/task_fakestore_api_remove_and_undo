import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_fakestore_api_remove_and_undo/data/models/product_response.dart';
import 'package:task_fakestore_api_remove_and_undo/data/services/products_service.dart';

part 'products_state.dart';

class ProductsCubit extends Cubit<ProductsState> {
  ProductsCubit() : super(ProductsInitial());

  final ProductsService _productsService = ProductsService();

  void getProducts() async {
    try {
      emit(ProductsLoading());
      final result = await _productsService.getProducts();
      emit(ProductsSuccess(result));
    } catch (e) {
      emit(ProductsError());
    }
  }
}
