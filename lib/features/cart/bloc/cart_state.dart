part of 'cart_bloc.dart';

@immutable
abstract class CartState {}
abstract class CartActionState extends CartState{}
class CartInitial extends CartState {}
class CartEmptyState extends CartState{
  final String url;

  CartEmptyState({required this.url});

}
class CartLoadingState extends CartState{}
class CartLoadedSuccessState extends CartState{
  final List<ProductDataModel> cartitems;

  CartLoadedSuccessState({required this.cartitems});
}
class CartRemoveItemFromTheCartActionState extends CartActionState{}

