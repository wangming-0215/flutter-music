class Banner {
  final String pic;
  final int targetId;
  final String typeTitle;
  final String url;

  Banner({this.pic, this.targetId, this.typeTitle, this.url});

  factory Banner.fromJson(Map<String, dynamic> json) {
    return Banner(
      pic: json['pic'],
      targetId: json['targetId'],
      typeTitle: json['typeTitle'],
      url: json['url'],
    );
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = Map<String, dynamic>();
    data['pic'] = pic;
    data['targetId'] = targetId;
    data['typeTitle'] = typeTitle;
    data['url'] = url;
    return data;
  }
}
