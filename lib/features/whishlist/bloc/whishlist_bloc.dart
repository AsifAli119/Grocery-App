import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:grocery_app/data/cart_items.dart';
import 'package:grocery_app/data/wishlist_items.dart';
import 'package:meta/meta.dart';

import '../../../models/data_model.dart';

part 'whishlist_event.dart';
part 'whishlist_state.dart';

class WishlistBloc extends Bloc<WishlistEvent, WishlistState> {
  WishlistBloc() : super(WishlistInitial()) {
  on<WishlistInitialEvent>(wishlistInitialEvent);
  on<WishlistRemoveFromWishlistEvent>(wishlistRemoveFromWishlistEvent);
  }
  FutureOr<void> wishlistInitialEvent(WishlistInitialEvent event, Emitter<WishlistState> emit) async{
    emit(WishlistLoadingState());
    Future.delayed(Duration(seconds: 2));
    emit(WishlistSuccessState(wishlistItems: wishlist_items));
  }

  FutureOr<void> wishlistRemoveFromWishlistEvent(WishlistRemoveFromWishlistEvent event, Emitter<WishlistState> emit) {
    wishlist_items.remove(event.wishlistItemRemove);
    emit(WishlistRemoveFromWishlistActionState());
    emit(WishlistSuccessState(wishlistItems: wishlist_items));
  }
}
