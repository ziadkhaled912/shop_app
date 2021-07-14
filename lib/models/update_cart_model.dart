class UpdateCartModel {
  late bool status;
  late String message;
  Data? data;

  UpdateCartModel.fromJson(Map<String, dynamic> json) {
    status  = json['status'];
    message = json['message'];
    data    = Data.fromJson(json['data']);
  }
}
class Data {
  late Cart cart;
  late dynamic subTotal;
  late dynamic total;

  Data.fromJson(Map<String, dynamic> json) {
    cart     = Cart.fromJson(json['cart']);
    subTotal = json['sub_total'];
    total    = json['total'];
  }
}
class Cart {
  late int id;
  late int quantity;

  Cart.fromJson(Map<String, dynamic> json) {
    id       = json['id'];
    quantity = json['quantity'];
  }
}