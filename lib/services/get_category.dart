import 'package:store_app/helper/api.dart';
import 'package:store_app/models/product_model.dart';

class GetCategory {
  Future<List<ProductModel>> getCategoryProducts(
      {required String categoryName}) async {
    List<dynamic> data = await Api()
        .get(url: 'https://fakestoreapi.com/products/category/:$categoryName');

    List<ProductModel> productList = [];
    for (dynamic item in data) {
      productList.add(ProductModel.fromJson(item));
    }
    return productList;
  }
}
