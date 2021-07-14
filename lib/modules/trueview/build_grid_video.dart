import 'package:flutter/material.dart';
import 'package:shop_app_final/modules/trueview/full_screen_player.dart';
import 'package:shop_app_final/shared/componants/componants.dart';

class BuildGridVideo extends StatelessWidget {

  BuildGridVideo({
    required this.videoUrl,
    required this.videoUrls,
  });
  final String videoUrl;
  final List videoUrls;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => navigateTo(context, FullScreenPlayer(
        // videoUrl: videoUrl,
        // videoUrls: videoUrls,
        )
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(7),
        child: Container(
          color: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children:
            [
              Stack(
                children: [
                  Image(
                    image: NetworkImage(videoUrl),
                    height: 160,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(7.0),
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.15,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.black.withOpacity(0.6),
                      ),
                      child: Row(
                        children:
                        [
                          Icon(
                            Icons.play_arrow,
                            color: Colors.white,
                            size: 14,
                          ),
                          SizedBox(width: 2),
                          Text(
                            '00:15',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Text(
                  'Ceramic Rolling Pin',
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: Colors.black,

                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
