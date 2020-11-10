import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lingkung/models/productCartModel.dart';
import 'package:lingkung/models/userModel.dart';
import 'package:lingkung/providers/userProvider.dart';
import 'package:lingkung/providers/productCartProvider.dart';
import 'package:lingkung/services/productCartService.dart';
import 'package:lingkung/utilities/colorStyle.dart';
import 'package:lingkung/utilities/textStyle.dart';
import 'package:provider/provider.dart';

class ProductCartCard extends StatefulWidget {
  final UserModel userModel;
  final ProductCartModel productCartModel;
  ProductCartCard({this.userModel, this.productCartModel});
  _ProductCartCardState createState() => _ProductCartCardState();
}

class _ProductCartCardState extends State<ProductCartCard> {
  ProductCartServices _productCartService = ProductCartServices();

  String status = "";
  bool loading = false;
  bool _isChecked = false;

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);
    final productCartProvider = Provider.of<ProductCartProvider>(context);

    return Card(
      child: Padding(
        padding: EdgeInsets.fromLTRB(0, 10.0, 10.0, 10.0),
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                SizedBox(width: 10.0),
                Icon(Icons.store),
                SizedBox(width: 16.0),
                CustomText(
                  text: '${widget.productCartModel.storeOwnerName}',
                  weight: FontWeight.w600,
                ),
              ],
            ),
            Divider(),
            Row(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Checkbox(
                  value: _isChecked,
                  onChanged: (bool value) {
                    setState(() {
                      _isChecked = value;
                    });
                  },
                  activeColor: blue,
                ),
                Container(
                  width: 70.0,
                  height: 70.0,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(widget.productCartModel.image),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.circular(10.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        offset: Offset(0.0, 0.0),
                        blurRadius: 3.0,
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 16.0),
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      CustomText(
                        text: "${widget.productCartModel.name}",
                        line: 2,
                        over: TextOverflow.ellipsis,
                      ),
                      SizedBox(height: 5.0),
                      CustomText(
                        text: NumberFormat.currency(
                          locale: 'id',
                          symbol: 'Rp ',
                          decimalDigits: 0,
                        ).format(widget.productCartModel.price),
                        color: Colors.red,
                        size: 16.0,
                        weight: FontWeight.w600,
                      ),
                      SizedBox(height: 10.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          GestureDetector(
                            onTap: () async {
                              setState(() {
                                loading = true;
                              });
                              await _productCartService.deleteFromCart(
                                  userId: widget.userModel.id,
                                  docId: widget.productCartModel.id);
                              print("Removed from Cart!");
                              userProvider.reloadUserModel();
                              setState(() {
                                loading = false;
                              });
                            },
                            child: Icon(
                              Icons.delete,
                              color: Colors.grey,
                            ),
                          ),
                          SizedBox(width: 10.0),
                          InkWell(
                            onTap: () async {
                              status = "Decrement";
                              if (widget.productCartModel.quantity != 1) {
                                await productCartProvider.updateItemQuantity(
                                    userId: widget.userModel.id,
                                    status: status,
                                    productCartModel: widget.productCartModel);
                                productCartProvider.loadProductCart();
                                print("Decrement!");
                              }
                            },
                            child: Container(
                              width: 25.0,
                              height: 25.0,
                              decoration: BoxDecoration(
                                border: Border.all(color: yellow, width: 2.0),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              child: Icon(
                                Icons.remove,
                                color: Colors.grey,
                                size: 14.0,
                              ),
                            ),
                          ),
                          SizedBox(width: 10.0),
                          CustomText(
                              text: '${widget.productCartModel.quantity}'),
                          SizedBox(width: 10.0),
                          InkWell(
                            onTap: () async {
                              status = "Increment";
                              await productCartProvider.updateItemQuantity(
                                  userId: widget.userModel.id,
                                  status: status,
                                  productCartModel: widget.productCartModel);
                              productCartProvider.loadProductCart();
                              print("Increment!");
                            },
                            child: Container(
                              width: 25.0,
                              height: 25.0,
                              decoration: BoxDecoration(
                                color: yellow,
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              child: Icon(Icons.add,
                                  color: Colors.grey, size: 14.0),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
