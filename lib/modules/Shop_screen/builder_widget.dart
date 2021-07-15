import 'package:flutter/material.dart';
import 'package:shop_app_final/models/categories_model.dart';
import 'package:shop_app_final/models/home_model.dart';
import 'package:shop_app_final/modules/Shop_screen/build_category_item.dart';
import 'package:shop_app_final/modules/Shop_screen/build_grid_product.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:shimmer/shimmer.dart';
import 'package:shop_app_final/shared/componants/componants.dart';
import 'package:flutter_card_swipper/flutter_card_swiper.dart';

class BuilderWidget extends StatelessWidget {
  BuilderWidget({
    required this.homeModel,
    required this.categoriesModel,
    required this.favorites,
    required this.changeFavorites,
    required this.cart,
    required this.changeCart,
  });
  final HomeModel homeModel;
  final CategoriesModel categoriesModel;
  final Map favorites;
  final cart;
  final changeFavorites;
  final changeCart;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children:
        [
          // Slider
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: Container(
              height: 200,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5.0),
              ),
              child: new Swiper(
                itemCount: homeModel.data!.banners.length,
                viewportFraction: 1.0,
                pagination: new SwiperPagination(),
                itemBuilder: (BuildContext context,int index){
                  return new CachedNetworkImage(
                    imageUrl: homeModel.data!.banners[index].image,
                    errorWidget: (context, url, error) => Center(child: Icon(Icons.error)),
                    fit: BoxFit.fill,
                    placeholder: (context, url) => Shimmer.fromColors(
                      highlightColor: (Colors.grey[200])!,
                      baseColor: (Colors.grey[300])!,
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
          // Categories Title
          Row(
            children: [
              titleWidget(
                text: "Hot Categories",
                color: Colors.black,
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
          // Categories Slider
          Container(
            height: 150,
            child: ListView.separated(
                itemBuilder: (context, index) => BuildCategoryItem(
                  categoriesModel: categoriesModel,
                  index: index,
                ),
                separatorBuilder: (context, index) => SizedBox(width: 25),
                itemCount: categoriesModel.data!.categories.length,
              scrollDirection: Axis.horizontal,
              physics: BouncingScrollPhysics(),
              padding: EdgeInsets.symmetric(horizontal: 16),
            ),
          ),
          SizedBox(height: 10),
          // Products Title
          Row(
            children: [
              titleWidget(
                  text: "Our Products",
                color: Colors.black,
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
          // Products grid
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
                homeModel.data!.products.length,
                    (index) => BuildGridProduct(
                      model: homeModel.data!.products[index],
                      favorites: favorites,
                      changeFavorites: changeFavorites,
                      cart: cart,
                      changeCart: changeCart,
                    ),
                ),
            ),
          ),
        ],
      ),
    );
  }
}
