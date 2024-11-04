import 'dart:async';

import 'package:toktik/domain/datasource/video_post_datasource.dart';
import 'package:toktik/domain/entities/video_post.dart';
import 'package:toktik/infrastructure/local_video_model.dart';
import 'package:toktik/shared/data/local_video_post.dart';

class LocalVideoDatasourceImpl implements VideoPostDatasource{
  @override
  Future<List<VideoPost>> getFavoriteVideosByUser(String userId) {
    return Future<List<VideoPost>>([] as FutureOr<List<VideoPost>> Function());
  }

  @override
  Future<List<VideoPost>> getTrendingVideoByPage(int page) async {
    await Future.delayed( const Duration(seconds: 2));
    final List<VideoPost> newVideos = videoPosts.map( (video) => LocalVideoModel.fromJson(video).toVideoPostEntity()).toList();
    return newVideos;
  }

}