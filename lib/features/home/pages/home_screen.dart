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
      bodyBuilder: (context, constraint) {
        return SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'หน้าหลัก',
                style: AppStyle.txtHeader2,
              ),
              SizedBox(
                height: 32.h,
              ),
              Assets.imgs.imgCalendar.image(),
              SizedBox(
                height: 8.h,
              ),
              BaseButton(
                width: 120.w,
                onTap: () {
                  context.pushNamed(incomeAndExpenses);
                },
                text: 'รายรับ-รายจ่าย',
              ),
              SizedBox(
                height: 8.h,
              ),
              BaseButton(
                width: 80.w,
                onTap: () {
                  context.pushNamed(saving);
                },
                text: 'การออม',
              ),
              SizedBox(
                height: 8.h,
              ),
              BaseButton(
                width: 80.w,
                onTap: () {
                  context.pushNamed(summary);
                },
                text: 'สรุป',
              ),
            ],
          ),
        );
      },
    );
  }
}
