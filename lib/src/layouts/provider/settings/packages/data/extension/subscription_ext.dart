import 'package:wasli/src/layouts/provider/settings/packages/domain/entity/subscription_entity.dart';

extension SubscriptionProgress on SubscriptionEntity {
  Duration get elapsedDuration {
    final totalSeconds = (package.duration) * 24 * 60 * 60;
    final remainingDuration = endDate.difference(DateTime.now());
    final remainingSeconds = remainingDuration.inSeconds.clamp(0, totalSeconds);
    final elapsedSeconds =
        (totalSeconds - remainingSeconds).clamp(0, totalSeconds);

    return Duration(seconds: elapsedSeconds);
  }

  Duration get remainingDuration {
    final remaining = endDate.difference(DateTime.now());
    return remaining.isNegative ? Duration.zero : remaining;
  }

  int get totalSeconds => (package.duration) * 24 * 60 * 60;

  double get progress {
    if (totalSeconds == 0) return 0.0;
    return (elapsedDuration.inSeconds / totalSeconds).clamp(0.0, 1.0);
  }

  bool get isExpired => DateTime.now().isAfter(endDate);
}
