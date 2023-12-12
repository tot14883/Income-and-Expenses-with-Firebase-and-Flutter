import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:smart_money/core/route/route_name.dart';
import 'package:smart_money/core/style/app_style.dart';
import 'package:smart_money/widgets/base_button.dart';
import 'package:smart_money/generated/assets.gen.dart';
import 'package:smart_money/widgets/base_scaffold.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      imgBgPath: Assets.imgs.imgBg.path,
      bodyBuilder: (context, constraint) {
        return SingleChildScrollView(
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 132.h,
                ),
                BaseButton(
                  margin: EdgeInsets.symmetric(horizontal: 16.w),
                  width: MediaQuery.of(context).size.width,
                  onTap: () {
                    context.pushNamed(
                      incomeAndExpenses,
                      queryParameters: {
                        'isIncome': 'true',
                      },
                    );
                  },
                  text: 'รายรับ / Revenue',
                  textStyle: AppStyle.txtHeader1,
                ),
                SizedBox(
                  height: 24.h,
                ),
                BaseButton(
                  margin: EdgeInsets.symmetric(horizontal: 16.w),
                  width: MediaQuery.of(context).size.width,
                  onTap: () {
                    context.pushNamed(
                      incomeAndExpenses,
                      queryParameters: {
                        'isIncome': 'false',
                      },
                    );
                  },
                  text: 'รายจ่าย / Expenses',
                  textStyle: AppStyle.txtHeader1,
                ),
                SizedBox(
                  height: 24.h,
                ),
                BaseButton(
                  margin: EdgeInsets.symmetric(horizontal: 16.w),
                  width: MediaQuery.of(context).size.width,
                  onTap: () {
                    context.pushNamed(saving);
                  },
                  text: 'การออม / Savings',
                  textStyle: AppStyle.txtHeader1,
                ),
                SizedBox(
                  height: 24.h,
                ),
                BaseButton(
                  margin: EdgeInsets.symmetric(horizontal: 16.w),
                  width: MediaQuery.of(context).size.width,
                  onTap: () {
                    context.pushNamed(summary);
                  },
                  text: 'สรุป / Summarize',
                  textStyle: AppStyle.txtHeader1,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
