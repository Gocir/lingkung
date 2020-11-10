import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lingkung/models/userModel.dart';
import 'package:lingkung/screens/products/checkoutProduct.dart';
import 'package:provider/provider.dart';
//  Providers
import 'package:lingkung/providers/userProvider.dart';
import 'package:lingkung/providers/productCartProvider.dart';
//  Utilities
import 'package:lingkung/utilities/colorStyle.dart';
import 'package:lingkung/utilities/loading.dart';
import 'package:lingkung/utilities/textStyle.dart';
//  Widget
import 'package:lingkung/widgets/productCartCard.dart';

class ProductCart extends StatefulWidget {
  final UserModel userModel;
  ProductCart({this.userModel});
  @override
  _ProductCartState createState() => _ProductCartState();
}

class _ProductCartState extends State<ProductCart> {
  final _scaffoldStateKey = GlobalKey<ScaffoldState>();

  bool loading = false;

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);
    final productCartProvider = Provider.of<ProductCartProvider>(context);
    productCartProvider.loadProductCartByUser(widget.userModel.id);
    productCartProvider.getTotal(widget.userModel.id);

    return loading
        ? Loading()
        : SafeArea(
            top: false,
            child: Scaffold(
              key: _scaffoldStateKey,
              backgroundColor: white,
              appBar: AppBar(
                backgroundColor: blue,
                iconTheme: IconThemeData(color: white),
                title: CustomText(
                  text: 'Keranjang',
                  color: white,
                  size: 18.0,
                  weight: FontWeight.w600,
                ),
              ),
              body: (productCartProvider.productCartByUser.isNotEmpty)
                  ? ListView.builder(
                      scrollDirection: Axis.vertical,
                      padding: const EdgeInsets.all(8.0),
                      itemCount: productCartProvider.productCartByUser.length,
                      itemBuilder: (_, index) {
                        return ProductCartCard(
                          userModel: widget.userModel,
                            productCartModel:
                                productCartProvider.productCartByUser[index]);
                      },
                    )
                  : Center(
                      child: CustomText(
                        text: 'Tambahkan Produk ke Keranjangmu, yuk!',
                        weight: FontWeight.w600,
                      ),
                    ),
              bottomNavigationBar: Container(
                height: 80.0,
                padding: EdgeInsets.fromLTRB(16.0, 5.0, 16.0, 5.0),
                decoration: BoxDecoration(
                  color: white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      offset: Offset(3, 0),
                      blurRadius: 3,
                    ),
                  ],
                ),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      flex: 2,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          CustomText(
                            text: "Total Harga",
                            size: 16.0,
                            weight: FontWeight.w600,
                          ),
                          CustomText(
                            text: NumberFormat.currency(
                              locale: 'id',
                              symbol: 'Rp ',
                              decimalDigits: 0,
                            ).format((productCartProvider.total == null)
                                                  ? 0
                                                  : productCartProvider.total),
                            color: Colors.red,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 10.0),
                    Expanded(
                      flex: 2,
                      child: Container(
                        height: 48.0,
                        child: FlatButton(
                          color: green,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: CustomText(
                            text: 'Beli',
                            color: white,
                            size: 16.0,
                            weight: FontWeight.w700,
                          ),
                          onPressed: () {
                            // List<CartProductModel> convertedCart = [];
                            // for (CartProductModel cartProduct
                            //     in value.userModel.cartProduct) {
                            //   if (cartProduct.isCheck) {
                            //     print(cartProduct.name);
                            //     convertedCart.add(
                            //         CartProductModel.fromMap(cartProduct.toMap()));
                            //     print(convertedCart);
                            //   }
                            // }
                            // Navigator.push(
                            //   context,
                            //   MaterialPageRoute(
                            //     builder: (context) => CheckoutProduct(
                            //       cartProductModel: convertedCart,
                            //     ),
                            //   ),
                            // );
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
  }
}
