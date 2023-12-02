import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_money/core/style/app_style.dart';
import 'package:smart_money/widgets/base_state.dart';

// ignore: must_be_immutable
class IncomeExpensesSwitchWidget extends StatefulWidget {
  final bool? initialValue;
  final Function(bool) onChanged;

  const IncomeExpensesSwitchWidget({
    super.key,
    required this.onChanged,
    this.initialValue,
  });

  @override
  _IncomeExpensesSwitchWidgetState createState() =>
      _IncomeExpensesSwitchWidgetState();
}

class _IncomeExpensesSwitchWidgetState
    extends BaseState<IncomeExpensesSwitchWidget> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return StatefulBuilder(
      builder: ((context, setState) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'รายรับ',
              style: AppStyle.txtCaption,
            ),
            SizedBox(width: 4.w),
            Switch(
              value: widget.initialValue ?? isChecked,
              onChanged: (newValue) {
                setState(() {
                  isChecked = newValue;
                });
                widget.onChanged(isChecked);
              },
            ),
            SizedBox(width: 4.w),
            Text(
              'รายจ่าย',
              style: AppStyle.txtCaption,
            ),
          ],
        );
      }),
    );
  }
}
