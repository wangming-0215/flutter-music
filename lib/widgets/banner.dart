import 'dart:async';
import 'package:flutter/material.dart';

class CustomBanner extends StatefulWidget {
  final IndexedWidgetBuilder itemBuilder;
  final double aspectRadio;
  final int itemCount;
  final bool autoPlay;
  final Duration autoPlayInterval;

  CustomBanner({
    @required this.itemBuilder,
    @required this.aspectRadio,
    @required this.itemCount,
    this.autoPlay = false,
    this.autoPlayInterval,
  });

  @override
  _CustomBannerState createState() => _CustomBannerState();
}

class _CustomBannerState extends State<CustomBanner> {
  PageController _pageController;
  int _currentIndex;
  Timer _timer;

  @override
  void initState() {
    super.initState();
    _currentIndex = widget.itemCount * 5;
    _pageController = PageController(initialPage: _currentIndex);
    if (widget.autoPlay) {
      _initTimer();
    }
  }

  void _onPageChanged(index) {
    setState(() {
      _currentIndex = index;
      if (index == 0) {
        _currentIndex = widget.itemCount * 5;
        _pageController.jumpToPage(_currentIndex);
      }
    });
  }

  void _initTimer() {
    if (_timer == null) {
      _timer = Timer.periodic(
        widget.autoPlayInterval ?? const Duration(seconds: 3),
        (_) {
          _currentIndex++;
          _pageController.animateToPage(
            _currentIndex,
            duration: const Duration(milliseconds: 300),
            curve: Curves.linear,
          );
        },
      );
    }
  }

  void _cancelTimer() {
    if (_timer != null) {
      _timer.cancel();
      _timer = null;
    }
  }

  Widget _buildPageView() {
    Widget child;

    if (widget.autoPlay) {
      child = NotificationListener(
        child: AspectRatio(
          aspectRatio: widget.aspectRadio,
          child: PageView.builder(
            itemBuilder: widget.itemBuilder,
            controller: _pageController,
            onPageChanged: _onPageChanged,
          ),
        ),
        onNotification: (ScrollNotification notification) {
          if (notification is ScrollStartNotification) {
            if (notification.dragDetails != null) {
              // 人为干预，停止自动轮播
              _cancelTimer();
            }
          } else if (notification is ScrollEndNotification) {
            _initTimer();
          }
          return false;
        },
      );
    } else {
      child = AspectRatio(
        aspectRatio: widget.aspectRadio,
        child: PageView.builder(
          itemBuilder: widget.itemBuilder,
          controller: _pageController,
          onPageChanged: _onPageChanged,
        ),
      );
    }

    return child;
  }

  Widget _buildIndicator() {
    List<Widget> list = [];
    for (int i = 0; i < widget.itemCount; i++) {
      bool active = i == _currentIndex % widget.itemCount;
      list.add(Container(
        key: Key('pagination_$i'),
        margin: EdgeInsets.symmetric(horizontal: 4),
        child: ClipOval(
          child: Container(
            color: active ? Colors.red : Colors.white,
            width: 8.0,
            height: 8.0,
          ),
        ),
      ));
    }
    return Positioned(
      bottom: 10.0,
      child: Row(
        children: list,
        mainAxisSize: MainAxisSize.min,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: <Widget>[
        _buildPageView(),
        _buildIndicator(),
      ],
    );
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
    _cancelTimer();
  }
}
