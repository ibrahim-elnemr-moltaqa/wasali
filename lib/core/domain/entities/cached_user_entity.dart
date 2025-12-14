part of core;

typedef CachedUser = CacheUserEntity;

class CacheUserEntity extends Equatable {
  final int id;
  final String name;
  final String? avatar;
  final PhoneEntity mobile;
  final PhoneEntity whatsApp;
  final GenderEnum? gender;

  const CacheUserEntity({
    required this.id,
    required this.name,
    this.avatar,
    required this.mobile,
    required this.whatsApp,
    this.gender,
  });

  @override
  List<Object?> get props => [
        id,
        name,
        avatar,
        mobile,
        whatsApp,
        gender
      ];

  @override
  String toString() {
    return "[CachedUser] ----------------------------\n"
        "[ID] $id\n"
        "[Name] $name\n"
        "[Avatar] $avatar\n"
        "[Mobile] $mobile\n"
        "[whatsApp] $whatsApp\n"
        "[Gender] $gender\n"
        "-----------------------------------------";
  }
}
