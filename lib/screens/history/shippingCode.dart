import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter/services.dart';
//  Models
import 'package:lingkung/models/productOrderModel.dart';
//  Providers
import 'package:lingkung/providers/userProvider.dart';
import 'package:lingkung/providers/productOrderProvider.dart';
//  Utilities
import 'package:lingkung/utilities/colorStyle.dart';
import 'package:lingkung/utilities/loading.dart';
import 'package:lingkung/utilities/textStyle.dart';

class ShippingCode extends StatefulWidget {
  final ProductOrderModel orderModel;
  ShippingCode({this.orderModel});
  @override
  _ShippingCodeState createState() => _ShippingCodeState();
}

class _ShippingCodeState extends State<ShippingCode> {
  final _scaffoldStateKey = GlobalKey<ScaffoldState>();
  final _formKey = GlobalKey<FormState>();

  String _resi = '';
  bool loading = false;
  @override
  Widget build(BuildContext context) {
    return loading
        ? Loading()
        : SafeArea(
            child: Scaffold(
              key: _scaffoldStateKey,
              backgroundColor: white,
              appBar: AppBar(
                backgroundColor: white,
                iconTheme: IconThemeData(color: black),
                title: CustomText(
                  text: 'Atur Pengiriman',
                  size: 18.0,
                  weight: FontWeight.w600,
                ),
                actions: <Widget>[
                  IconButton(
                    icon: Icon(Icons.help_outline, color: black),
                    onPressed: null,
                  ),
                ],
              ),
              body: Form(
                key: _formKey,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText(
                        text: 'Nomor Pengiriman',
                        size: 18.0,
                        weight: FontWeight.w600,
                      ),
                      TextFormField(
                        textCapitalization: TextCapitalization.words,
                        style: TextStyle(
                          fontFamily: "Poppins",
                          color: black,
                        ),
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(10),
                        ],
                        decoration: InputDecoration(
                          counterStyle: TextStyle(
                            fontFamily: "Poppins",
                            color: black,
                          ),
                          hintText: 'Contoh: 123A5G7B9',
                          hintStyle: TextStyle(fontFamily: "Poppins"),
                          errorStyle: TextStyle(fontFamily: "Poppins"),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: blue),
                          ),
                        ),
                        onChanged: (String str) {
                          setState(() {
                            _resi = str;
                          });
                        },
                        validator: (value) => (value.isEmpty)
                            ? 'Masukkan nomor pengiriman sesuai produk yang terjual'
                            : (value.length > 10)
                                ? 'Maksimal nomor yang dimasukkan adalah 10'
                                : null,
                      ),
                    ],
                  ),
                ),
              ),
              bottomNavigationBar: Container(
                height: 80.0,
                color: white,
                padding: const EdgeInsets.all(16.0),
                child: FlatButton(
                  color: green,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Center(
                    child: CustomText(
                      text: 'KIRIM',
                      color: white,
                      size: 16.0,
                      weight: FontWeight.w700,
                    ),
                  ),
                  onPressed: () {
                    save();
                  },
                ),
              ),
            ),
          );
  }

  void save() async {
    final orderProvider =
        Provider.of<ProductOrderProvider>(context, listen: false);
    if (_formKey.currentState.validate()) {
      setState(() {
        loading = true;
      });
      if (_resi != null) {
        orderProvider.updateProductOrders(
          productOrdersId: widget.orderModel.id,
          userId: widget.orderModel.userId,
          storeOwnerId: widget.orderModel.storeOwnerId,
          storeOwnerName: widget.orderModel.storeOwnerName,
          address: widget.orderModel.address,
          productCartModel: widget.orderModel.listProduct,
          shipping: widget.orderModel.shipping,
          shippingPrice: widget.orderModel.shippingPrice,
          subTotalProduct: widget.orderModel.subTotalProduct,
          total: widget.orderModel.total,
          note: widget.orderModel.note,
          resi: _resi,
          status: "Dikirim",
          createdAt: widget.orderModel.createdAt,
        );
        setState(() {
          loading = false;
        });
        Navigator.pop(context);
        orderProvider.loadOrder();
        _resi = '';
      } else {
        setState(() {
          loading = false;
        });
      }
    }
  }
}
