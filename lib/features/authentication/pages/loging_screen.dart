import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:smart_money/core/route/route_name.dart';
import 'package:smart_money/core/style/app_color.dart';
import 'package:smart_money/core/style/app_style.dart';
import 'package:smart_money/features/authentication/enum/field_login_enum.dart';
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
      bodyBuilder: (context, constraint) {
        return BaseForm(
          key: _formKey,
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
                  onTap: () {
                    if (_emailController.text == 'admin@mail.com' &&
                        _passwordController.text == '123456') {
                      context.pushReplacementNamed(home);
                    }
                  },
                  text: 'เข้าสู่ระบบ',
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
