import 'package:flutter/material.dart';
import 'package:shop_app_final/models/favorites_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:shimmer/shimmer.dart';

class FavouriteItemBuilder extends StatelessWidget {

  FavouriteItemBuilder({
    required this.favoritesData,
    required this.deleteFavorite,
  });
  final FavoritesData favoritesData;
  final deleteFavorite;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 130,
      padding: EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children:
        [
          IconButton(
            onPressed: () {
              deleteFavorite(favoritesData.product.id);
            },
            icon: Icon(Icons.delete_outline),
          ),
          SizedBox(width: 3),
          CachedNetworkImage(
            imageUrl: favoritesData.product.image,
            errorWidget: (context, url, error) => Center(child: Icon(Icons.error)),
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
            children:
            [
              Container(
                width: MediaQuery.of(context).size.width * 0.5,
                child: Text(favoritesData.product.name,
                  maxLines: 2,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 5),
              Text(
                '${favoritesData.product.price} L.E',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey[500],
                ),
              ),
              SizedBox(height: 13),
              ElevatedButton(
                onPressed: (){},
                child: Text(
                  'add to cart'.toUpperCase(),
                  style: TextStyle(
                      color: Colors.white
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
