import 'package:freezed_annotation/freezed_annotation.dart';

enum TypeIncomeExpenses {
  @JsonValue('income')
  income,
  @JsonValue('expenses')
  expenses,
}
