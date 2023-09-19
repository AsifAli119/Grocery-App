part of 'home_bloc.dart';

@immutable
abstract class HomeEvent {}
class HomeInitialEvent extends HomeEvent{}
// for event happening on the cart and wishlist
class HomeProductWishlistButtonClickedEvent extends HomeEvent{}
class HomeProductCartButtonClickedEvent extends HomeEvent{}
//--for navigation
class HomeWishlistButtonNavigateEvent extends HomeEvent{}
class HomeCartButtonNavigateEvent extends HomeEvent{}