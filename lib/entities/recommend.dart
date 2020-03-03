class Creator {
  final String backgroundUrl;
  final String avatar;
  final int userType;
  final String nickname;
  final int gender;
  final int userId;
  final String description;
  final int birthday;
  final String detailDescription;
  final bool followed;
  final String signature;

  Creator({
    this.backgroundUrl,
    this.avatar,
    this.userType,
    this.nickname,
    this.gender,
    this.userId,
    this.description,
    this.birthday,
    this.detailDescription,
    this.followed,
    this.signature,
  });

  factory Creator.fromJson(Map<String, dynamic> json) {
    return Creator(
      backgroundUrl: json['backgrounUrl'],
      avatar: json['avatar'],
      userType: json['userType'],
      nickname: json['nickname'],
      gender: json['gender'],
      userId: json['userId'],
      description: json['description'],
      birthday: json['birthday'],
      detailDescription: json['detailDescription'],
      followed: json['followed'],
      signature: json['signature'],
    );
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = Map<String, dynamic>();
    data['backgroundUrl'] = backgroundUrl;
    data['avatar'] = avatar;
    data['userType'] = userType;
    data['nickname'] = nickname;
    data['gender'] = gender;
    data['userId'] = userId;
    data['description'] = description;
    data['birthday'] = birthday;
    data['detailDescription'] = detailDescription;
    data['followed'] = followed;
    data['signature'] = signature;
    return data;
  }
}

class Recommend {
  final int id;
  final int type;
  final String name;
  final String copywriter;
  final String picUrl;
  final int playcount;
  final int createTime;
  final Creator creator;
  final int trackCount;
  final int userId;
  final String alg;

  Recommend({
    this.id,
    this.type,
    this.name,
    this.copywriter,
    this.picUrl,
    this.playcount,
    this.createTime,
    this.creator,
    this.trackCount,
    this.userId,
    this.alg,
  });

  factory Recommend.fromJson(Map<String, dynamic> json) {
    return Recommend(
      id: json['id'],
      type: json['type'],
      name: json['name'],
      copywriter: json['copywriter'],
      picUrl: json['picUrl'],
      playcount: json['playcount'],
      createTime: json['createTime'],
      creator:
          json['creator'] != null ? Creator.fromJson(json['creator']) : null,
      trackCount: json['trackCount'],
      userId: json['userId'],
      alg: json['alg'],
    );
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['type'] = type;
    data['name'] = name;
    data['copywriter'] = copywriter;
    data['picUrl'] = picUrl;
    data['playcount'] = playcount;
    data['createTime'] = createTime;
    if (creator != null) {
      data['creator'] = creator.toJson();
    }
    data['trackCount'] = trackCount;
    data['userId'] = userId;
    data['alg'] = alg;
    return data;
  }
}
