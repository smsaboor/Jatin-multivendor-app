import 'package:flutter/material.dart';
import 'package:multivendor_app/api/api.dart';
import 'package:multivendor_app/api/api_const.dart';
import 'package:multivendor_app/common_widget/ui_appbar.dart';
import 'package:multivendor_app/shared/my_constant.dart';
import 'package:multivendor_app/views/cart/model_cart.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyCartView extends StatefulWidget {
  const MyCartView({Key? key}) : super(key: key);

  @override
  State<MyCartView> createState() => _MyCartViewState();
}

class _MyCartViewState extends State<MyCartView> {
  bool isAdded = false;
  int value = 1;
  String? token;
  bool loading = true;
  String errorMsg = "No Data";
  List<bool> quantityLoading=[];

  getToken() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    token = await preferences.getString("accessToken");
    setState(() {
      loading = false;
    });
  }

  Future<Cart?> getData() async {
    Cart? cart;
    var data = await ApiCall.getApi(apiGetCart, token);
    if (data['status'] == '404') {
      errorMsg = data['message'];
    } else if (data['status'] == 200) {
      cart = await Cart.fromJson(data);
    }
    return cart;
  }

  @override
  void initState() {
    getToken();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: MyConstant.white,
      child: SafeArea(
        child: Scaffold(
          body: Column(
            children: [
              const SizedBox(height: MyConstant.defaultPadding),
              const UiAppBar(
                text: "My Cart",
                isTrailing: true,
              ),
              loading ? CircularProgressIndicator() : _buildCartContainer(),
            ],
          ),
        ),
      ),
    );
  }

  _buildCartContainer() {
    return Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: MyConstant.defaultPadding / 2,
          vertical: MyConstant.defaultPadding),
      child: Column(
        children: [
          Row(
            children: [
              const SizedBox(width: MyConstant.defaultPadding / 2),
              const Icon(
                Icons.history,
                color: MyConstant.green,
              ),
              const SizedBox(width: MyConstant.defaultPadding / 2),
              const Text("Delivery In Tomorrow 9:30",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400)),
              const Spacer(),
              _buildOfferContainer(),
            ],
          ),
          const SizedBox(height: MyConstant.defaultPadding),
          SizedBox(
            height: MediaQuery.of(context).size.height * .75,
            child: FutureBuilder<Cart?>(
                future: getData(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                        itemCount: snapshot.data!.data.products.length,
                        itemBuilder: (context, index) {
                          Product product = snapshot.data!.data.products[index];
                          quantityLoading.add(false);
                          return Container(
                            padding: EdgeInsets.all(10),
                            child: Flex(
                              direction: Axis.horizontal,
                              children: [
                                const SizedBox(
                                    width: MyConstant.defaultPadding / 2),
                                Image.network(
                                  product.productId.images.length == 0
                                      ? "https://img.freepik.com/free-photo/top-view-fresh-vegetables-with-greens-dark-blue-background-salad-snack-vegetable-food_140725-40264.jpg?w=740&t=st=1691471631~exp=1691472231~hmac=9b21b8f3205710d7ea7d246a88ed065b17b2464ff2e89a94dc25bb72c3f95f95"
                                      : "https://img.freepik.com/free-photo/top-view-fresh-vegetables-with-greens-dark-blue-background-salad-snack-vegetable-food_140725-40264.jpg?w=740&t=st=1691471631~exp=1691472231~hmac=9b21b8f3205710d7ea7d246a88ed065b17b2464ff2e89a94dc25bb72c3f95f95",
                                  width: 100,
                                  height: 100,
                                ),
                                const SizedBox(
                                    width: MyConstant.defaultPadding),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      product.productId.name ?? '',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 16,
                                          color: Colors.black),
                                    ),
                                    Text(
                                      product.quantity.toString(),
                                      style: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 16,
                                          color: Colors.black),
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          "₹ ${product.productPrice}",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w400,
                                              fontSize: 16,
                                              color: Colors.black),
                                        ),
                                        const SizedBox(
                                            width:
                                                MyConstant.defaultPadding / 2),
                                        Text(
                                          "₹ ${product.productPrice + product.discountPrice}",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w400,
                                              fontSize: 16,
                                              color: Colors.black,
                                              decoration:
                                                  TextDecoration.lineThrough),
                                        ),
                                        const SizedBox(
                                            width: MyConstant.defaultPadding),
                                        _buildAddItem(product.productId.id,
                                            product.quantity,index),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          );
                        });
                  } else if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator(color: Colors.red,));
                  } else {
                    return Center(
                      child: Text(errorMsg),
                    );
                  }
                }),
          ),
        ],
      ),
    );
  }

  _buildOfferContainer() {
    return Container(
      height: 15,
      width: 60,
      decoration: const BoxDecoration(
        color: MyConstant.primaryColor,
      ),
      child: const Center(
        child: Text(
          "13 % OFF",
          style: TextStyle(
              color: MyConstant.white,
              fontSize: 8,
              fontWeight: FontWeight.w400),
        ),
      ),
    );
  }

  _buildAddItem(productId, quantity, index) {
    return Container(
        height: 35,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(MyConstant.defaultPadding / 2),
          color: MyConstant.primaryColor,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            IconButton(
              onPressed: () async {
                if (quantity == 0) {
                } else {
                  setState(() {
                    quantityLoading[index] = true;
                  });
                  await ApiCall.postApiWithAuth(
                      apiAddToCart,
                      {"productId": productId, "quantity": quantity - 1},
                      token);
                }
                setState(() {
                  quantityLoading[index]  = false;
                });
              },
              icon: const Icon(
                Icons.remove,
                size: 20,
                color: MyConstant.white,
              ),
            ),
            quantityLoading[index]
                ? SizedBox(
                    height: 15,
                    width: 15,
                    child: Center(child: CircularProgressIndicator(color: Colors.white,)))
                : Text(
                    quantity.toString(),
                    style: const TextStyle(color: MyConstant.white),
                  ),
            IconButton(
              onPressed: () async {
                setState(() {
                  quantityLoading[index]  = true;
                });
                await ApiCall.postApiWithAuth(apiAddToCart,
                    {"productId": productId, "quantity": quantity + 1}, token);
                setState(() {
                  quantityLoading[index]  = false;
                });
              },
              icon: const Icon(
                Icons.add,
                size: 20,
                color: MyConstant.white,
              ),
            ),
          ],
        ));
  }
}
