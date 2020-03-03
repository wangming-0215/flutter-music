import 'dart:io';
import 'dart:math';

import 'package:cookie_jar/cookie_jar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:dio/dio.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:music/entities/user.dart';
import 'package:music/entities/banner.dart';
import 'package:music/entities/recommend.dart';

class HttpClient {
  static Dio _dio;

  static final String baseUrl = 'https://xiaomingboy.cn/api/music';

  static void init() async {
    Directory tmp = await getTemporaryDirectory();
    String tmpPath = tmp.path;
    CookieJar cookieJar = PersistCookieJar(dir: tmpPath);
    _dio = Dio(BaseOptions(baseUrl: baseUrl, followRedirects: false))
      ..interceptors.add(CookieManager(cookieJar));
  }

  static Future<Response> _get(String url, {Map<String, dynamic> params}) {
    return _dio.get(url, queryParameters: params);
  }

  static Future<UserEntity> login(String email, String password) async {
    Map<String, dynamic> params = new Map<String, dynamic>();
    params['email'] = email;
    params['password'] = password;
    Response response = await _get('/login', params: params);
    return UserEntity.fromJson(response.data);
  }

  static Future<Response> refreshLogin() async {
    return _get('/login/refresh');
  }

  // 首页轮播图
  static Future<List<Banner>> fetchBanner() async {
    Map<String, dynamic> params = Map<String, dynamic>();
    params['type'] = 1;
    Response response = await _get('/banner', params: params);
    // print(response.data['banners']);
    List<Banner> list = List<Banner>();
    response.data['banners'].forEach((v) {
      list.add(Banner.fromJson(v));
    });
    return list;
  }

  static Future<List<Recommend>> fetRecommend() async {
    Response response = await _get('/recommend/resource');
    List<Recommend> list = List<Recommend>();
    response.data['recommend'].forEach((v) {
      list.add(Recommend.fromJson(v));
    });
    return list;
  }
}
