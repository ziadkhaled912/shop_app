import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:shimmer/shimmer.dart';
import 'package:shop_app_final/models/cart_model.dart';
import 'package:shop_app_final/models/update_cart_model.dart';

class CartItemBuilder extends StatelessWidget {
  CartItemBuilder({
    required this.model,
    required this.updateCartModel,
    required this.updateCart,
    required this.deleteCart,
  });

  final CartItems model;
  final UpdateCartModel? updateCartModel;
  final updateCart;
  final deleteCart;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 130,
      padding: EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          IconButton(
            onPressed: () {
              deleteCart(itemId: model.id);
            },
            icon: Icon(Icons.delete_outline),
          ),
          SizedBox(width: 3),
          CachedNetworkImage(
            imageUrl: model.product.image,
            errorWidget: (context, url, error) =>
                Center(child: Icon(Icons.error)),
            width: MediaQuery.of(context).size.width * 0.29,
            placeholder: (context, url) => Shimmer.fromColors(
              child: Container(
                width: MediaQuery.of(context).size.width * 0.29,
                color: Colors.grey[300],
              ),
              highlightColor: (Colors.grey[200])!,
              baseColor: (Colors.grey[300])!,
            ),
          ),
          SizedBox(width: 15),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                width: MediaQuery.of(context).size.width * 0.5,
                child: Text(
                  model.product.name,
                  maxLines: 2,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 7),
              Text(
                '${model.product.price} L.E',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey[500],
                ),
              ),
              SizedBox(height: 13),
              // defaultQuantityBtn(text: "${model.quantity}" , context: context),
              InkWell(
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () {
                  showModalBottomSheet(
                    context: context,
                    builder: (context) => Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          child: ListView.builder(
                            itemBuilder: (context, index) => InkWell(
                              onTap: (){
                                updateCart(itemId: model.id,quantity: index + 1);
                                Navigator.pop(context);
                              },
                              child: Padding(
                                padding: const EdgeInsets.symmetric(vertical: 15.0),
                                child: Text(
                                  '${index + 1}',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                            ),
                            itemCount: 10,
                          ),
                        ),
                        Center(
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border.symmetric(
                                horizontal: BorderSide(
                                  width: 1,
                                  color: (Colors.grey[300])!,
                                )
                              )
                            ),
                            height: 60,
                            width: double.infinity,
                            padding: EdgeInsets.symmetric(vertical: 20),
                            child: Text(
                              'Select the quantity',
                              style: TextStyle(
                                fontSize: 17,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        )
                      ],
                    ),
                  );
                },
                child: Container(
                  width: 60,
                  height: 40,
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 1,
                      color: (Colors.grey[300])!,
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '${model.quantity}',
                      ),
                      SizedBox(width: 10),
                      Icon(
                        Icons.keyboard_arrow_down_rounded,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
