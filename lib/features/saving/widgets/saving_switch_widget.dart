import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_money/core/style/app_style.dart';
import 'package:smart_money/widgets/base_state.dart';

// ignore: must_be_immutable
class SavingSwitchWidget extends StatefulWidget {
  final bool? initialValue;
  final Function(bool) onChanged;

  const SavingSwitchWidget({
    super.key,
    required this.onChanged,
    this.initialValue,
  });

  @override
  _SavingSwitchWidgetState createState() => _SavingSwitchWidgetState();
}

class _SavingSwitchWidgetState extends BaseState<SavingSwitchWidget> {
  bool isChecked = false;

  @override
  void initState() {
    final initialValue = widget.initialValue;
    if (initialValue != null) {
      isChecked = initialValue;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StatefulBuilder(
      builder: ((context, setState) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'เพิ่มเงิน',
              style: AppStyle.txtCaption,
            ),
            SizedBox(width: 4.w),
            Switch(
              value: isChecked,
              onChanged: (newValue) {
                setState(() {
                  isChecked = newValue;
                });
                widget.onChanged(isChecked);
              },
            ),
            SizedBox(width: 4.w),
            Text(
              'ใช้เงิน',
              style: AppStyle.txtCaption,
            ),
          ],
        );
      }),
    );
  }
}
