part of core;

class AppLanguageState extends Equatable {
  final AppLanguageType langCode;

  const AppLanguageState(this.langCode);

  const AppLanguageState.initial() : this(AppLanguageType.ar);

  AppLanguageState copyWith({
    AppLanguageType? langCode,
  }) {
    return AppLanguageState(
      langCode ?? this.langCode,
    );
  }

  @override
  List<Object> get props => [langCode];
}
