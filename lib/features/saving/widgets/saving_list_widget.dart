import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_money/features/saving/bloc/saving_bloc.dart';
import 'package:smart_money/features/saving/bloc/state/saving_state.dart';
import 'package:smart_money/features/saving/widgets/saving_card_widget.dart';

class SavingListWidget extends StatelessWidget {
  const SavingListWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SavingBloc, SavingState>(
      builder: (context, list) {
        final savingList = list.myAccount?.myAccountDetail;

        if (savingList == null) {
          return const CircularProgressIndicator();
        }

        return ListView.separated(
          physics: const ClampingScrollPhysics(),
          shrinkWrap: true,
          itemCount: savingList.length,
          itemBuilder: (context, index) {
            final item = savingList[index];

            return SavingCardWidget(
              savingItem: item,
            );
          },
          separatorBuilder: (_, __) => SizedBox(
            height: 16.h,
          ),
        );
      },
    );
  }
}
