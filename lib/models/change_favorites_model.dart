class ChangeFavoritesModel {
  late bool status;
  late String massage;

  ChangeFavoritesModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    massage = json['message'];
  }
}