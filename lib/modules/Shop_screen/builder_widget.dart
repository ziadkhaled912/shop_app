import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:shop_app_final/models/home_model.dart';
import 'package:shop_app_final/modules/Shop_screen/build_grid_product.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:shimmer/shimmer.dart';


class BuilderWidget extends StatelessWidget {
  BuilderWidget({
    @required this.model,
  });
  final HomeModel model;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children:
        [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              height: 190,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5.0),
              ),
              child: new Swiper(
                itemCount: model.data.banners.length,
                viewportFraction: 1.0,
                pagination: new SwiperPagination(),
                itemBuilder: (BuildContext context,int index){
                  return new CachedNetworkImage(
                    imageUrl: model.data.banners[index].image,
                    errorWidget: (context, url, error) => Center(child: Icon(Icons.error)),
                    fit: BoxFit.fill,
                    placeholder: (context, url) => Shimmer.fromColors(
                      highlightColor: Colors.grey[200],
                      baseColor: Colors.grey[300],
                      child: Container(
                        width: double.infinity,
                        color: Colors.grey[300],
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                Text(
                  "Our Products",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 22,
                    fontWeight: FontWeight.bold
                  ),
                  textAlign: TextAlign.start,
                ),
                Spacer(),
                TextButton(
                    onPressed: () {},
                    child: Text(
                      "Sea All",
                    ),
                ),
              ],
            ),
          ),
          Container(
            color: Colors.grey[100],
            child: GridView.count(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              crossAxisCount: 2,
              mainAxisSpacing: 3.0,
              crossAxisSpacing: 3.0,
              childAspectRatio: 1 / 1.5,
              children: List.generate(
                model.data.products.length,
                    (index) => BuildGridProduct(model: model.data.products[index]),
                ),
            ),
          ),
        ],
      ),
    );
  }
}
