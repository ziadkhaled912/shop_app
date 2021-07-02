import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:shop_app_final/models/home_model.dart';
import 'package:shop_app_final/modules/Shop_screen/build_grid_product.dart';


class BuilderWidget extends StatelessWidget {
  BuilderWidget({
    @required this.model,
  });
  final HomeModel model;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
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
                  return new Image.network("${model.data.banners[index].image}",
                    fit: BoxFit.fill,
                  );
                },
              ),
            ),
          ),
          SizedBox(height: 20),
          Container(
            color: Colors.grey[200],
            child: GridView.count(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              crossAxisCount: 2,
              mainAxisSpacing: 5.0,
              crossAxisSpacing: 5.0,
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
