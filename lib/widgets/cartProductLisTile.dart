import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lingkung/providers/userProvider.dart';
import 'package:lingkung/utilities/colorStyle.dart';
import 'package:lingkung/utilities/textStyle.dart';
import 'package:provider/provider.dart';

class CartProductLisTile extends StatefulWidget {
  _CartProductLisTileState createState() => _CartProductLisTileState();
}

class _CartProductLisTileState extends State<CartProductLisTile> {
  final _scaffoldStateKey = GlobalKey<ScaffoldState>();

  bool loading = false;
  bool _isChecked = false;
  int _quantity = 1;

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);
    return ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: userProvider.userModel.cartProduct.length,
        itemBuilder: (_, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              child: Padding(
                padding: EdgeInsets.fromLTRB(0, 10.0, 10.0, 10.0),
                child: Row(
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
                    Column(
                      children: <Widget>[
                        Container(
                          width: 70.0,
                          height: 70.0,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: NetworkImage(userProvider
                                      .userModel.cartProduct[index].image),
                                  fit: BoxFit.cover),
                              borderRadius: BorderRadius.circular(10.0),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.black12,
                                    offset: Offset(0.0, 0.0),
                                    blurRadius: 3.0),
                              ]),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 16.0,
                    ),
                    Expanded(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          CustomText(
                            text:
                                "${userProvider.userModel.cartProduct[index].name}",
                            line: 2,
                            over: TextOverflow.ellipsis,
                          ),
                          SizedBox(height: 5.0),
                          CustomText(
                            text: NumberFormat.currency(
                                    locale: 'id',
                                    symbol: 'Rp ',
                                    decimalDigits: 0)
                                .format(userProvider
                                    .userModel.cartProduct[index].price),
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
                                  loading = true;
                                  bool value =
                                      await userProvider.removeFromCart(
                                          cartItem: userProvider
                                              .userModel.cartProduct[index]);
                                  if (value) {
                                    userProvider.reloadUserModel();
                                    print("Removed from Cart!");
                                    _scaffoldStateKey.currentState.showSnackBar(
                                        SnackBar(
                                            content:
                                                Text("Removed from Cart!")));
                                    setState(() {
                                      loading = false;
                                    });
                                    return;
                                  } else {
                                    print("ITEM WAS NOT REMOVED");
                                    setState(() {
                                      loading = false;
                                    });
                                  }
                                },
                                child: Icon(
                                  Icons.delete,
                                  color: Colors.grey,
                                ),
                              ),
                              SizedBox(width: 10.0),
                              InkWell(
                                  onTap: () {
                                    if (_quantity != 1) {
                                      setState(() {
                                        _quantity -= 1;
                                      });
                                    }
                                  },
                                  child: Container(
                                      width: 25.0,
                                      height: 25.0,
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              color: yellow, width: 2.0),
                                          borderRadius:
                                              BorderRadius.circular(10.0)),
                                      child: Icon(Icons.remove,
                                          color: Colors.grey, size: 14.0))),
                              SizedBox(width: 10.0),
                              CustomText(
                                  text:
                                      '${userProvider.userModel.cartProduct[index].quantity}'),
                              SizedBox(width: 10.0),
                              InkWell(
                                  onTap: () {
                                    setState(() {
                                      _quantity += 1;
                                    });
                                  },
                                  child: Container(
                                      width: 25.0,
                                      height: 25.0,
                                      decoration: BoxDecoration(
                                          color: yellow,
                                          borderRadius:
                                              BorderRadius.circular(10.0)),
                                      child: Icon(Icons.add,
                                          color: Colors.grey, size: 14.0))),
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
