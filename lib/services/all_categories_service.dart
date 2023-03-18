import 'package:store_app/helper/api.dart';

class AllCategoriesService {
  Future<List<String>> getCategories() async {
    return await Api().get(url: 'https://fakestoreapi.com/products/categories');
  }
}
