import 'package:flutter/material.dart';

class ExploreProductPage extends StatefulWidget {
  @override
  _ExploreProductPageState createState() => _ExploreProductPageState();
}

class _ExploreProductPageState extends State<ExploreProductPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff5bc0eb),
        title: Text(
          'Produk',
          style: TextStyle(
            fontFamily: "Poppins",
          ),
        ),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Icon(
              Icons.shopping_cart,
              color: const Color(0xffffffff),
            ),
          ),
        ],
      ),
      backgroundColor: Colors.white,
      body: ListView(
        padding: EdgeInsets.only(left: 20.0, right: 20.0),
        children: <Widget>[
          Wrap(
            direction: Axis.vertical,
            alignment: WrapAlignment.start,
            spacing: 10.0,
            runSpacing: 20.0,
            children: <Widget>[
              
            ],
          )
        ],
      ),
    );
  }
}
//   Widget _buildFoodItems(Food food) {
//     return Container(
//       margin: EdgeInsets.only(bottom: 20.0),
//       child: BoughtFood(
//         id: food.id,
//         name: food.name,
//         imagePath: food.imagePath,
//         category: food.category,
//         discount: food.discount,
//         price: food.price,
//         ratings: food.ratings,
//       ),
//     );
//   }
// }