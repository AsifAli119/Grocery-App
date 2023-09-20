import 'package:flutter/material.dart';
import 'package:grocery_app/data/cart_items_added.dart';
import 'package:grocery_app/features/home/bloc/home_bloc.dart';
import 'package:grocery_app/features/home/model/product_data_model.dart';

import '../bloc/cart_bloc.dart';
class CartTileWidget extends StatelessWidget {
  final ProductDataModel productDataModel;
  final CartBloc cartBloc;
  const CartTileWidget({super.key, required this.productDataModel, required this.cartBloc});

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
                  IconButton(onPressed: (){
                    cartBloc.add(CartRemoveFromCartEvent(cartItemRemove: productDataModel));
                    // cartBloc.add(HomeProductCartButtonClickedEvent(
                    //     clickedProduct: productDataModel
                    // ));
                  }, icon: Icon(Icons.shopping_cart)),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
