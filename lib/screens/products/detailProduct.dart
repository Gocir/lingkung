import 'package:flutter/material.dart';
import 'package:lingkung/models/productModel.dart';
import 'package:lingkung/providers/userProvider.dart';
import 'package:lingkung/utilities/colorStyle.dart';
import 'package:lingkung/utilities/textStyle.dart';
import 'package:provider/provider.dart';

class DetailProduct extends StatefulWidget {
  final ProductModel productModel;
  DetailProduct({this.productModel});

  @override
  _DetailProductState createState() => _DetailProductState();
}

class _DetailProductState extends State<DetailProduct> {
  @override
  Widget build(BuildContext context) {
    // final userProvider = Provider.of<UserProvider>(context);
    // userProvider.reloadUserModel(widget.productModel.userId);

    return Scaffold(
        body: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              pinned: true,
              floating: true,
              backgroundColor: blue,
              expandedHeight: 200.0,
              // leading: Container(
              //   margin: EdgeInsets.only(left: 16.0, top: 16.0),
              //   decoration: BoxDecoration(
              //     color: black.withOpacity(0.2),
              //     borderRadius: BorderRadius.circular(100.0),
              //   ),
              //   child: IconButton(
              //     icon: Icon(Icons.arrow_back),
              //     onPressed: () {
              //       Navigator.pop(context);
              //     },
              //   ),
              // ),
              // actions: <Widget>[
              //   Container(
              //     margin: EdgeInsets.only(right: 16.0, top: 16.0),
              //     decoration: BoxDecoration(
              //       color: black.withOpacity(0.2),
              //       borderRadius: BorderRadius.circular(100.0),
              //     ),
              //     child: IconButton(
              //       icon: Icon(Icons.shopping_cart),
              //       onPressed: () {
              //         // Navigator.pushReplacement(
              //         //     context,
              //         //     MaterialPageRoute(
              //         //       builder: (context) => TrashBankList(),
              //         //     ));
              //       },
              //     ),
              //   )
              // ],
              flexibleSpace: FlexibleSpaceBar(
                // title: CustomText(
                //   text: 'BS. ${widget.partner.name}',
                //   size: 20.0,
                //   weight: FontWeight.w600,
                // ),
                background: Image.network(
                  "${widget.productModel.image}",
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SliverFillRemaining(
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    CustomText(
                        text: '${widget.productModel.name}',
                        size: 16,
                        weight: FontWeight.w600),
                    SizedBox(height: 20.0),
                    CustomText(
                      text: 'Rp${widget.productModel.price}',
                      size: 18,
                    ),
                    SizedBox(height: 10.0),
                    // Divider(),
                    // Card(
                    //   child: ListTile(
                    //       leading: Container(
                    //           height: 60.0,
                    //           width: 60.0,
                    //           child: Image.asset(
                    //             "assets/images/user.png",
                    //             fit: BoxFit.cover,
                    //           )),
                    //       title: CustomText(
                    //           text: (userProvider.userModel.id == widget.productModel.userId) ? '${userProvider.userModel.name}' : null,
                    //           weight: FontWeight.w500),
                    //       dense: true),
                    // ),
                    Divider(),
                    CustomText(
                        text: 'Informasi Produk',
                        size: 16.0,
                        weight: FontWeight.w500),
                    SizedBox(height: 5.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        CustomText(
                          text: 'Stok',
                        ),
                        CustomText(
                          text: '${widget.productModel.stock}',
                        ),
                      ],
                    ),
                    Divider(),
                    CustomText(
                        text: 'Deskripsi Produk',
                        size: 16.0,
                        weight: FontWeight.w500),
                    SizedBox(height: 5.0),
                    CustomText(
                      text: '${widget.productModel.description}',
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
        bottomNavigationBar: Container(
          height: 60.0,
          padding: EdgeInsets.fromLTRB(16.0, 5.0, 16.0, 5.0),
          decoration: BoxDecoration(color: white, boxShadow: [
            BoxShadow(
                color: Colors.black12, offset: Offset(3, 0), blurRadius: 3)
          ]),
          child: Row(
            children: <Widget>[
              Expanded(
                flex: 1,
                child: RaisedButton(
                  color: white,
                  elevation: 1.0,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                      side: BorderSide(color: yellow, width: 2.0)),
                  child: Icon(Icons.message, color: yellow),
                  onPressed: () {
                    // Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //       builder: (context) => OrderTrash(),
                    //     ));
                  },
                ),
              ),
              SizedBox(width: 10.0),
              Expanded(
                flex: 2,
                child: RaisedButton(
                  color: white,
                  elevation: 1.0,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                      side: BorderSide(color: green, width: 2.0)),
                  child: CustomText(
                      text: 'Beli', color: green, weight: FontWeight.w700),
                  onPressed: () {
                    // Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //       builder: (context) => OrderTrash(),
                    //     ));
                  },
                ),
              ),
              SizedBox(width: 10.0),
              Expanded(
                flex: 2,
                child: RaisedButton(
                  color: green,
                  elevation: 1.0,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  child: Row(
                    children: <Widget>[
                      Icon(
                        Icons.add,
                        color: white,
                        size: 15.0,
                      ),
                      CustomText(
                          text: 'Keranjang',
                          color: white,
                          weight: FontWeight.w700),
                    ],
                  ),
                  onPressed: () {
                    // Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //       builder: (context) => OrderTrash(),
                    //     ));
                  },
                ),
              ),
            ],
          ),
        ));
  }
}
