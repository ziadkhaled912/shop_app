import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ProductGridLoading extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      highlightColor: (Colors.grey[200])!,
      baseColor: (Colors.grey[300])!,
      child: Container(
        height: 200,
        width: double.infinity,
        color: Colors.grey[300],
      ),
    );
  }
}
