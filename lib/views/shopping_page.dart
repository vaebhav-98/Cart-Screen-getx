import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopcart/controllers/cart_controller.dart';
import 'package:shopcart/controllers/shop_controller.dart';

class ShoppingPage extends StatelessWidget {
  // const ShoppingPage({Key? key}) : super(key: key);

  ShopController shopController = Get.put(ShopController());
  CartController cartController = Get.put(CartController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.grey, 
      title: Text('Cart Screen'),
      actions: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Stack(
            children: [
              Stack(
                children: <Widget>[
                  Icon(
                    Icons.shopping_cart_outlined,
                    size: 30,
                  ),
                  Positioned(
                    right: 0,
                    child: Container(
                      padding: EdgeInsets.all(1),
                      decoration: BoxDecoration(
                        color: Colors.red[400],
                        borderRadius: BorderRadius.circular(8),
                      ),
                      constraints: BoxConstraints(
                        minWidth: 15,
                        minHeight: 12,
                      ),
                      child: Obx(
                        ()=> Text(
                          cartController.counter.toString(),
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 10,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        )
      ]),
      body: SafeArea(
          child: Column(
        children: [
          Expanded(
              child: Obx(()
              
                =>shopController.products.isEmpty? 
                CircularProgressIndicator()
                 : GridView.builder(
                    physics: BouncingScrollPhysics(),
                    itemCount: shopController.products.length,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 1.0,
                    ),
                    itemBuilder: (context, index) {
                      return Card(
                        elevation: 4,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              // Icon(
                              //   Icons.all_inclusive_outlined,
                              //   size: 100,
                              // ),
                              Obx(()=> Expanded(child: Image.network(shopController.products[index].productImage,fit: BoxFit.cover,))),
              
                              Column(
                                // mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Obx(()=> Text(shopController.products[index].productName)), 
                                  Obx(()=> Text(shopController.products[index].productDescription)),
                                ]
                              ),
              
                              ElevatedButton.icon(
                                  onPressed: () {
                                    cartController.addToCart(shopController.products[index]);
                                  },
                                  icon: Icon(Icons.add),
                                  label: Text('Add'))
                            ],
                          ),
                        ),
                      );
                    }),
              )),
          Container(
            padding: EdgeInsets.all(10),
            color: Colors.blueGrey,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Obx(
                  ()=> Text(
                    'Total Amount: \$${cartController.totalCount.toString()}',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                ElevatedButton(onPressed: () {
                  cartController.cartItems.clear();
                }, child: Text('Clear'))
              ],
            ),
          ),
        ],
      )),
    );
  }
}
