import 'package:get/get.dart';
import 'package:shopcart/models/product.dart';

class CartController extends GetxController{
  var cartItems = <Product>[].obs;

  int get counter => cartItems.length;

  double get totalCount => cartItems.fold(0, (sum, item) => sum + item.price);

  addToCart(Product product){
    cartItems.add(product);
  }
}