import 'package:wasli/core/core.dart';

class AuthStepEntity {
  final int step;
  final String title;
  final String icon;

  AuthStepEntity({required this.step, required this.title, required this.icon});
}

List<AuthStepEntity> deliverySteps = [
  AuthStepEntity(
      step: 1, title: appLocalizer.initial_data, icon: AppIcons.profile),
  AuthStepEntity(
      step: 2, title: appLocalizer.bank_account_data, icon: AppIcons.bank),
  AuthStepEntity(step: 3, title: appLocalizer.vehicle_data, icon: AppIcons.car),
];

List<AuthStepEntity> providerSteps = [
  AuthStepEntity(
      step: 1, title: appLocalizer.service_provider, icon: AppIcons.profile),
  AuthStepEntity(step: 2, title: appLocalizer.store_data, icon: AppIcons.store),
  AuthStepEntity(
      step: 3, title: appLocalizer.store_address, icon: AppIcons.location),
];
