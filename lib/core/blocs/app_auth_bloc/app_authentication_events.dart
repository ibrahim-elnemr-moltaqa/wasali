part of core;

/// Events are:
/// 1- AppStarted
/// 2- Authenticated
/// 3- LoggedOut
/// 4- WalkthroughDone
/// 5- AuthRestart

abstract class AppAuthenticationEvent extends Equatable {
  const AppAuthenticationEvent();

  @override
  List<Object> get props => [];
}

class AppStartedEvent extends AppAuthenticationEvent {}

class ChooseRoleEvent extends AppAuthenticationEvent {}

class OnFinishWalkThrowEvent extends AppAuthenticationEvent {
  final RoleEnum role;

  const OnFinishWalkThrowEvent({required this.role});

  @override
  List<Object> get props => [role];
}

class AuthenticatedEvent extends AppAuthenticationEvent {}

class GuestEvent extends AppAuthenticationEvent {}

class UnAuthorizedEvent extends AppAuthenticationEvent {}

class LoggedOutEvent extends AppAuthenticationEvent {}

class AuthRestartEvent extends AppAuthenticationEvent {}

class BackToOnboardingEvent extends AppAuthenticationEvent {}
