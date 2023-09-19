part of 'home_bloc.dart';

@immutable
abstract class HomeState {}
// build class for Actionable purpose
abstract class HomeActionState extends HomeState{}
class HomeInitial extends HomeState {}

class HomeLoadingState extends HomeState{}
class HomeLoadedSuccessState  extends HomeState{}
class HomeErrorState  extends HomeState{}

// Action states

class HomeNavigateToWishlistPageActionState extends HomeActionState{}
class HomeNavigateToCartPageActionState extends HomeActionState{}

