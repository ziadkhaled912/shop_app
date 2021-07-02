import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class GridProductLoading extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: Colors.white,
      child: Column(
        children: [
          Shimmer.fromColors(
            highlightColor: Colors.grey[200],
            baseColor: Colors.grey[300],
            child: Container(
              height: 200,
              width: double.infinity,
              color: Colors.grey[300],
            ),
          ),
          SizedBox(height: 18),
          Container(
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children:
                [
                  Shimmer.fromColors(
                    highlightColor: Colors.grey[200],
                    baseColor: Colors.grey[300],
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.5,
                      height: 14,
                      color: Colors.grey[300],
                    ),
                  ),
                  SizedBox(height: 10),
                  Shimmer.fromColors(
                    highlightColor: Colors.grey[200],
                    baseColor: Colors.grey[300],
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.2,
                      height: 14,
                      color: Colors.grey[300],
                    ),
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
