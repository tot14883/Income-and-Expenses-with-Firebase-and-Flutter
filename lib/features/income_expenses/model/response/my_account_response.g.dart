// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'my_account_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MyAccountResponseImpl _$$MyAccountResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$MyAccountResponseImpl(
      savingMoney: (json['savingMoney'] as num?)?.toDouble(),
      incomeExpenseMoney: (json['incomeExpenseMoney'] as num?)?.toDouble(),
      myAccountDetail: (json['myAccountDetail'] as List<dynamic>?)
          ?.map((e) =>
              MyAccountDetailResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$MyAccountResponseImplToJson(
        _$MyAccountResponseImpl instance) =>
    <String, dynamic>{
      'savingMoney': instance.savingMoney,
      'incomeExpenseMoney': instance.incomeExpenseMoney,
      'myAccountDetail': instance.myAccountDetail,
    };

_$MyAccountDetailResponseImpl _$$MyAccountDetailResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$MyAccountDetailResponseImpl(
      id: json['id'] as String?,
      money: (json['money'] as num?)?.toDouble(),
      detail: json['detail'] as String?,
      dateTime: json['dateTime'] as String?,
      type: $enumDecodeNullable(_$TypeIncomeExpensesEnumMap, json['type']),
    );

Map<String, dynamic> _$$MyAccountDetailResponseImplToJson(
        _$MyAccountDetailResponseImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'money': instance.money,
      'detail': instance.detail,
      'dateTime': instance.dateTime,
      'type': _$TypeIncomeExpensesEnumMap[instance.type],
    };

const _$TypeIncomeExpensesEnumMap = {
  TypeIncomeExpenses.income: 'income',
  TypeIncomeExpenses.expenses: 'expenses',
};
