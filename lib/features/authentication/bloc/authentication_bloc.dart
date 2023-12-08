import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:rxdart/rxdart.dart';
import 'package:smart_money/core/local_storage/base_shared_preference.dart';
import 'package:smart_money/features/authentication/bloc/state/authentication_state.dart';
import 'package:smart_money/features/authentication/enum/field_login_enum.dart';
import 'package:smart_money/features/authentication/enum/field_sign_up_enum.dart';
import 'package:smart_money/features/authentication/model/request/login_request.dart';
import 'package:smart_money/features/authentication/model/request/sign_up_request.dart';
import 'package:smart_money/features/authentication/usecase/create_user_usecase.dart';
import 'package:smart_money/features/authentication/usecase/post_login_usecase.dart';
import 'package:smart_money/utils/util/encode_utils.dart';
import 'package:smart_money/widgets/activity_indicator.dart';
import 'package:smart_money/widgets/base_form.dart';

@injectable
class AuthenticationBloc extends Cubit<AuthenticationState> {
  final PostLoginUseCase _postLoginUseCase;
  final BaseSharedPreference _baseSharedPreference;
  final CreateUserUsecase _createUserUsecase;

  AuthenticationBloc(
    this._postLoginUseCase,
    this._baseSharedPreference,
    this._createUserUsecase,
  ) : super(const AuthenticationState());

  final _activityIndicator = ActivityIndicator();
  final _baseFormData = BaseFormData();

  ValueStream<bool> get isLoading => _activityIndicator;

  void onChanged(BaseFormData baseFormData) {
    final newData = _baseFormData.copyAndMerge(baseFormData);
    emit(state.copyWith(baseFormData: newData));
  }

  Future<bool> postLogin() async {
    bool isSuccess = false;
    final email = state.baseFormData?.getValue<String>(FieldLogin.email);
    final password = state.baseFormData?.getValue<String>(FieldLogin.password);

    final request = LoginRequest(
      email: email,
      password: password,
    );

    final result = await _postLoginUseCase.execute(request);

    result.when(
      (success) async {
        isSuccess = success;

        final encodeMd5 = '$email&$password'.generateMd5;
        await _baseSharedPreference.setString(
          BaseSharePreferenceKey.token,
          encodeMd5,
        );
      },
      (error) => null,
    );

    return isSuccess;
  }

  void postSignUp() async {
    final email = state.baseFormData?.getValue<String>(FieldSignUp.email);
    final password = state.baseFormData?.getValue<String>(FieldSignUp.password);

    final request = SignUpRequest(
      email: '$email',
      password: '$password',
    );

    _createUserUsecase
        .stream(request)
        .trackActivity(_activityIndicator)
        .listen((result) {
      result.when(
        (success) async {
          emit(state.copyWith(isSuccess: success));
        },
        (error) => null,
      );
    });
  }
}
