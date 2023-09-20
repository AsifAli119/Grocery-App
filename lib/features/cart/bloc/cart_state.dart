part of 'cart_bloc.dart';

@immutable
abstract class CartState {}

abstract class CartActionState extends CartState {}

class CartInitial extends CartState {}

class CartSuccessState extends CartState {
  final List<ProductDataModel> cartItems;

  CartSuccessState({required this.cartItems});
}
class CartNoItemState extends CartState {
  final String  url;
  CartNoItemState({required this.url});
}
class CartItemRemovedFromCartActionState extends CartActionState{}