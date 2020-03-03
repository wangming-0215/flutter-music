import 'package:flutter/material.dart';
import 'package:music/screens/home/discover/discover.dart';
import 'package:music/screens/home/account.dart';

class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with TickerProviderStateMixin {
  final List<Widget> _tabs = [
    Tab(child: Text('发现')),
    Tab(child: Text('视频')),
    Tab(child: Text('我的')),
  ];

  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        child: AppBar(elevation: 0),
        preferredSize: Size.zero,
      ),
      body: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.symmetric(horizontal: 100.0, vertical: 8.0),
            child: TabBar(
              tabs: _tabs,
              controller: _tabController,
              indicator: UnderlineTabIndicator(),
              labelStyle: TextStyle(fontSize: 16),
              unselectedLabelStyle: TextStyle(fontSize: 14),
            ),
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: <Widget>[
                Discover(),
                Container(
                  child: Center(
                    child: Text('视频'),
                  ),
                ),
                Account(),
              ],
            ),
          ),
        ],
      ),
      backgroundColor: Colors.white,
    );
  }
}

// class Home extends StatelessWidget {
//   const Home({Key key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: PreferredSize(
//         child: AppBar(elevation: 0),
//         preferredSize: Size.zero,
//       ),
//       body: Column(children: <Widget>[
//         Container(child: TabBar(tabs: <Widget>[],),)
//       ],),
//       backgroundColor: Colors.white,
//     );
//   }
// }
