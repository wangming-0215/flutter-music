class UserEntity {
  int loginType;
  int code;
  AccountEntity account;
  ProfileEntity profile;

  UserEntity({
    this.loginType,
    this.code,
    this.account,
    this.profile,
  });

  factory UserEntity.fromJson(Map<String, dynamic> json) {
    return UserEntity(
      loginType: json['loginType'],
      code: json['code'],
      account: json['account'] != null
          ? AccountEntity.fromJson(json['account'])
          : null,
      profile: json['profile'] != null
          ? ProfileEntity.formJson(json['profile'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['loginType'] = loginType;
    data['code'] = code;
    if (account != null) {
      data['account'] = account.toJson();
    }
    if (profile != null) {
      data['profile'] = profile.toJson();
    }
    return data;
  }
}

class AccountEntity {
  final int id;
  final String userName;
  final int type;
  final int status;
  final int whitelistAuthority;
  final int createTime;
  final String salt;
  final int tokeVersion;
  final int ban;
  final int baoyueVersion;
  final int donateVersion;
  final int vipType;
  final int vipTypeVersion;
  final bool anonimousUser;

  AccountEntity({
    this.id,
    this.userName,
    this.type,
    this.status,
    this.whitelistAuthority,
    this.createTime,
    this.salt,
    this.tokeVersion,
    this.ban,
    this.baoyueVersion,
    this.donateVersion,
    this.vipType,
    this.vipTypeVersion,
    this.anonimousUser,
  });

  factory AccountEntity.fromJson(Map<String, dynamic> json) {
    return AccountEntity(
      id: json['id'],
      userName: json['userName'],
      type: json['type'],
      status: json['status'],
      whitelistAuthority: json['whitelistAuthority'],
      createTime: json['createTime'],
      salt: json['salt'],
      tokeVersion: json['tokenVersion'],
      ban: json['ban'],
      baoyueVersion: json['baoyueVersion'],
      donateVersion: json['donateVersion'],
      vipType: json['vipType'],
      vipTypeVersion: json['vipTypeVersion'],
      anonimousUser: json['anonimousUser'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'userName': userName,
      'type': type,
      'status': status,
      'whitelistAuthority': whitelistAuthority,
      'createTime': createTime,
      'salt': salt,
      'tokeVersion': tokeVersion,
      'ban': ban,
      'baoyueVersion': baoyueVersion,
      'donateVersion': donateVersion,
      'vipType': vipType,
      'vipTypeVersion': vipTypeVersion,
      'anonimousUser': anonimousUser,
    };
  }
}

class ProfileEntity {
  final int vipType;
  final int gender;
  final int accountStatus;
  final int avatarImgId;
  final int birthday;
  final String nickname;
  final int userType;
  final int backgrounImgId;
  final String avatarUrl;
  final int userId;
  final String detailDescription;
  final bool followed;
  final String backgroundUrl;
  final String description;
  final String avatarImgIdStr;
  final String backgroundImgIdStr;
  final String signature;
  final int followeds;
  final int follows;
  final int eventCount;
  final int playlistCount;
  final int playlistBeSubscribedCount;

  ProfileEntity({
    this.vipType,
    this.gender,
    this.accountStatus,
    this.avatarImgId,
    this.birthday,
    this.nickname,
    this.userType,
    this.backgrounImgId,
    this.avatarUrl,
    this.userId,
    this.detailDescription,
    this.followed,
    this.backgroundUrl,
    this.description,
    this.avatarImgIdStr,
    this.backgroundImgIdStr,
    this.signature,
    this.followeds,
    this.follows,
    this.eventCount,
    this.playlistCount,
    this.playlistBeSubscribedCount,
  });

  factory ProfileEntity.formJson(Map<String, dynamic> json) {
    return ProfileEntity(
      vipType: json['vipType'],
      gender: json['gender'],
      accountStatus: json['accountStatus'],
      avatarImgId: json['avatarImgId'],
      birthday: json['birthday'],
      nickname: json['nickname'],
      userType: json['userType'],
      backgrounImgId: json['backgroundImgId'],
      avatarUrl: json['avatarUrl'],
      userId: json['userId'],
      detailDescription: json['detailDescription'],
      followed: json['followed'],
      backgroundUrl: json['backgroundUrl'],
      description: json['description'],
      avatarImgIdStr: json['avatarImgIdStr'],
      backgroundImgIdStr: json['backgroundImgIdStr'],
      signature: json['signature'],
      followeds: json['followeds'],
      follows: json['follows'],
      eventCount: json['eventCount'],
      playlistCount: json['playlistCount'],
      playlistBeSubscribedCount: json['playlistBeSubscribedCount'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'vipType': vipType,
      'gender': gender,
      'accountStatus': accountStatus,
      'avatarImgId': avatarImgId,
      'birthday': birthday,
      'nickname': nickname,
      'userType': userType,
      'backgrounImgId': backgrounImgId,
      'avatarUrl': avatarUrl,
      'userId': userId,
      'detailDescription': detailDescription,
      'followed': followed,
      'backgroundUrl': backgroundUrl,
      'description': description,
      'avatarImgIdStr': avatarImgIdStr,
      'backgroundImgIdStr': backgroundImgIdStr,
      'signature': signature,
      'followeds': followeds,
      'follows': follows,
      'eventCount': eventCount,
      'playlistCount': playlistCount,
      'playlistBeSubscribedCount': playlistBeSubscribedCount,
    };
  }
}
