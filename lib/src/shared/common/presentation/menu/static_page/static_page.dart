import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:wasli/core/core.dart';
import 'package:wasli/material/app_fail_widget.dart';
import 'package:wasli/material/spin_kit_loading_widget.dart';
import 'package:wasli/src/shared/common/presentation/widget/custom_app_bar.dart';

import '../../../domain/entity/menu/static_page_type_enum.dart';
import 'static_page_cubit.dart';

class StaticPage extends StatelessWidget {
  const StaticPage({super.key, required this.pageType});

  final StaticPageTypeEnum pageType;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        context,
        title: Text(pageType.title),
        centerTitle: true,
      ),
      body: BlocProvider(
        create: (context) => StaticPageCubit(type: pageType)..getData(),
        child: BlocBuilder<StaticPageCubit, Async<String>>(
          builder: (context, state) {
            if (state.isSuccess) {
              return _StaticPageBody(data: state.data ?? '');
            } else if (state.isLoading) {
              return SpinKitLoadingWidget(
                color: AppColors.primary,
              );
            } else if (state.isFailure) {
              return AppFailWidget(
                onRetry: () {
                  StaticPageCubit.of(context).getData();
                },
              );
            }
            return const SizedBox();
          },
        ),
      ),
    );
  }
}

class _StaticPageBody extends StatelessWidget {
  const _StaticPageBody({required this.data});
  final String data;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
        child: SingleChildScrollView(
          child: Html(
            data: data,
            style: {
              "body": Style(
                color: AppColors.text3,
                fontSize: FontSize(14),
                fontWeight: FontWeight.w400,
                fontFamily: AppFonts.almaraia,
              ),
            },
          ),
        ));
  }
}
