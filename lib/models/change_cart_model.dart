class ChangeCartModel {
  late bool status;
  late String massage;

  ChangeCartModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    massage = json['message'];
  }
}