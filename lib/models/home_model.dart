/// Home Model
class HomeModel {
  bool status;
  HomeDataModel data;

  HomeModel.fromJson(Map<String, dynamic> json)
  {
    status = json["status"];
    data   = HomeDataModel.fromJson(json["data"]);
  }
}
/// Home Data Model
class HomeDataModel
{
  List<BannerModel> banners = [];
  List<ProductModel> products = [];

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
    int id;
    String image;
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
  int id;
  dynamic price;
  dynamic oldPrice;
  dynamic discount;
  String image;
  String name;
  bool inFavorites;
  bool inCart;

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