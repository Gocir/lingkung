import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:lingkung/main.dart';
import 'package:provider/provider.dart';
//  Models
import 'package:lingkung/models/productModel.dart';
//  Provider
import 'package:lingkung/providers/productProvider.dart';
//  Screens
import 'package:lingkung/screens/products/updateProduct.dart';
//  Services
import 'package:lingkung/services/productService.dart';
//  Utilities
import 'package:lingkung/utilities/colorStyle.dart';
import 'package:lingkung/utilities/loading.dart';
import 'package:lingkung/utilities/textStyle.dart';

class DetailMyProduct extends StatefulWidget {
  final ProductModel productModel;
  DetailMyProduct({this.productModel});

  @override
  _DetailMyProductState createState() => _DetailMyProductState();
}

class _DetailMyProductState extends State<DetailMyProduct> {
  ProductServices _productService = ProductServices();

  bool loading = false;
  @override
  Widget build(BuildContext context) {
    return loading ? Loading() : SafeArea(
      top: false,
      child: Scaffold(
        backgroundColor: white,
        body: CustomScrollView(
          // physics: BouncingScrollPhysics(),
          slivers: <Widget>[
            SliverAppBar(
              snap: true,
              floating: true,
              iconTheme: IconThemeData(color: black),
              leading: Container(
                margin: const EdgeInsets.all(8.0),
                child: CircleAvatar(
                  backgroundColor: Colors.white.withOpacity(0.5),
                  child: IconButton(
                    icon: Icon(Icons.arrow_back, color: black),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
              ),
              actions: <Widget>[
                CircleAvatar(
                  backgroundColor: Colors.white.withOpacity(0.5),
                  child: IconButton(
                    icon: Icon(Icons.edit, color: black),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              UpdateProduct(productModel: widget.productModel),
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(width: 8.0),
                CircleAvatar(
                  backgroundColor: Colors.white.withOpacity(0.5),
                  child: IconButton(
                    icon: Icon(Icons.delete, color: black),
                    onPressed: () {
                      _deleteModalBottomSheet(context);
                    },
                  ),
                ),
                SizedBox(width: 8.0),
                CircleAvatar(
                  backgroundColor: Colors.white.withOpacity(0.5),
                  child: PopupMenuButton(
                    icon: Icon(Icons.more_vert, color: black),
                    offset: Offset(100, 44),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20.0),
                        bottomLeft: Radius.circular(20.0),
                        bottomRight: Radius.circular(20.0),
                      ),
                    ),
                    itemBuilder: (BuildContext context) {
                      return [
                        PopupMenuItem(
                          child: InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => MainPage(),
                                ),
                              );
                            },
                            child: Row(
                              children: <Widget>[
                                Icon(Icons.home, color: yellow),
                                SizedBox(width: 5.0),
                                CustomText(text: 'Kembali ke Halaman Utama')
                              ],
                            ),
                          ),
                        ),
                        PopupMenuItem(
                          child: Row(
                            children: <Widget>[
                              Icon(Icons.help_outline, color: yellow),
                              SizedBox(width: 5.0),
                              CustomText(text: 'Butuh Bantuan?')
                            ],
                          ),
                        ),
                      ];
                    },
                  ),
                ),
                SizedBox(width: 8.0),
              ],
              backgroundColor: white,
              expandedHeight: 200.0,
              flexibleSpace: FlexibleSpaceBar(
                background: CachedNetworkImage(
                  imageUrl: widget.productModel.image.toString(),
                  imageBuilder: (context, imageProvider) => Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: imageProvider,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  placeholder: (context, url) => Center(
                    child: SpinKitThreeBounce(
                      color: black,
                      size: 20.0,
                    ),
                  ),
                  errorWidget: (context, url, error) => Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/images/noimage.png"),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.all(16.0),
              sliver: SliverToBoxAdapter(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    CustomText(
                        text: '${widget.productModel.name}',
                        size: 16,
                        weight: FontWeight.w500),
                    SizedBox(height: 20.0),
                    CustomText(
                      text: NumberFormat.currency(
                        locale: 'id',
                        symbol: 'Rp ',
                        decimalDigits: 0,
                      ).format(widget.productModel.price),
                      size: 18,
                      color: Colors.red,
                      weight: FontWeight.w500,
                    ),
                    SizedBox(height: 10.0),
                    Divider(),
                    CustomText(
                      text: 'Informasi Produk',
                      size: 16.0,
                      weight: FontWeight.w500,
                    ),
                    SizedBox(height: 5.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        CustomText(
                          text: 'Stok',
                        ),
                        CustomText(
                          text: '${widget.productModel.stock}',
                          color: grey,
                          weight: FontWeight.w600,
                        ),
                      ],
                    ),
                    Divider(),
                    CustomText(
                      text: 'Deskripsi Produk',
                      size: 16.0,
                      weight: FontWeight.w500,
                    ),
                    SizedBox(height: 5.0),
                    CustomText(
                      text: '${widget.productModel.description}',
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
  
  void _deleteModalBottomSheet(context) {
    showModalBottomSheet<void>(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.0),
          topRight: Radius.circular(20.0),
        ),
      ),
      context: context,
      builder: (BuildContext context) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.close),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(16.0, 0, 16.0, 16.0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                            height: MediaQuery.of(context).size.width / 2.2,
                            alignment: Alignment.center,
                            child:
                                Image.asset("assets/images/verifailed.png"),),
                        CustomText(
                            text:
                                'Yakin ingin menghapus produkmu?',
                            size: 18.0,
                            weight: FontWeight.w700,),
                        SizedBox(height: 5.0),
                        CustomText(
                            text:
                                'Produkmu ini akan dihapus dari sistem dan kamu tidak akan melihatnya lagi.'),
                  SizedBox(height: 16.0),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          height: 48,
                          child: OutlineButton(
                            color: green,
                            highlightedBorderColor: green,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50),
                            ),
                            borderSide: BorderSide(color: green, width: 2.5),
                            child: CustomText(
                              text: 'TIDAK',
                              color: green,
                              size: 16.0,
                              weight: FontWeight.w700,
                            ),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          ),
                        ),
                      ),
                      SizedBox(width: 15.0),
                      Expanded(
                        child: Container(
                          height: 48,
                          child: FlatButton(
                            color: green,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50),
                            ),
                            child: CustomText(
                              text: 'YA',
                              color: white,
                              size: 16.0,
                              weight: FontWeight.w700,
                            ),
                            onPressed: () async {
                              setState(() {  
                                loading = true;
                              });
                              await _productService.deleteProduct(widget.productModel.id);
                              print("Product Deleted!");
                              setState(() {
                                loading = false;
                              });
                              Navigator.pop(context);
                              Navigator.pop(context);
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
