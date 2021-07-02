import 'package:flutter/material.dart';
import 'package:shop_app_final/models/home_model.dart';
import 'package:shop_app_final/shared/styles/colors.dart';
import 'package:extended_image/extended_image.dart';

class BuildGridProduct extends StatelessWidget {
  BuildGridProduct({
    @required this.model
  });

  final ProductModel model;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        children:
        [
          // ExtendedImage.network(
          //   model.image,
          //   width: double.infinity,
          //   height: 200,
          //   cache: true,
          //
          // ),
          Stack(
            children: [
              Image(
                image: NetworkImage(model.image),
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
                      backgroundColor: Colors.white,
                      child: IconButton(
                        padding: EdgeInsets.all(0),
                        icon: Icon(
                          Icons.favorite_border,
                          color: Colors.grey[400],
                          size: 23.5,
                        ),
                        onPressed: () {},
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
                            Icons.add_shopping_cart,
                            size: 20,
                          ),
                          onPressed: (){}
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
