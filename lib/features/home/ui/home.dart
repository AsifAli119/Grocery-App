import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery_app/features/home/bloc/home_bloc.dart';
import 'package:grocery_app/features/home/ui/product_tile_widget.dart';
import 'package:grocery_app/features/whishlist/ui/wishlist.dart';

import '../../cart/ui/cart.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

final HomeBloc homeBloc = HomeBloc();

class _HomeState extends State<Home> {
  @override
  void initState() {
    homeBloc.add(HomeInitialEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
        bloc: homeBloc,
        listenWhen: (previous, current) => current is HomeActionState,
        buildWhen: (previous, current) => current is! HomeActionState,
        listener: (context, state) {
          if (state is HomeNavigateToCartPageActionState) {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => Cart()));
          } else if (state is HomeNavigateToWishlistPageActionState) {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => Wishlist()));
          }else if(state is HomeProductItemAddedToCartActionState){
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Item added to Cart")));
          }else if(state is HomeProductItemAddedToWishlistActionState){
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Item added to Wishlist")));
          }
        },
        builder: (context, state){
          switch (state.runtimeType) {
            case HomeLoadingState:
              return Scaffold(
                body: Center(
                  child: CircularProgressIndicator(),
                ),
              );
            case HomeLoadedSuccessState:
              final successState = state as HomeLoadedSuccessState;
              return Scaffold(
                appBar: AppBar(
                  backgroundColor: Colors.teal,
                  actions: [
                    IconButton(
                        onPressed: () {
                          homeBloc.add(HomeWishlistButtonNavigateEvent());
                        },
                        icon: Icon(Icons.favorite_border)),
                    IconButton(
                        onPressed: () {
                          homeBloc.add(HomeCartButtonNavigateEvent());
                        },
                        icon: Icon(Icons.shopping_cart_outlined)),
                  ],
                  title: Text("Grocery App"),
                ),
                body: ListView.builder(
                  itemCount: successState.products.length,
                    itemBuilder: (context, index){
                  return ProductTileWidget(
                    homeBloc: homeBloc,
                      productDataModel: successState.products[index]);
                }),
              );
            case HomeErrorState:
              return Scaffold(
                body: Center(
                  child: Text("Error Loading.. Try again"),
                ),
              );
            default: return SizedBox();
          }
        },
        );
  }
}
