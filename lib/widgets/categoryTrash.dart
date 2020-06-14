import 'package:flutter/material.dart';
import 'package:lingkung/models/categoryTrashModel.dart';
import 'package:lingkung/utilities/colorStyle.dart';
import 'package:lingkung/utilities/textStyle.dart';

List<CategoryTrash> categoriesList = [
  CategoryTrash(categoryId: "1", categoryName: "Semua"),
  CategoryTrash(categoryId: "2", categoryName: "Organik"),
  CategoryTrash(categoryId: "3", categoryName: "Anorganik"),
  CategoryTrash(categoryId: "4", categoryName: "B3"),
];

class Categories extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60.0,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: categoriesList.length,
          itemBuilder: (_, index) {
            return Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0)),
              child: Padding(
                padding: EdgeInsets.all(12.0),
                child: Center(
                  child: CustomText(
                    text: categoriesList[index].categoryName,
                    size: 16,
                    color: black,
                    weight: FontWeight.w700,
                  ),
                ),
              ),
            );
          }),
    );
  }
}
