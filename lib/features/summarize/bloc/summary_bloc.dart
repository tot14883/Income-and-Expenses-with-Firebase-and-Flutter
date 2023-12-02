import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:rxdart/rxdart.dart';
import 'package:smart_money/features/income_expenses/model/response/my_account_response.dart';
import 'package:smart_money/features/summarize/bloc/state/summary_state.dart';
import 'package:smart_money/features/summarize/usecase/read_summary_usecase.dart';
import 'package:smart_money/utils/util/date_format.dart';
import 'package:smart_money/widgets/activity_indicator.dart';
import 'package:smart_money/widgets/base_form.dart';

@injectable
class SummaryBloc extends Cubit<SummaryState> {
  final ReadSummaryUseCase _readSummaryUseCase;

  SummaryBloc(
    this._readSummaryUseCase,
  ) : super(const SummaryState());

  final _activityIndicator = ActivityIndicator();
  final _baseFormData = BaseFormData();

  ValueStream<bool> get isLoading => _activityIndicator;

  Future<void> readSummaryList(
    bool isYear, [
    DateTime? dateTime,
    bool isShowAll = false,
  ]) async {
    final selectedDateTime = dateTime ?? DateTime.now();

    final _dateTime = BaseDateFormatter.formatDateTimeWithNameOfMonth(
      selectedDateTime,
      'yyyy-MM-dd',
    );

    List<Map<String, double>> days = List.generate(
      DateTime(selectedDateTime.year, selectedDateTime.month + 1, 0).day,
      (index) => {(index + 1).toString().padLeft(2, '0'): 0.0},
    );

    List<Map<String, double>> months = List.generate(
      12,
      (index) => {(index + 1).toString().padLeft(2, '0'): 0.0},
    );

    List<MyAccountDetailResponse> myAccountRes = [];

    final result = await _readSummaryUseCase.execute(null);
    final dateSelectedSplit = _dateTime.split('-');

    result.when(
      (success) {
        final myAccountDetail = success.myAccountDetail;
        if (myAccountDetail != null) {
          for (final item in myAccountDetail) {
            final dateSplit = item.dateTime!.split('-');
            if (!isYear && dateSplit[0] == dateSelectedSplit[0]) {
              for (final day in days) {
                if (day.containsKey(dateSplit[2])) {
                  day[dateSplit[2]] =
                      (day[dateSplit[2]] ?? 0.0) + (item.money ?? 0.0);
                }
              }
            } else if (isYear && dateSplit[0] == dateSelectedSplit[0]) {
              for (var month in months) {
                if (month.containsKey(dateSplit[1])) {
                  month[dateSplit[1]] =
                      (month[dateSplit[1]] ?? 0.0) + (item.money ?? 0.0);
                }
              }
            }

            if (item.dateTime == _dateTime) {
              myAccountRes.add(
                MyAccountDetailResponse(
                  id: item.id,
                  money: item.money,
                  detail: item.detail,
                  dateTime: item.dateTime,
                  type: item.type,
                ),
              );
            }
          }
        }

        final myAccountResponse = MyAccountResponse(
          incomeExpenseMoney: success.incomeExpenseMoney,
          myAccountDetail: isShowAll ? success.myAccountDetail : myAccountRes,
        );

        emit(
          state.copyWith(
            myAccount: myAccountResponse,
            monthList: months,
            dayList: days,
          ),
        );
      },
      (error) => null,
    );
  }
}
