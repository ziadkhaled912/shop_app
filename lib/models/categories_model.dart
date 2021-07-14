class CategoriesModel
{
  late bool status;
  CategoriesDataModel? data;

  CategoriesModel.fromJson( Map<String, dynamic> json) {
    status = json["status"];
    data   = CategoriesDataModel.fromJson(json["data"]);
  }
}
// Categories data model
class CategoriesDataModel
{
  int? currentPage;
  List<CategoriesListModel> categories = [];

  CategoriesDataModel.fromJson( Map<String, dynamic> json) {
    json['data'].forEach((element)
    {
      categories.add(CategoriesListModel.fromJson(element));
    });
    currentPage = json["current_page"];
  }
}

class CategoriesListModel
{
  late int id;
  late String name;
  late String image;

  CategoriesListModel.fromJson( Map<String, dynamic> json) {
    id    = json["id"];
    name  = json["name"];
    image = json["image"];
  }
}