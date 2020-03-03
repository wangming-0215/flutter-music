import 'package:flutter/material.dart';
import 'package:music/utils/http_client.dart';
import 'package:music/widgets/banner.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:music/widgets/home_cate_item.dart';
import 'package:date_format/date_format.dart';

import './banner.dart';

class Discover extends StatefulWidget {
  Discover({Key key}) : super(key: key);

  @override
  _DiscoverState createState() => _DiscoverState();
}

class _DiscoverState extends State<Discover>
    with AutomaticKeepAliveClientMixin {
  Future _bannerFutuer;

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    _bannerFutuer = HttpClient.fetchBanner();
  }

  Widget _buildBanner() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8.0),
      child: HomeBanner(future: _bannerFutuer),
    );
  }

  Widget _buildHomeCategory() {
    final double size = 60;

    return Container(
      margin: EdgeInsets.symmetric(vertical: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Expanded(
            child: HomeCategoryItem(
              size: size,
              image: 'images/icon_daily.png',
              title: Text('每日推荐'),
              extraChild: Container(
                padding: EdgeInsets.only(top: 6),
                child: Text(
                  formatDate(DateTime.now(), ['dd']),
                  style: TextStyle(
                    color: Colors.red,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: HomeCategoryItem(
              size: size,
              image: 'images/icon_playlist.png',
              title: Text('歌单'),
            ),
          ),
          Expanded(
            child: HomeCategoryItem(
              size: size,
              image: 'images/icon_rank.png',
              title: Text('排行榜'),
            ),
          ),
          Expanded(
            child: HomeCategoryItem(
              size: size,
              image: 'images/icon_radio.png',
              title: Text('电台'),
            ),
          ),
          Expanded(
            child: HomeCategoryItem(
              image: 'images/icon_live.png',
              size: size,
              title: Text('直播'),
            ),
          )
        ],
      ),
    );
  }

  Future<void> _pullToRefresh() {
    return Future.delayed(const Duration(seconds: 2), () {
      _bannerFutuer = HttpClient.fetchBanner();
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return RefreshIndicator(
      onRefresh: _pullToRefresh,
      child: SingleChildScrollView(
        physics: AlwaysScrollableScrollPhysics(),
        child: Column(
          children: <Widget>[_buildBanner(), _buildHomeCategory()],
        ),
      ),
    );
  }
}
