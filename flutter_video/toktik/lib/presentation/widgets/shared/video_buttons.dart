import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:toktik/config/helpers/human_formats.dart';
import 'package:toktik/domain/entities/video_post.dart';

class VideoButton extends StatelessWidget{
  final VideoPost video;
  const VideoButton({
    super.key, required this.video
  });
  
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _CustomIconButton(value: video.likes, iconColor: Colors.red, iconData: Icons.favorite,),
        _CustomIconButton(value: video.views, iconData: Icons.remove_red_eye_outlined,),
        SpinPerfect(
          infinite: true,
          duration: const Duration(seconds: 5),
          child: const _CustomIconButton(value: 0, iconData: Icons.play_circle_outline,)
        ),
      ],
    );
  }}

  
  class _CustomIconButton extends StatelessWidget{
    final int value;
    final IconData iconData;
    final Color? color;

    const _CustomIconButton({
      required this.value, 
      required this.iconData, 
      iconColor
    }) : color = iconColor ?? Colors.white;
    
    @override
    Widget build(BuildContext context) {
      return Column(
        children: [
          IconButton(onPressed: (){
          }, 
          icon: Icon(iconData, color: color, size: 30,),
          color: Colors.red,),
          if (value > 0)
          Text(HumanFormats.HumanFormatsNumber(value.toDouble())),
        ],
      );
  }}

  
  