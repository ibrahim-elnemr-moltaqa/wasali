import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:wasli/core/config/theme/app_theme.dart';
import 'package:wasli/core/core.dart';
import 'package:wasli/material/app_fail_widget.dart';
import 'package:wasli/material/buttons/app_button.dart';
import 'package:wasli/material/overlay/show_modal_bottom_sheet.dart';
import 'package:wasli/material/spin_kit_loading_widget.dart';
import 'package:wasli/src/shared/auth/presentation/widgets/accept_terms_tile.dart';
import '../../../domain/entity/menu/static_page_type_enum.dart';
import 'static_page_cubit.dart';

class StaticPageSheet extends StatefulWidget {
  const StaticPageSheet._({
    required this.isAccepted,
    required this.type,
  });
  final bool isAccepted;
  final StaticPageTypeEnum type;

  @override
  State<StaticPageSheet> createState() => _StaticPageSheetState();

  static Future<bool?> show(
    BuildContext context, {
    required final StaticPageTypeEnum pageType,
    required final bool isAccepted,
  }) async =>
      await showAppModalBottomSheet<bool?>(
        context: context,
        child: BlocProvider(
          create: (context) => StaticPageCubit(type: pageType)..getData(),
          child: StaticPageSheet._(
            type: pageType,
            isAccepted: isAccepted,
          ),
        ),
      );
}

class _StaticPageSheetState extends State<StaticPageSheet> {
  bool isAccepted = false;
  @override
  void initState() {
    isAccepted = widget.isAccepted;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          widget.type.title,
          style: TextStyles.medium14.copyWith(color: AppColors.text),
        ),
        const SizedBox(height: 10),
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: getThemeColor(
              darkColor: AppColors.cardColor,
              lightColor: AppColors.secondary50,
            ),
            borderRadius: BorderRadius.circular(16),
          ),
          constraints: const BoxConstraints(
            minHeight: 200,
          ),
          child: BlocBuilder<StaticPageCubit, Async<String>>(
            builder: (context, state) {
              if (state.isSuccess) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _StaticPageBody(data: state.data ?? ''),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 12,
                        horizontal: 8,
                      ),
                      child: AcceptTermsAndConditionsWidget(
                        isAccepted: isAccepted,
                        canOpenTermsSheet: false,
                        onChanged: (value) {
                          setState(() {
                            isAccepted = value;
                          });
                        },
                      ),
                    ),
                  ],
                );
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
        const SizedBox(height: 32),
        BlocBuilder<StaticPageCubit, Async<String>>(
          builder: (context, state) {
            if (state.isSuccess == false) {
              return const SizedBox();
            }
            return AppButton(
              text: appLocalizer.done,
              isEnabled: isAccepted,
              onPressed: () {
                Navigator.pop(context, isAccepted);
              },
            );
          },
        )
      ],
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
        child: Html(
          data: data,
          style: {
            "body": Style(
              color: AppColors.text3,
              fontSize: FontSize(14),
              fontWeight: FontWeight.w700,
              fontFamily: AppFonts.almaraia,
            ),
          },
        ));
  }
}
