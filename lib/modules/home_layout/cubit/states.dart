abstract class HomeStates{}

class HomeInitialState extends HomeStates{}

class HomeChangeBottomNavState extends HomeStates{}

class ShopLoadingHomeDateState extends HomeStates{}

class ShopSuccessHomeDateState extends HomeStates{}

class ShopErrorHomeDateState extends HomeStates{}

class ShopSuccessCategoriesDateState extends HomeStates{}

class ShopErrorCategoriesDateState extends HomeStates{}

/// Favorites states
class SuccessChangeFavoritesDateState extends HomeStates{}

class ChangeFavoritesDateState extends HomeStates{}

class ErrorChangeFavoritesDateState extends HomeStates{}

class GetFavoritesLoading extends HomeStates{}

class GetFavoritesSuccess extends HomeStates{}

class GetFavoritesError extends HomeStates{}

/// Cart states
class SuccessChangeCartDateState extends HomeStates{}

class ChangeCartDateState extends HomeStates{}

class ErrorChangeCartDateState extends HomeStates{}

class GetCartLoading extends HomeStates{}

class GetCartSuccess extends HomeStates{}

class GetCartError extends HomeStates{}

class UpdateCartSuccess extends HomeStates{}

class UpdateCartError extends HomeStates{}

/// Get user data
class GetUserDataLoadingState extends HomeStates{}

class GetUserDataSuccessState extends HomeStates{}

class GetUserDataErrorState extends HomeStates{}