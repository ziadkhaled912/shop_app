import 'package:flutter/material.dart';
import 'package:shop_app_final/models/home_model.dart';
import 'package:shop_app_final/shared/componants/loading_components/shop_loading/product_image.dart';
import 'package:shop_app_final/shared/styles/colors.dart';
import 'package:cached_network_image/cached_network_image.dart';

class BuildGridProduct extends StatelessWidget {
  BuildGridProduct({
    required this.model,
    required this.favorites,
    required this.changeFavorites,
    required this.changeCart,
    required this.cart,
  });

  final ProductModel model;
  final Map favorites;
  final cart;
  final changeFavorites;
  final changeCart;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        children:
        [
          Stack(
            children: [
              CachedNetworkImage(
                imageUrl: model.image,
                placeholder: (context, url) => ProductGridLoading(),
                errorWidget: (context, url, error) => Center(child: Icon(Icons.error)),
                width: double.infinity,
                height: 200,
              ),
              if(model.discount != 0)
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(bottomRight: Radius.circular(10)),
                    color: primaryColor,
                  ),
                  child:
                  Text(
                    "${model.discount}%",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CircleAvatar(
                      radius: 17,
                      backgroundColor: favorites[model.id] ? primaryColor : Colors.white,
                      child: IconButton(
                        padding: EdgeInsets.all(0),
                        icon: Icon(
                          favorites[model.id] ? Icons.favorite : Icons.favorite_border,
                          color: favorites[model.id] ? Colors.white : Colors.grey[400],
                          size: 23.5,
                        ),
                        onPressed: () {
                          changeFavorites(model.id);
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 18,),
          Container(
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    model.name,
                    maxLines: 1,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 5),
                  Row(
                    // crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        "${model.price} L.E",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: primaryColor,
                        ),
                      ),
                      SizedBox(width: 5),
                      if(model.discount != 0)
                        Text(
                        "${model.oldPrice}",
                        style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey,
                          decoration: TextDecoration.lineThrough,
                        ),
                      ),
                      Spacer(),
                      IconButton(
                        padding: EdgeInsets.all(0),
                          icon: Icon(
                            cart[model.id] ? Icons.shopping_cart : Icons.add_shopping_cart,
                            size: 20,
                            color: cart[model.id] ? primaryColor : Colors.black,
                          ),
                          onPressed: (){
                            changeCart(model.id);
                          }
                          ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
