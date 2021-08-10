import 'package:flutter/material.dart';
import 'package:flutter_shop/constants/colors.dart';
import 'package:flutter_shop/widgets/cart_full.dart';
import 'package:flutter_shop/widgets/empty_cart.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const _productList = [3];
    return _productList.isEmpty
        ? Scaffold(
            body: EmptyCart(),
          )
        : Scaffold(
            appBar: AppBar(
              title: Text(
                "Your Cart ()",
                style: TextStyle(color: Colors.white),
              ),
              backgroundColor: Colors.teal,
            ),
            body: Container(
              child: ListView.builder(
                  itemCount: 8,
                  itemBuilder: (context, index) {
                    return CartFull();
                  }),
            ),
            bottomSheet: _checkoutSection(context),
          );
  }

  Widget _checkoutSection(BuildContext context) {
    return Container(
      color: Colors.white70,
      height: 60,
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Container(
              margin: EdgeInsets.only(left: 10),
              height: 40,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  gradient: LinearGradient(colors: [
                    ColorsConsts.gradiendFStart,
                    ColorsConsts.gradiendLEnd
                  ])),
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  splashColor: Colors.white,
                  onTap: () {},
                  borderRadius: BorderRadius.circular(12),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 8.0, horizontal: 30),
                    child: Text(
                      "Checkout",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Spacer(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Text(
                  "Total: ",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
                ),
                Text(
                  "\$US 567.87",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                      color: Colors.blue),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
