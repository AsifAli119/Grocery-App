part of 'cart_bloc.dart';

@immutable
abstract class CartEvent {}
class CartInitialEvent extends CartEvent{}
class CartRemoveItemFromCartEvent extends CartEvent{
  final ProductDataModel cartItemRemove;

  CartRemoveItemFromCartEvent({required this.cartItemRemove});
}
class CartNoItemInCartEvent extends CartEvent{}
class CartItemsAddedEvent extends CartEvent{}

