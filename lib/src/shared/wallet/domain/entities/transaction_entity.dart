import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:wasli/core/core.dart';

class TransactionEntity extends Equatable {
  final int id;
  final String name;
  final double amount;
  final DateTime date;
  final TransactionTypeEnum type;

  const TransactionEntity({
    required this.id,
    required this.name,
    required this.date,
    required this.amount,
    required this.type,
  });

  @override
  List<Object?> get props => [
        id,
        name,
        date,
        amount,
        type,
      ];
}

enum TransactionTypeEnum {
  charage("charge"),
  deposit("deposit"),
  withdraw("withdraw"),
  payOrder("pay_order");

  final String apiValue;

  const TransactionTypeEnum(this.apiValue);

  String get icon {
    switch (this) {
      case TransactionTypeEnum.charage:
      case TransactionTypeEnum.deposit:
        return '';
      case TransactionTypeEnum.withdraw:
        return '';
      case TransactionTypeEnum.payOrder:
        return '';
    }
  }

  Color get color {
    switch (this) {
      case TransactionTypeEnum.charage:
      case TransactionTypeEnum.deposit:
        return AppColors.success800;
      case TransactionTypeEnum.withdraw:
      case TransactionTypeEnum.payOrder:
        return AppColors.red500;
    }
  }
}
