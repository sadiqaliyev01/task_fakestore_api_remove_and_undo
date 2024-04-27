import 'package:dio/dio.dart';
import 'package:task_fakestore_api_remove_and_undo/constants/endpoints.dart';
import 'package:task_fakestore_api_remove_and_undo/data/models/product_response.dart';

class ProductsService {
  final _dio = Dio();

  Future<List<ProductResponse>> getProducts() async {
    final response = await _dio.get(Endpoints.products);
    final List data = response.data;

    if (response.statusCode == 200) {
      return data.map((e) => ProductResponse.fromJson(e)).toList();
    }
    throw Exception();
  }

  Future<ProductResponse> getProductDetails(int id) async {
    // Product Details hissesinde list olmayacaq. Her producta basanda bir product acilacaq deye List<ProductResponse> yazmaga ehtiyac yoxdur
    final endpoint =
        "${Endpoints.products}/$id"; // burada her product-in id-sine gore details sehifesi acilacaq deye id elave edilib
    final response = await _dio.get(endpoint);
    final data = response
        .data; // data-miz 1 eded product olacaq deye List-e ehtiyac yoxdur

    if (response.statusCode == 200) {
      return ProductResponse.fromJson(
          data); // return olunacaq sey bir eded product olacaq deye List ehtiyac yoxdur
    }
    throw Exception();
  }
}
