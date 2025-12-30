part of core;

typedef CachedUser = CacheUserEntity;

class CacheUserEntity extends Equatable {
  final int id;
  final String name;
  final String? fName;
  final String? lName;
  final String? avatar;
  final PhoneEntity mobile;
  final PhoneEntity whatsApp;
  final String? gender;

  const CacheUserEntity({
    required this.id,
    required this.name,
    this.avatar,
    required this.mobile,
    required this.whatsApp,
    this.gender,
    this.fName,
    this.lName,
  });

  @override
  List<Object?> get props =>
      [id, name, avatar, mobile, whatsApp, gender, fName, lName, ];

  @override
  String toString() {
    return "[CachedUser] ----------------------------\n"
        "[ID] $id\n"
        "[Name] $name\n"
        "[Avatar] $avatar\n"
        "[Mobile] $mobile\n"
        "[whatsApp] $whatsApp\n"
        "[Gender] $gender\n"
        "[fName] $fName\n"
        "[lName] $lName\n"
        "-----------------------------------------";
  }
}
