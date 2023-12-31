import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery_app/features/cart/bloc/cart_bloc.dart';

import '../../home/ui/product_tile_widget.dart';
import 'cart_tile_widget.dart';

class Cart extends StatefulWidget {
  const Cart({super.key});

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  final CartBloc cartBloc = CartBloc();

  @override
  void initState() {
    cartBloc.add(CartInitialEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cart Items"),
      ),
      body: BlocConsumer<CartBloc, CartState>(
        bloc: cartBloc,
        listenWhen: (previous, current) => current is !CartActionState,
        listener: (context, state) {
          if(state is CartSuccessState ){
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Item Removed Form Cart")));
          }
        },
        buildWhen: (previous, current) => current is !CartActionState,
        builder: (context, state) {
          if (state is CartSuccessState) {
            final successState = state as CartSuccessState;
            return ListView.builder(
              itemCount: successState.cartItems.length,
              itemBuilder: (context, index) {
                return CartTileWidget(
                  cartBloc: cartBloc,
                  productDataModel: successState.cartItems[index],
                );
              },
            );
          }
          if (state is CartNoItemState) {
            final noItems = state as CartNoItemState;
            print("Displaying no items image: ${noItems.url}");
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height * 0.30,
                    width: MediaQuery.of(context).size.width * 0.50,
                    child: Image.network(noItems.url),
                  ),
                  Text(
                    "Your Cart is empty..!",
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            );
          } else {
            return Container(); // Default empty container
          }
        },
      ),
    );
  }
}
