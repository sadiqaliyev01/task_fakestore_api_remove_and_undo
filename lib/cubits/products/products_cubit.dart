import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_fakestore_api_remove_and_undo/data/services/products_service.dart';

part 'products_state.dart';

class ProductsCubit extends Cubit<ProductsState> {
  ProductsCubit() : super(ProductsInitial());

  final ProductsService _productsService = ProductsService();

  void getProducts() async {
    try {
      emit(ProductsLoading());
      final result = await _productsService.getProducts();
      emit(ProductsSuccess());
    } catch (e) {
      emit(ProductsError());
    }
  }
}
