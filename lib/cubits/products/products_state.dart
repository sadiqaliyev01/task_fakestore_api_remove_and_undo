part of 'products_cubit.dart';

sealed class ProductsState {}

final class ProductsInitial extends ProductsState {}

final class ProductsLoading extends ProductsState {}

final class ProductsSuccess extends ProductsState {
  ProductsSuccess(this.products);

  final List<ProductResponse> products;
}

final class ProductsNetworkError extends ProductsState {}

final class ProductsError extends ProductsState {}

final class ProductsNoData extends ProductsState {}
