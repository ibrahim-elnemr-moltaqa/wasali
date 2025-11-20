part of core;

class CacheUserModel extends CacheUserEntity {
  const CacheUserModel({
    required super.id,
    required super.name,
    required super.avatar,
    required super.mobile,
    required super.email,
  });

  CacheUserModel.fromEntity(CacheUserEntity entity)
      : this(
          id: entity.id,
          name: entity.name,
          avatar: entity.avatar,
          mobile: entity.mobile,
          email: entity.email,
        );

  factory CacheUserModel.fromJson(String tokenJson) {
    final Map<String, dynamic> encodedMap = json.decode(tokenJson);
    return CacheUserModel(
      id: encodedMap[_idKey],
      name: encodedMap[_nameKey],
      avatar: encodedMap[_avatarKey],
      email: encodedMap[_emailKey],
      mobile: PhoneModel.fromMap(encodedMap[_kCacheMobileObjectKey]),
    );
  }

  Map<String, dynamic> get toMap => {
        _idKey: this.id,
        _nameKey: name,
        _avatarKey: avatar,
        _emailKey: email,
        _kCacheMobileObjectKey: mobile.toMap,
      };

  String get toJson => json.encode(toMap);
}

const String _idKey = "idKey";
const String _nameKey = "nameKey";
const String _emailKey = "emailKey";
const String _avatarKey = "avatarKey";
const String _kCacheMobileObjectKey = "kCacheMobileObjectKey";
