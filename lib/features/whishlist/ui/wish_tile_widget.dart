import 'package:flutter/material.dart';
import 'package:grocery_app/features/whishlist/bloc/whishlist_bloc.dart';
import 'package:grocery_app/models/data_model.dart';

class WishlistTileWidget extends StatelessWidget {
  final WishlistBloc wishlistBloc;
  final ProductDataModel productDataModel;
  const WishlistTileWidget({super.key, required this.wishlistBloc, required this.productDataModel});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      margin: EdgeInsets.all(8),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.green)
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 200,
            width: double.maxFinite,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(15.0),
              image: DecorationImage(
                  image: NetworkImage(
                      productDataModel.imgUrl
                  ), fit: BoxFit.cover
              ),
            ),
          ),
          SizedBox(height: 10,),
          Text(productDataModel.name, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),),
          Text(productDataModel.description),
          Divider(color: Colors.grey,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween ,
            children: [
              Text("\$ "+productDataModel.price.toString(), style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),),
              Row(
                children: [
                  IconButton(
                    onPressed: () {
                      wishlistBloc.add(WishlistRemoveFromWishlistEvent(wishlistItemRemove: productDataModel));
                      // cartBloc.add(CartRemoveItemFromCartEvent(cartItemRemove: productDataModel));
                    },
                    icon: Icon(Icons.favorite, color: Colors.red,),
                  )
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}

