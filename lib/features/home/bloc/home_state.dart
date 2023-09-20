part of 'home_bloc.dart';

@immutable
abstract class HomeState {}
// build class for Actionable purpose
abstract class HomeActionState extends HomeState{}
class HomeInitial extends HomeState {}

class HomeLoadingState extends HomeState{}
class HomeLoadedSuccessState  extends HomeState{
  final List<ProductDataModel> products;
  HomeLoadedSuccessState({required this.products});
}
class HomeErrorState  extends HomeState{}

// Action states

class HomeNavigateToWishlistPageActionState extends HomeActionState{}
class HomeNavigateToCartPageActionState extends HomeActionState{}

//snackbar state
class HomeProductItemAddedToWishlistActionState extends HomeActionState{}
class HomeProductItemAddedToCartActionState extends HomeActionState{}

