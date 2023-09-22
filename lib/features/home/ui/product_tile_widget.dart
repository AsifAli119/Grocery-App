import 'package:flutter/material.dart';
import 'package:grocery_app/features/home/bloc/home_bloc.dart';
import 'package:grocery_app/features/home/ui/home.dart';
import 'package:grocery_app/models/data_model.dart';
class ProductTileWidget extends StatefulWidget {
  final HomeBloc homeBloc;
  final ProductDataModel productDataModel;
  const ProductTileWidget({super.key, required this.productDataModel, required this.homeBloc});

  @override
  State<ProductTileWidget> createState() => _ProductTileWidgetState();
}
bool isClicked = false;
class _ProductTileWidgetState extends State<ProductTileWidget> {
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
                        widget.productDataModel.imgUrl
                    ), fit: BoxFit.cover
                ),
              ),
            ),
          SizedBox(height: 10,),
          Text(widget.productDataModel.name, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),),
          Text(widget.productDataModel.description),
          Divider(color: Colors.grey,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween ,
            children: [
              Text("\$ "+widget.productDataModel.price.toString(), style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),),
              Row(
                children: [
                  IconButton(
                      onPressed: () {
                        homeBloc.add(HomeProductWishlistButtonClickedEvent(clickedProduct: widget.productDataModel));
                      },
                      icon: Icon(Icons.favorite_border)),
                  IconButton(
                      onPressed: () {
                        setState(() {
                          isClicked = !isClicked;
                        });
                        widget.homeBloc.add(HomeProductCartButtonClickedEvent(clickedProduct: widget.productDataModel));
                      },
                    icon: isClicked? Icon(Icons.shopping_cart): Icon(Icons.shopping_cart_outlined),
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

