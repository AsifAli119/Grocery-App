import 'package:flutter/material.dart';
import 'package:grocery_app/features/home/model/product_data_model.dart';
class ProductTileWidget extends StatelessWidget {
  final ProductDataModel productDataModel;
  const ProductTileWidget({super.key, required this.productDataModel});

  @override
  Widget build(BuildContext context) {
    return Container(decoration: BoxDecoration(
      border: Border.all(color: Colors.grey, width: 3),
    ),
      margin: EdgeInsets.all(8),
      padding: EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 200,
            width: double.maxFinite,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey, width: 3),
              borderRadius: BorderRadius.circular(15),
              image: DecorationImage(
                  image: NetworkImage(productDataModel.imageUrl),
                fit: BoxFit.cover

              ),
            ),
          ),
          const SizedBox(height: 10,),
          Text(productDataModel.name, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
          Text(productDataModel.description),
          const SizedBox(height: 10,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("\$ "+productDataModel.price.toString(), style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              Row(
                children: [
                  IconButton(onPressed: (){}, icon: Icon(Icons.favorite_border)),
                  IconButton(onPressed: (){}, icon: Icon(Icons.shopping_cart_outlined)),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
