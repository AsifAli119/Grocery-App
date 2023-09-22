part of 'whishlist_bloc.dart';

@immutable
abstract class WishlistEvent {}
class WishlistInitialEvent extends WishlistEvent{}
class WishlistRemoveFromWishlistEvent extends WishlistEvent{
  final ProductDataModel wishlistItemRemove;
  WishlistRemoveFromWishlistEvent({required this.wishlistItemRemove});
}

