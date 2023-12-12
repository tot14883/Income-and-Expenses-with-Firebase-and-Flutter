import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:smart_money/core/route/route_name.dart';
import 'package:smart_money/core/style/app_color.dart';
import 'package:smart_money/core/style/app_style.dart';
import 'package:smart_money/features/authentication/bloc/authentication_bloc.dart';
import 'package:smart_money/features/authentication/enum/field_login_enum.dart';
import 'package:smart_money/generated/assets.gen.dart';
import 'package:smart_money/utils/validate/vaildators.dart';
import 'package:smart_money/widgets/base_button.dart';
import 'package:smart_money/widgets/base_form.dart';
import 'package:smart_money/widgets/base_scaffold.dart';
import 'package:smart_money/widgets/base_state.dart';
import 'package:smart_money/widgets/base_text_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends BaseState<LoginScreen> {
  final _formKey = GlobalKey<BaseFormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      imgBgPath: Assets.imgs.imgBg.path,
      fit: BoxFit.fill,
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
                Text(
                  'เข้าสู่ระบบ',
                  style: AppStyle.txtHeader2,
                ),
                SizedBox(
                  height: 32.h,
                ),
                BaseTextField(
                  fieldKey: FieldLogin.email,
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
                  fieldKey: FieldLogin.password,
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
                BaseButton(
                  buttonType: ButtonType.secondary,
                  width: 80.w,
                  onTap: () async {
                    if (_emailController.text.isEmpty ||
                        _passwordController.text.isEmpty) {
                      _showMyDialog();
                      return;
                    } else {
                      final result =
                          await context.read<AuthenticationBloc>().postLogin();

                      if (result) {
                        context.pushReplacementNamed(home);
                      }
                    }
                  },
                  text: 'เข้าสู่ระบบ',
                ),
                SizedBox(
                  height: 32.h,
                ),
                GestureDetector(
                  onTap: () {
                    context.pushNamed(signUp);
                  },
                  child: Text(
                    'สมัครสมาชิก',
                    style: AppStyle.txtHeader3,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Future<void> _showMyDialog() async {
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
            'กรุณากรอกข้อมูลให้ครบ',
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
