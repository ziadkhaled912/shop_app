import 'package:flutter/material.dart';
import 'package:shop_app_final/models/categories_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:shimmer/shimmer.dart';

class BuildCategoryItem extends StatelessWidget {
  BuildCategoryItem({
    required this.categoriesModel,
    required this.index,
  });
  final CategoriesModel categoriesModel;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      height: 150,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(5),
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            CachedNetworkImage(
              imageUrl: categoriesModel.data!.categories[index].image,
              errorWidget: (context, url, error) =>
                  Center(child: Icon(Icons.error)),
              height: 150.0,
              width: 150.0,
              fit: BoxFit.cover,
              placeholder: (context, url) => Shimmer.fromColors(
                highlightColor: (Colors.grey[200])!,
                baseColor: (Colors.grey[300])!,
                child: Container(
                  width: 150.0,
                  height: 150.0,
                  color: Colors.grey[300],
                ),
              ),
            ),
            Container(
              color: Colors.black.withOpacity(.6),
              width: double.infinity,
              padding: EdgeInsets.symmetric(vertical: 5),
              child: Text(
                categoriesModel.data!.categories[index].name,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
                maxLines: 1,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
