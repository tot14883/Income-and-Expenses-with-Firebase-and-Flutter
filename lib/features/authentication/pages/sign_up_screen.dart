import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:smart_money/core/route/route_name.dart';
import 'package:smart_money/core/style/app_color.dart';
import 'package:smart_money/core/style/app_style.dart';
import 'package:smart_money/features/authentication/bloc/authentication_bloc.dart';
import 'package:smart_money/features/authentication/bloc/state/authentication_state.dart';
import 'package:smart_money/features/authentication/enum/field_sign_up_enum.dart';
import 'package:smart_money/generated/assets.gen.dart';
import 'package:smart_money/utils/validate/vaildators.dart';
import 'package:smart_money/widgets/base_app_bar.dart';
import 'package:smart_money/widgets/base_button.dart';
import 'package:smart_money/widgets/base_form.dart';
import 'package:smart_money/widgets/base_scaffold.dart';
import 'package:smart_money/widgets/base_state.dart';
import 'package:smart_money/widgets/base_text_field.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends BaseState<SignUpScreen> {
  final _formKey = GlobalKey<BaseFormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthenticationBloc, AuthenticationState>(
      listenWhen: (previousState, state) =>
          state.isSuccess != previousState.isSuccess,
      listener: (context, state) {
        final isSuccess = state.isSuccess;
        if (isSuccess != null) {
          if (isSuccess) {
            context.pushReplacementNamed(login);
          } else {
            _showMyDialog('มีรหัสนี้อยู่แล้ว');
          }
        }
      },
      child: BaseScaffold(
        imgBgPath: Assets.imgs.imgBg.path,
        isLoadingStream: context.watch<AuthenticationBloc>().isLoading,
        appBar: BaseAppBar(
          title: Text(
            'สมัครสมาชิก',
            style: AppStyle.txtHeader2,
          ),
          bgColor: AppColor.primary,
        ),
        bodyBuilder: (context, constraint) {
          return BaseForm(
            key: _formKey,
            onChanged: context.read<AuthenticationBloc>().onChanged,
            child: Padding(
              padding: const EdgeInsets.all(16).r,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  BaseTextField(
                    fieldKey: FieldSignUp.email,
                    controller: _emailController,
                    fillColor: AppColor.primary,
                    label: 'Email',
                    isShowLabelField: true,
                    validator: Validators.combine(
                      [
                        Validators.withMessage(
                          "Required",
                          Validators.isEmpty,
                        ),
                        Validators.withMessage(
                          "Email is incorrect format",
                          Validators.isValidEmail,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  BaseTextField(
                    fieldKey: FieldSignUp.password,
                    controller: _passwordController,
                    fillColor: AppColor.primary,
                    label: 'Password',
                    isShowLabelField: true,
                    isObscureText: true,
                    validator: Validators.combine(
                      [
                        Validators.withMessage(
                          "Required",
                          Validators.isEmpty,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  BaseTextField(
                    controller: _confirmPasswordController,
                    fillColor: AppColor.primary,
                    label: 'Confirm Password',
                    isShowLabelField: true,
                    isObscureText: true,
                    validator: Validators.combine(
                      [
                        Validators.withMessage(
                          "Required",
                          Validators.isEmpty,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  BaseButton(
                    buttonType: ButtonType.secondary,
                    width: 80.w,
                    onTap: () async {
                      context.read<AuthenticationBloc>().postSignUp();

                      if (_emailController.text.isEmpty ||
                          _passwordController.text.isEmpty ||
                          _confirmPasswordController.text.isEmpty) {
                        _showMyDialog('กรุณากรอกข้อมูลให้ครบ');
                        return;
                      }

                      if (_passwordController.text !=
                          _confirmPasswordController.text) {
                        _showMyDialog('รหัสผ่านไม่ตรง');
                        return;
                      }

                      context.read<AuthenticationBloc>().postSignUp();
                    },
                    text: 'สมัครสมาชิก',
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Future<void> _showMyDialog(String text) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            'Warning',
            style: AppStyle.txtHeader2,
          ),
          content: Text(
            text,
            style: AppStyle.txtHeader3,
          ),
          actions: <Widget>[
            TextButton(
              child: Text(
                'OK',
                style: AppStyle.txtBody2,
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
