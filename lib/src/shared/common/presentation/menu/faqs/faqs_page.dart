import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wasli/core/core.dart';
import 'package:wasli/material/app_fail_widget.dart';
import 'package:wasli/material/spin_kit_loading_widget.dart';
import '../../../domain/entity/menu/faq_entity.dart';
import 'faqs_cubit.dart';

class FaqsPage extends StatelessWidget {
  const FaqsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
          onPressed: () => AppRouter.pop(),
          icon: Icon(
            Icons.arrow_back,
            color: AppColors.primary,
          ),
        ),
        title: Text(appLocalizer.faqs),
      ),
      body: BlocProvider(
        create: (context) => FaqsCubit(),
        child: BlocBuilder<FaqsCubit, Async<List<FaqEntity>>>(
          builder: (context, state) {
            if (state.isSuccess) {
              return _FaqScreen(data: state.data ?? []);
            } else if (state.isLoading) {
              return SpinKitLoadingWidget(
                color: AppColors.primary,
              );
            } else if (state.isFailure) {
              return AppFailWidget(
                onRetry: () {
                  FaqsCubit.of(context).getFaqData();
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

class _FaqScreen extends StatelessWidget {
  const _FaqScreen({required this.data});
  final List<FaqEntity> data;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
      child: SingleChildScrollView(
        child: Column(
          children: [
            for (final faq in data)
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 6,
                ),
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: AppColors.borderColor),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: ExpansionTile(
                    collapsedBackgroundColor: Colors.white,
                    backgroundColor: Colors.white,
                    collapsedShape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    tilePadding: const EdgeInsets.only(
                      left: 16,
                      right: 16,
                    ),
                    title: Text(faq.name),
                    trailing: Icon(
                      Icons.arrow_drop_down,
                      color: AppColors.primary,
                    ),
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          faq.description,
                          style: TextStyle(
                            color: AppColors.text3,
                            fontSize: 14,
                            fontFamily: AppFonts.almaraia,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
