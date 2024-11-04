import 'package:flutter/material.dart';
import 'package:toktik/domain/entities/video_post.dart';
import 'package:toktik/presentation/widgets/shared/video_buttons.dart';
import 'package:toktik/presentation/widgets/video/fullscreen_player.dart';

class VideoScrollableView  extends StatelessWidget{

  const VideoScrollableView({super.key, required this.videos});
  final List<VideoPost> videos;
  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      scrollDirection: Axis.vertical,
      physics: const BouncingScrollPhysics(),
      itemCount: videos.length,
      itemBuilder: (context, index) {
        final VideoPost videoPost = videos[index];
        return Stack(
          children: [

            SizedBox.expand(
              child: FullscreenPlayer(
                videoUrl: videoPost.videoUrl, 
                caption:videoPost.caption
              )),
            Positioned(
              bottom: 40,
              right: 20,
              child: VideoButton(video: videoPost))
          ],
          
        );
      },
    );
  }
  
}