import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_fakestore_api_remove_and_undo/data/models/product_response.dart';
import 'package:task_fakestore_api_remove_and_undo/data/services/products_service.dart';

part 'products_state.dart';

class ProductsCubit extends Cubit<ProductsState> {
  ProductsCubit() : super(ProductsInitial());

  final ProductsService _productsService = ProductsService();
  List<ProductResponse>? products;
  List<ProductResponse> deletedProducts = [];

  void getProducts() async {
    try {
      emit(ProductsLoading());
      products = await _productsService.getProducts();
      emit(ProductsSuccess(products!));
    } catch (e) {
      emit(ProductsError());
    }
  }

  void removeProducts(int id) {
    products!.removeWhere((element) {
      if (element.id == id) {
        deletedProducts.add(element);
        return true;
      }
      return false;
    });
    emit(ProductsSuccess(products!));
  }

  void undoProducts(int id) {
    final removedProduct =
        deletedProducts.firstWhere((element) => element.id == id);
    deletedProducts.remove(removedProduct);
    products!.add(removedProduct);
    emit(ProductsSuccess(products!));
  }

  void removeAllProductsPermanently() {
    deletedProducts.clear();
    emit(ProductsSuccess(products!));
  }

  void removeProductPermanently(int id) {
    products!.removeWhere((element) {
      if (element.id == id) {
        deletedProducts.clear();
        return true;
      }
      return false;
    });
    emit(ProductsSuccess(products!));
  }
}
