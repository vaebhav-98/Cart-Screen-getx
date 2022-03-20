import 'package:get/get.dart';
import 'package:shopcart/models/product.dart';

class ShopController extends GetxController{
  var products = <Product>[].obs;

  @override
  void onInit(){
    fetchProducts();
    super.onInit();
  }

  void fetchProducts() async{
    Future.delayed(Duration(seconds: 1));
    var productsList =[
      Product(
        id: 1, 
        productName: 'Red Shirt', 
        productDescription: 'A red shirt - it is pretty red!', 
        productImage: 'https://cdn.pixabay.com/photo/2016/10/02/22/17/red-t-shirt-1710578_1280.jpg', 
        price: 1999.9
        ),
      
      Product(
        id: 2, 
        productName: 'Legend', 
        productDescription: 'Built to last with matte leather uppers, StormKing™ lug rubber outsoles ',
        productImage: 'https://cdn.shopify.com/s/files/1/0419/1525/products/1024x1024-Men-Legend-BlackMatte-3.4_672x672.jpg?v=1600886623', 
        price: 1299.9
        ),
      
      Product(
        id: 3, 
        productName: 'Men\'s Sneakers', 
        productDescription: 'Clean & Comfortable Sneakers made with classic Leathers.',
        productImage: 'https://cdn.shopify.com/s/files/1/0419/1525/products/1024x1024-Men-PremierLowTop-Black-3.4.jpg?v=1600270679',
        price: 199.9
        ),
      
      Product(
        id: 4, 
        productName: 'The Chelsea',
        productDescription: 'Handcrafted for the men who wear their boots hard',
        productImage: 'https://cdn.shopify.com/s/files/1/0419/1525/products/1024x1024-Men-Cavalier-Toffee-210402-2.jpg?v=1618424894',
        price: 49.99
        ),
      
      Product(
        id: 5, 
        productName: 'The Chelsea',
        productDescription: 'Functional and Fashionable.',
        productImage: 'https://cdn.shopify.com/s/files/1/0419/1525/products/1024x1024-Men-PremierLowTop-Black-3.4.jpg?v=1600270679',
        price: 49.99
        ),  
    ]; 
    products.value = productsList;
  }
}