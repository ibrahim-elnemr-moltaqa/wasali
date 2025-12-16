part of core;

class CacheUserModel extends CacheUserEntity {
  const CacheUserModel({
    required super.id,
    required super.name,
    required super.avatar,
    required super.mobile,
    required super.whatsApp,
    super.gender,
    super.fName,
    super.lName,
  });

  CacheUserModel.fromEntity(CacheUserEntity entity)
      : this(
          id: entity.id,
          name: entity.name,
          avatar: entity.avatar,
          mobile: entity.mobile,
          whatsApp: entity.whatsApp,
          gender: entity.gender,
          fName: entity.fName,
          lName: entity.lName,
        );

  factory CacheUserModel.fromJson(String tokenJson) {
    final Map<String, dynamic> encodedMap = json.decode(tokenJson);
    return CacheUserModel(
      id: encodedMap[_idKey],
      name: encodedMap[_nameKey],
      avatar: encodedMap[_avatarKey],
      mobile: PhoneModel.fromMap(encodedMap[_kCacheMobileObjectKey]),
      whatsApp: PhoneModel.fromMap(encodedMap[_kCacheWhatsAppObjectKey]),
      gender: encodedMap[_kCacheGenderKey],
      fName: encodedMap[_kCacheFNameKey],
      lName: encodedMap[_kCacheLNameKey],
    );
  }

  Map<String, dynamic> get toMap => {
        _idKey: this.id,
        _nameKey: name,
        _avatarKey: avatar,
        _kCacheMobileObjectKey: mobile.toMap,
        _kCacheWhatsAppObjectKey: whatsApp.toMap,
        _kCacheGenderKey: gender,
        _kCacheFNameKey: fName,
        _kCacheLNameKey: lName
      };

  String get toJson => json.encode(toMap);
}

const String _idKey = "idKey";
const String _nameKey = "nameKey";
const String _avatarKey = "avatarKey";
const String _kCacheMobileObjectKey = "kCacheMobileObjectKey";
const String _kCacheWhatsAppObjectKey = "kCacheWhatsAppObjectKey";

const String _kCacheGenderKey = "kCacheGenderKey";

const String _kCacheFNameKey = "kCacheFNameKey";
const String _kCacheLNameKey = "kCacheLNameKey";
