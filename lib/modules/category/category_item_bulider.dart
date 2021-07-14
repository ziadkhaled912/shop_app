import 'package:flutter/material.dart';
import 'package:shop_app_final/models/categories_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:shimmer/shimmer.dart';

class CategoryItemBuilder extends StatelessWidget {

  CategoryItemBuilder({
    required this.categoriesModel,
    required this.index,
  });

  final CategoriesModel categoriesModel;
  final int index;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Container(
        width: double.infinity,
        height: 170,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Card(
            shadowColor: Colors.transparent,
            child: CachedNetworkImage(
              imageUrl: categoriesModel.data!.categories[index].image,
              errorWidget: (context, url, error) => Icon(Icons.error),
              placeholder: (context, url) => Shimmer.fromColors(
                highlightColor: (Colors.grey[200])!,
                baseColor: (Colors.grey[300])!,
                child: Container(
                    width: double.infinity,
                    height: 170,
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
              ),
              imageBuilder: (context , imageProvider) => Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  image: DecorationImage(
                    image: imageProvider,
                    fit: BoxFit.cover,
                    colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.27), BlendMode.darken),
                  ),
                ),
                child: Center(
                  child: Text(
                    categoriesModel.data!.categories[index].name.toUpperCase(),
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
