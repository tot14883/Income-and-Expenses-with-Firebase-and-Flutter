// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'my_account_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MyAccountRequestImpl _$$MyAccountRequestImplFromJson(
        Map<String, dynamic> json) =>
    _$MyAccountRequestImpl(
      id: json['id'] as String?,
      savingMoney: (json['savingMoney'] as num?)?.toDouble(),
      dateTime: json['dateTime'] as String?,
      money: (json['money'] as num?)?.toDouble(),
      detail: json['detail'] as String?,
      type: $enumDecodeNullable(_$TypeIncomeExpensesEnumMap, json['type']),
      incomeExpensesMoney: (json['incomeExpensesMoney'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$$MyAccountRequestImplToJson(
        _$MyAccountRequestImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'savingMoney': instance.savingMoney,
      'dateTime': instance.dateTime,
      'money': instance.money,
      'detail': instance.detail,
      'type': _$TypeIncomeExpensesEnumMap[instance.type],
      'incomeExpensesMoney': instance.incomeExpensesMoney,
    };

const _$TypeIncomeExpensesEnumMap = {
  TypeIncomeExpenses.income: 'income',
  TypeIncomeExpenses.expenses: 'expenses',
};
