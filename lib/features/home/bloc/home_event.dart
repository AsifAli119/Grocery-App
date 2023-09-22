part of 'home_bloc.dart';

@immutable
abstract class HomeEvent {}
class HomeInitialEvent extends HomeEvent{}
// for event happening on the cart and wishlist
class HomeProductWishlistButtonClickedEvent extends HomeEvent{
  final ProductDataModel clickedProduct;

  HomeProductWishlistButtonClickedEvent({required this.clickedProduct});
}
class HomeProductCartButtonClickedEvent extends HomeEvent{
  final ProductDataModel clickedProduct;
  HomeProductCartButtonClickedEvent({required this.clickedProduct});
}
//--for navigation
class HomeWishlistButtonNavigateEvent extends HomeEvent{}
class HomeCartButtonNavigateEvent extends HomeEvent{}