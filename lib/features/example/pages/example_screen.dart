import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_money/features/example/bloc/example_bloc.dart';
import 'package:smart_money/features/example/bloc/state/example_state.dart';
import 'package:smart_money/widgets/base_scaffold.dart';

class ExampleScreen extends StatelessWidget {
  const ExampleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      isLoadingStream: context.watch<ExampleBloc>().isLoading,
      bodyBuilder: (context, constraint) {
        return SingleChildScrollView(
          child: Column(
            children: [
              InkWell(
                onTap: () {},
                child: const Text('Fetch'),
              ),
              BlocBuilder<ExampleBloc, ExampleState>(
                builder: (context, list) {
                  return ListView.separated(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    separatorBuilder: (ctx, index) {
                      return SizedBox(
                        height: 16.h,
                      );
                    },
                    itemCount: 5,
                    itemBuilder: (context, index) {
                      return Text('$index');
                    },
                  );
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
