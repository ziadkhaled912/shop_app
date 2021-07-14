/// Home Model
class HomeModel {
  late bool status;
  HomeDataModel? data;

  HomeModel.fromJson(Map<String, dynamic> json)
  {
    status = json["status"];
    data   = HomeDataModel.fromJson(json["data"]);
  }
}
/// Home Data Model
class HomeDataModel
{
  late List<BannerModel> banners = [];
  late List<ProductModel> products = [];

  HomeDataModel.fromJson(Map<String, dynamic> json)
  {
    json['banners'].forEach((element)
    {
      banners.add(BannerModel.fromJson(element));
    });

    json['products'].forEach((element)
    {
      products.add(ProductModel.fromJson(element));
    });
  }
}
/// Banners Model
class BannerModel
{
    late int id;
    late String image;
    // CategoryDataModel category;

    BannerModel.fromJson(Map<String, dynamic> json)
    {
      id       = json["id"];
      image    = json["image"];
      // category = json["category"];
    }
}
// Category model
// class CategoryDataModel
// {
//   int id;
//   String image;
//   String name;
//
//   CategoryDataModel.fromJson(Map<String, dynamic> json)
//   {
//     id = json["id"];
//     image = json["image"];
//     name  = json["name"];
//   }
// }
/// Products Model
class ProductModel
{
  late int id;
  late dynamic price;
  late dynamic oldPrice;
  late dynamic discount;
  late String image;
  late String name;
  late bool inFavorites;
  late bool inCart;

  ProductModel.fromJson(Map<String, dynamic> json)
  {
    id = json['id'];
    price = json['price'];
    oldPrice = json['old_price'];
    discount = json['discount'];
    image = json['image'];
    name = json['name'];
    inFavorites = json['in_favorites'];
    inCart = json['in_cart'];
  }
}