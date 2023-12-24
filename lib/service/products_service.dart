import 'package:dio/dio.dart';
import 'package:laza/add_product.dart';
import 'package:laza/model/addProduct.dart';
import 'package:laza/model/products_data.dart';

abstract class ProductsService {
  Dio dio = Dio();
  String allProducts = 'https://dummyjson.com/products';
  String categories = 'https://dummyjson.com/products/categories';
  String newProduct = 'https://dummyjson.com/products/add';
  Future getAllProducts();
  Future getCategories();
  Future setNewproduct(String title, String description, num price,
      String brand, String category, String thumbnail, List<String> image);
}

class ProductsServiceImp extends ProductsService {
  @override
  Future getAllProducts() async {
    Response response = await dio.get(allProducts);

    return response.data;
  }

  @override
  Future getCategories() async {
    Response response = await dio.get(categories);

    return response.data;
  }

  @override
  Future setNewproduct(
      String title,
      String description,
      num price,
      String brand,
      String category,
      String thumbnail,
      List<String> image) async {
    NewProduct data = NewProduct(
      category: category,
      title: title,
      description: description,
      price: price,
      brand: brand,
      thumbnail: thumbnail,
      images: [
        image[0],
        image[1],
        image[2],
        image[3],
        image[4],
      ],
    );
    Response response = await dio.post(newProduct, data: data.toJson());
    if (response.statusCode == 200) {
      print('Success');
      return 'Success';
    } else {
      print("Error");
    }
  }
}
