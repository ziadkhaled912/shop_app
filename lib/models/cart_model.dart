class CartModel {
  late bool status;
  Data? data;
  
  CartModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }
}

class Data {
  List<CartItems> cartItems = [];
  late int subTotal;
  late int total;


  Data.fromJson(Map<String, dynamic> json) {
    json['cart_items'].forEach((element) {
      cartItems.add(CartItems.fromJson(element));
    });
    subTotal = json['sub_total'];
    total = json['total'];
  }
}

class CartItems {
  late int id;
  late int quantity;
  late Product product;
  
  CartItems.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    quantity = json['quantity'];
    product = (json['product'] != null ? new Product.fromJson(json['product']) : null)!;
  }
}

class Product {
  late int id;
  late int price;
  late int oldPrice;
  late int discount;
  late String image;
  late String name;

  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    price = json['price'];
    oldPrice = json['old_price'];
    discount = json['discount'];
    image = json['image'];
    name = json['name'];
  }
}
