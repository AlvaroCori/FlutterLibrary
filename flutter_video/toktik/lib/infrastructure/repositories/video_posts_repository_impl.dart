import 'package:toktik/domain/datasource/video_post_datasource.dart';
import 'package:toktik/domain/entities/video_post.dart';
import 'package:toktik/domain/repositories/video_post_repository.dart';

class VideoPostsRepositoryImpl implements VideoPostRepository {
  final VideoPostDatasource videoPostDatasource;
  VideoPostsRepositoryImpl({
    required this.videoPostDatasource
  });

  @override
  Future<List<VideoPost>> getFavoriteVideosByUser(String userId) {
    return videoPostDatasource.getFavoriteVideosByUser(userId);
  }

  @override
  Future<List<VideoPost>> getTrendingVideoByPage(int page) {
    return videoPostDatasource.getTrendingVideoByPage(page);
  }

}