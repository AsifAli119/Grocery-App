import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:grocery_app/data/cart_items_added.dart';
import 'package:meta/meta.dart';

import '../../home/model/product_data_model.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartInitial()) {
    on<CartInitialEvent>(cartInitialEvent);
    on<CartRemoveFromCartEvent>(cartRemoveFromCartEvent);
    // Add other event handlers as needed
  }

  FutureOr<void> cartInitialEvent(CartInitialEvent event,
      Emitter<CartState> emit) {
    if (cartItemsAdded.isNotEmpty) {
      emit(CartSuccessState(cartItems: cartItemsAdded));
    } else {
      emit(CartNoItemState(
          url: 'https://cdn-icons-png.flaticon.com/512/34/34627.png'));
    }
  }

  FutureOr<void> cartRemoveFromCartEvent(CartRemoveFromCartEvent event,
      Emitter<CartState> emit) {
    cartItemsAdded.remove(event.cartItemRemove);
    emit(CartSuccessState(cartItems: cartItemsAdded));
  }
}
// Add other event handlers as needed


