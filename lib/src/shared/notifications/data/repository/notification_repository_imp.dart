import 'dart:io';
import '../../domain/use_cases/mark_notification_as_read_use_case.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:wasli/core/core.dart';
import '../models/api_notification_model_mapper.dart';
import '../../domain/entities/notifications_result.dart';
import '../../domain/repository/notification_repository.dart';
import '../data_sources/notification_data_source.dart';

@Injectable(as: NotificationRepository)
class NotificationRepositoryImp implements NotificationRepository {
  final NotificationDataSource _notificationDataSource;

  NotificationRepositoryImp(this._notificationDataSource);
  @override
  Future<Either<Failure, NotificationsResult>> getNotifications(
      PaginatedInput params) async {
    try {
      final result = await _notificationDataSource.getNotifications(params);
      return Right(result.map);
    } on UnauthorizedException catch (e) {
      return Left(UnAuthorizedFailure(message: e.message));
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message, errorMap: e.errorMap));
    } on SocketException {
      return const Left(ServerFailure(
        message: 'appLocalizer.errorNoInternet',
      ));
    } catch (e) {
      return const Left(ServerFailure(
        message: 'appLocalizer.errorPleaseTryAgain',
      ));
    }
  }

  @override
  Future<Either<Failure, void>> markAllNotificationAsRead() async {
    try {
      await _notificationDataSource.markAllNotifiactionAsRead();
      return const Right(null);
    } on UnauthorizedException catch (e) {
      return Left(UnAuthorizedFailure(message: e.message));
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message, errorMap: e.errorMap));
    } on SocketException {
      return const Left(ServerFailure(
        message: 'appLocalizer.errorNoInternet',
      ));
    } catch (e) {
      return const Left(ServerFailure(
        message: 'appLocalizer.errorPleaseTryAgain',
      ));
    }
  }

  @override
  Future<Either<Failure, void>> markNotificationAsRead(
      MarkNotificationParams params) async {
    try {
      await _notificationDataSource.markNotificationAsRead(params);
      return const Right(null);
    } on UnauthorizedException catch (e) {
      return Left(UnAuthorizedFailure(message: e.message));
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message, errorMap: e.errorMap));
    } on SocketException {
      return const Left(ServerFailure(
        message: 'appLocalizer.errorNoInternet',
      ));
    } catch (e) {
      return const Left(ServerFailure(
        message: 'appLocalizer.errorPleaseTryAgain',
      ));
    }
  }
}
