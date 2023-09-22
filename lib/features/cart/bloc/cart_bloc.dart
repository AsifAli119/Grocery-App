import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:grocery_app/data/cart_items.dart';
import 'package:grocery_app/models/data_model.dart';
import 'package:meta/meta.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartInitial()) {
on<CartInitialEvent>(cartInitialEvent);
on<CartRemoveItemFromCartEvent>(cartRemoveItemFromCartEvent);
  }

  FutureOr<void> cartInitialEvent(CartInitialEvent event, Emitter<CartState> emit) async{
    emit(CartLoadingState());
   await Future.delayed(Duration(seconds: 2));
    if(cartItemsAdded.isNotEmpty){
      emit(CartLoadedSuccessState(cartitems: cartItemsAdded));
    }else{
      emit(CartEmptyState(url: 'https://cdn-icons-png.flaticon.com/512/34/34627.png'));
    }
  }

  FutureOr<void> cartRemoveItemFromCartEvent(CartRemoveItemFromCartEvent event, Emitter<CartState> emit) {
    cartItemsAdded.remove(event.cartItemRemove);
    emit(CartRemoveItemFromTheCartActionState());
    emit(CartLoadedSuccessState(cartitems: cartItemsAdded));
  }
}
