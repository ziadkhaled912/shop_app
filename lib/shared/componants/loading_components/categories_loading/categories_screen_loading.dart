import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';


class CategoriesScreenLoading extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      separatorBuilder: (context, index) => SizedBox(height: 5),
      itemCount: 4,
      itemBuilder: (context, index) => Shimmer.fromColors(
        highlightColor: (Colors.grey[200])!,
        baseColor: (Colors.grey[300])!,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Container(
            width: double.infinity,
            height: 170,
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(10)
            ),
          ),
        ),
      ),
    );
  }
}
