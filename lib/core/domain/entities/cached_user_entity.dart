part of core;

typedef CachedUser = CacheUserEntity;

class CacheUserEntity extends Equatable {
  final int id;
  final String name;
  final String? avatar;
  final PhoneEntity mobile;
  final String? email;

  const CacheUserEntity({
    required this.id,
    required this.name,
    required this.avatar,
    required this.mobile,
    required this.email,
  });

  @override
  List<Object?> get props => [
        id,
        name,
        avatar,
        mobile,
        email,
      ];

  @override
  String toString() {
    return "[CachedUser] ----------------------------\n"
        "[ID] $id\n"
        "[Name] $name\n"
        "[Avatar] $avatar\n"
        "[Mobile] $mobile\n"
        "[Email] $email\n"
        "-----------------------------------------";
  }
}
