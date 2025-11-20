import 'package:wasli/core/base/localization/l10n/app_localizations.dart';
import 'package:wasli/core/core.dart';
import 'package:intl/intl.dart';

class TimeStampUtil {
  static String getDateWithDay(int timestamp) {
    final DateTime date = DateTime.fromMillisecondsSinceEpoch(timestamp * 1000);

    final String currentLang = AppLocalizations.of(appNavigatorKey.currentContext!).language;
    return DateFormat('EEEE - d MMMM y', currentLang).format(date);
  }

  static String getHoursWithMinutes(int timestamp) {
    final DateTime date = DateTime.fromMillisecondsSinceEpoch(timestamp * 1000);
    return DateFormat('hh:mm').format(date);
  }

  static bool isSameDate(int ts1, int ts2) {
    final DateTime d1 = DateTime.fromMillisecondsSinceEpoch(ts1 * 1000);
    final DateTime d2 = DateTime.fromMillisecondsSinceEpoch(ts2 * 1000);

    return d1.year == d2.year && d1.month == d2.month && d1.day == d2.day;
  }

  static bool isOneHourOrLessLeft(int timestamp) {
    final now = DateTime.now();
    final targetTime = DateTime.fromMillisecondsSinceEpoch(timestamp);
    final difference = targetTime.difference(now);

    return difference.inSeconds > 0 && difference.inHours < 1;
  }

  static String timeAgo(int timestamp) {
    final date = timestamp.toString().length == 10
        ? DateTime.fromMillisecondsSinceEpoch(timestamp * 1000)
        : DateTime.fromMillisecondsSinceEpoch(timestamp);
    final now = DateTime.now();
    final diff = now.difference(date);
      final String currentLang = AppLocalizations.of(appNavigatorKey.currentContext!).language;

    if (currentLang == 'ar') {
      if (diff.inSeconds < 60) {
        return 'الآن';
      } else if (diff.inMinutes < 60) {
        return 'قبل ${diff.inMinutes} دقيقة${diff.inMinutes == 1
            ? ''
            : diff.inMinutes == 2
            ? 'ين'
            : ''}';
      } else if (diff.inHours < 24) {
        return 'قبل ${diff.inHours} ساعة${diff.inHours == 1
            ? ''
            : diff.inHours == 2
            ? 'ين'
            : ''}';
      } else if (diff.inDays < 7) {
        return 'قبل ${diff.inDays} يوم${diff.inDays == 1
            ? ''
            : diff.inDays == 2
            ? 'ين'
            : ''}';
      } else if (diff.inDays < 30) {
        final weeks = (diff.inDays / 7).floor();
        return 'قبل $weeks أسبوع${weeks == 1
            ? ''
            : weeks == 2
            ? 'ين'
            : ''}';
      } else if (diff.inDays < 365) {
        final months = (diff.inDays / 30).floor();
        return 'قبل $months شهر${months == 1
            ? ''
            : months == 2
            ? 'ين'
            : ''}';
      } else {
        final years = (diff.inDays / 365).floor();
        return 'قبل $years سنة${years == 1
            ? ''
            : years == 2
            ? 'ين'
            : ''}';
      }
    } else {
      if (diff.inSeconds < 60) {
        return 'Just now';
      } else if (diff.inMinutes < 60) {
        return '${diff.inMinutes} minute${diff.inMinutes == 1 ? '' : 's'} ago';
      } else if (diff.inHours < 24) {
        return '${diff.inHours} hour${diff.inHours == 1 ? '' : 's'} ago';
      } else if (diff.inDays < 7) {
        return '${diff.inDays} day${diff.inDays == 1 ? '' : 's'} ago';
      } else if (diff.inDays < 30) {
        final weeks = (diff.inDays / 7).floor();
        return '$weeks week${weeks == 1 ? '' : 's'} ago';
      } else if (diff.inDays < 365) {
        final months = (diff.inDays / 30).floor();
        return '$months month${months == 1 ? '' : 's'} ago';
      } else {
        final years = (diff.inDays / 365).floor();
        return '$years year${years == 1 ? '' : 's'} ago';
      }
    }
  }
}