import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:shop_app_final/shared/componants/loading_components/shop_loading/product_grid_loading.dart';

class HomeLoading extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Shimmer.fromColors(
              highlightColor: Colors.grey[200],
              baseColor: Colors.grey[300],
              child: Container(
                height: 190,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.0),
                  color: Colors.grey[300],
                ),
              ),
            ),
          ),
          SizedBox(height: 20),
          GridView.count(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            crossAxisCount: 2,
            mainAxisSpacing: 3.0,
            crossAxisSpacing: 3.0,
            childAspectRatio: 1 / 1.5,
            children:
            [
              GridProductLoading(),
              GridProductLoading(),
              GridProductLoading(),
              GridProductLoading(),
            ],
          ),
        ],
      ),
    );
  }
}
