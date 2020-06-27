import 'package:flutter/material.dart';
import 'package:lingkung/providers/userProvider.dart';
import 'package:lingkung/providers/productProvider.dart';
import 'package:lingkung/utilities/colorStyle.dart';
import 'package:lingkung/utilities/textStyle.dart';
import 'package:lingkung/widgets/productLisTile.dart';
import 'package:provider/provider.dart';

class MyProductPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);
    final productProvider = Provider.of<ProductProvider>(context);
    
    productProvider.loadProductByUser(userProvider.user.uid);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: blue,
        title: CustomText(text: 'Produk Toko Saya', size: 20.0, color: white, weight: FontWeight.w600,
        ),
      ),
      backgroundColor: Colors.white,
      body: Container(padding: EdgeInsets.all(16.0), child: ProductLisTile())
    );
  }
}