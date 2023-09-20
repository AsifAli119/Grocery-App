part of 'cart_bloc.dart';

@immutable
abstract class CartEvent {}
class CartInitialEvent extends CartEvent{

}
class CartRemoveFromCartEvent extends CartEvent{
  final ProductDataModel cartItemRemove;

  CartRemoveFromCartEvent({required this.cartItemRemove});
}
class CartNoItemInCartEvent extends CartEvent{}
class CartItemsAddedEvent extends CartEvent{}
