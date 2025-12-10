part of core;

/// The [AppAuthenticationBloc] is responsible for managing the authentication
/// state of the application. It extends the [Bloc] class from the Flutter Bloc
/// library, allowing it to handle authentication-related events and emit
/// corresponding states.
///
/// This class handles various events such as app startup, user authentication,
/// logout, guest access, and more. By responding to these events, it updates
/// the UI with the appropriate authentication state, ensuring that the app
/// behaves correctly based on the user's authentication status.
///
/// The [AppAuthenticationBloc] is useful because it centralizes the
/// authentication logic of the application, making it easier to manage and
/// maintain. It ensures a clean separation of concerns by handling business
/// logic related to authentication while the UI components focus on rendering
/// based on the emitted states.
///
/// @Author: Moltaqa's Flutter Team

class AppAuthenticationBloc
    extends Bloc<AppAuthenticationEvent, AppAuthenticationState> {
  static AppAuthenticationBloc of(BuildContext context) {
    return BlocProvider.of(context);
  }

  AppAuthenticationBloc() : super(AuthUninitialized()) {
    on<AppStartedEvent>(_onAppStarted);
    on<AuthenticatedEvent>(_onAuthenticated);
    on<ChooseRoleEvent>(_onChooseRoleEvent);
    on<OnFinishWalkThrowEvent>(_onFinishWalkThrow);
    on<GuestEvent>(_onContinueAsGuest);
    on<AuthRestartEvent>(_onAuthRestart);
    on<UnAuthorizedEvent>(_onUnAuthorized);
    on<LoggedOutEvent>(_onLogout);
    on<BackToOnboardingEvent>(_backToOnboarding);
  }

  final _getIsUserAuthenticatedUseCase = GetIsUserAuthenticatedUseCase();
  final _deleteAllCachedUseCase = DeleteAllSecureCacheUseCase.getInstance();
  final _getCachedUserUseCase = GetCachedUserUseCase.getInstance();

  Future<RoleEnum> getRole() async {
    final role = await GetUserRoleUseCase.getInstance().call();
    return role ?? RoleEnum.guest;
  }

  void _onAppStarted(
    AppStartedEvent event,
    Emitter<AppAuthenticationState> emit,
  ) async {
    // await Future.delayed(const Duration(seconds: 3));
    _log("Auth Started");
    await _startMainApp(emit);
  }

  void _backToOnboarding(
    BackToOnboardingEvent event,
    Emitter<AppAuthenticationState> emit,
  ) {
    emit(AuthUnauthenticated());
  }

  Future<void> _startMainApp(Emitter<AppAuthenticationState> emit) async {
    final getIsAuthResult = await _getIsUserAuthenticatedUseCase();
    final bool isAuthenticated = getIsAuthResult.isAuthenticated;
    final cachedUser = getIsAuthResult.cachedUser;
    if (isAuthenticated && cachedUser != null) {
      final role = await getRole();
      emit(AuthAuthenticatedState(user: cachedUser, role: role));
    } else {
      _log("Auth Un Authenticated");
      await _deleteAllCachedUseCase();
      emit(AuthUnauthenticated());
    }
  }

  static Future<CacheUserEntity?> getCurrentUser() async {
    return await GetCachedUserUseCase.getInstance().call();
  }

  void _onChooseRoleEvent(
    ChooseRoleEvent event,
    Emitter<AppAuthenticationState> emit,
  ) async {
    _log("Auth Log In Page");
    emit(ChooseRolePageState());
  }

  void _onFinishWalkThrow(
    OnFinishWalkThrowEvent event,
    Emitter<AppAuthenticationState> emit,
  ) async {
    _log("Auth Log In Page");
    final role = await getRole();
    emit(AuthLogInPageState(role: role));
  }

  void _onAuthenticated(
    AuthenticatedEvent event,
    Emitter<AppAuthenticationState> emit,
  ) async {
    final cachedUser = await _getCachedUserUseCase();
    if (cachedUser != null) {
      _log("Auth Authenticated State");
      final role = await getRole();
      emit(AuthAuthenticatedState(user: cachedUser, role: role));
    } else {
      await _startMainApp(emit);
    }
  }

  void _onAuthRestart(
    AuthRestartEvent event,
    Emitter<AppAuthenticationState> emit,
  ) async {
    _log("Auth Restarted");
    emit(AuthUninitialized());
    await _startMainApp(emit);
  }

  void _onLogout(
    LoggedOutEvent event,
    Emitter<AppAuthenticationState> emit,
  ) async {
    await _deleteAllCachedUseCase();
    FirebaseHelper.deleteDeviceFcmToken();
    _log('Auth Log Out');
    emit(AuthLogOutState());
  }

  void _onUnAuthorized(
    UnAuthorizedEvent event,
    Emitter<AppAuthenticationState> emit,
  ) async {
    _log("Auth Un Authorized");
    emit(ChooseRolePageState());
  }

  void _onContinueAsGuest(
    GuestEvent event,
    Emitter<AppAuthenticationState> emit,
  ) async {
    _log("Auth GuestState");
    emit(AuthUninitialized());
    await Future.delayed(Durations.medium1);
    emit(const GuestState());
  }

  void _log(String message) {
    debugPrint('[AppAuthenticationBloc] ::: $message :::');
  }

  @override
  void onEvent(AppAuthenticationEvent event) {
    if (!isClosed) {
      super.onEvent(event);
    }
  }
}
