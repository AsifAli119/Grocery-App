import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery_app/data/wishlist_items.dart';
import 'package:grocery_app/features/whishlist/bloc/whishlist_bloc.dart';
import 'package:grocery_app/features/whishlist/ui/wish_tile_widget.dart';
import 'package:grocery_app/models/data_model.dart';

class Wishlist extends StatefulWidget {
  const Wishlist({super.key});

  @override
  State<Wishlist> createState() => _WishlistState();
}

class _WishlistState extends State<Wishlist> {
  WishlistBloc wishlistBloc = WishlistBloc();
  @override
  void initState() {
    wishlistBloc.add(WishlistInitialEvent());
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Wishlist items"),
      ),
      body: BlocConsumer<WishlistBloc, WishlistState>(
        bloc: wishlistBloc,
        listener: (context, state) {
          if(state is WishlistRemoveFromWishlistActionState){
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Item removed successfully!")));
          }
        },
        listenWhen: (previous, next)=> next is WishlistActionState,
        buildWhen: (previous, next)=> next is !WishlistActionState,
        builder: (context, state) {
          switch(state.runtimeType){
            case WishlistLoadingState:
              return Center(
                child: CircularProgressIndicator(),
              );
            case WishlistSuccessState:
              final successState = WishlistSuccessState(wishlistItems: wishlist_items);
              return ListView.builder(
                itemCount: successState.wishlistItems.length,
                  itemBuilder: (context, index){
                return WishlistTileWidget(wishlistBloc: wishlistBloc, productDataModel: successState.wishlistItems[index]);
              });
          }
          return Container(
          );
        },
      ),
    );
  }
}
