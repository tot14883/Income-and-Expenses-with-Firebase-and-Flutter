import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:rxdart/rxdart.dart';
import 'package:smart_money/features/example/bloc/state/example_state.dart';
import 'package:smart_money/widgets/activity_indicator.dart';
import 'package:smart_money/widgets/base_form.dart';

@injectable
class ExampleBloc extends Cubit<ExampleState> {
  ExampleBloc() : super(const ExampleState());

  final _activityIndicator = ActivityIndicator();
  final _baseFormData = BaseFormData();

  ValueStream<bool> get isLoading => _activityIndicator;

  void onChanged(BaseFormData baseFormData) {
    final newData = _baseFormData.copyAndMerge(baseFormData);
    emit(state.copyWith(baseFormData: newData));
  }
}
