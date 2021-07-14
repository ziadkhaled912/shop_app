import 'package:flutter/material.dart';
import 'package:shop_app_final/modules/trueview/build_grid_video.dart';
import 'package:shop_app_final/shared/styles/colors.dart';

class TrueViewScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    List videoUrls = [
      'https://images.unsplash.com/photo-1612817288484-6f916006741a?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8YmVhdXR5JTIwcHJvZHVjdHN8ZW58MHx8MHx8&ixlib=rb-1.2.1&w=1000&q=80',
      'https://www-file.huawei.com/-/media/corp2020/home/cbg/0602/freebuds_4_cn_m.jpg',
      'https://images.unsplash.com/photo-1526947425960-945c6e72858f?ixid=MnwxMjA3fDB8MHxzZWFyY2h8NHx8YmVhdXR5JTIwcHJvZHVjdHxlbnwwfHwwfHw%3D&ixlib=rb-1.2.1&w=1000&q=80',
      'https://static.toiimg.com/thumb/msid-66272083,imgsize-78413,width-800,height-600,resizemode-75/66272083.jpg',
      'https://photographycourse.net/wp-content/uploads/2019/12/15-Highly-Creative-Product-Photography-Ideas-reflections.jpeg',
      'https://www.creativehunt.com/images/uploaded/2016/10/DSC2269-260314.JPG'
    ];
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "True View",
          style: TextStyle(
            color: Colors.black,
              fontSize: 22,
              fontWeight: FontWeight.bold
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.favorite, color: primaryColor,),
            onPressed: (){},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          color: Colors.grey[100],
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: GridView.count(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              crossAxisCount: 2,
              mainAxisSpacing: 5.0,
              crossAxisSpacing: 5.0,
              childAspectRatio: 1 / 1.16,
              children: List.generate(
                videoUrls.length,
                    (index) => BuildGridVideo(
                      videoUrl: videoUrls[index],
                      videoUrls: videoUrls,
                    ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
