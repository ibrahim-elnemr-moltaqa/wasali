import 'package:flutter_svg/svg.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:wasli/core/core.dart';
import 'package:wasli/material/change_language/change_language_bottom_sheet.dart';
import 'package:wasli/src/shared/common/domain/entity/onboarding_page_entity.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wasli/src/shared/common/presentation/onboarding/widget/animated_page_view.dart';
import 'package:wasli/src/shared/common/presentation/onboarding/widget/controll_button.dart';
import 'package:wasli/src/shared/common/presentation/onboarding/widget/page_proggress_indecator.dart';
import 'package:wasli/src/shared/common/presentation/onboarding/widget/skip_button.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  int _currentPage = 0;
  final PageController _pageController = PageController();

  bool get getIsFirstPage => _currentPage == 0;

  void _onNext(bool isLastPage) {
    if (isLastPage) {
      _onSkip();
    } else {
      _currentPage++;
      if (_pageController.hasClients) {
        _pageController.nextPage(
          duration: Durations.medium3,
          curve: Curves.easeInOut,
        );
      }
      setState(() {});
    }
  }

  void _onPrevious() {
    if (!getIsFirstPage) {
      _currentPage--;
      if (_pageController.hasClients) {
        _pageController.previousPage(
          duration: Durations.medium3,
          curve: Curves.easeInOut,
        );
      }
      setState(() {});
    }
  }

  void _onSkip() {
    AppRouter.popUntil();
    AppAuthenticationBloc.of(context).add(ChooseRoleEvent());
  }

  void _selectLanguage() {
    ChangeLanguageBottomSheet.show(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.backgroundColor,
        title: SafeArea(
          child: Padding(
            padding: Dimensions.hPageMargins,
            child: GestureDetector(
              onTap: _selectLanguage,
              behavior: HitTestBehavior.opaque,
              child: Row(
                children: [
                  const Icon(Iconsax.global),
                  const SizedBox(width: 8),
                  BlocBuilder<AppLanguageCubit, AppLanguageState>(
                    builder: (context, state) {
                      return Text(
                        state.langCode.displayName,
                        style: TextStyles.bold14,
                      );
                    },
                  ),
                  const Spacer(),
                  Visibility(
                      visible: !(onboardingPages.length - 1 == _currentPage),
                      child: SkipButton(onSkip: _onSkip)),
                ],
              ),
            ),
          ),
        ),
      ),
      body: SafeArea(
        top: false,
        child: Padding(
          padding: Dimensions.hPageMargins,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 32,
              ),
              Expanded(
                child: AnimatedPageView(
                  controller: _pageController,
                  children: onboardingPages
                      .map((e) => SvgPicture.asset(
                            e.image,
                          ))
                      .toList(),
                ),
              ),
              const SizedBox(
                height: 44,
              ),
              Text(
                onboardingPages[_currentPage].title,
                textAlign: TextAlign.center,
                style: TextStyles.bold18,
              ),
              const SizedBox(
                height: 8,
              ),
              Text(
                onboardingPages[_currentPage].description,
                textAlign: TextAlign.center,
                style: TextStyles.regular16,
              ),
              const SizedBox(
                height: 32,
              ),
              PageProgressInductor(
                currentPage: _currentPage,
                length: onboardingPages.length,
              ),
              const SizedBox(
                height: 32,
              ),
              ControllsButtons(
                isFirst: getIsFirstPage,
                isLast: onboardingPages.isEmpty
                    ? true
                    : onboardingPages.length - 1 == _currentPage,
                onBack: _onPrevious,
                onNext: () => _onNext(onboardingPages.isEmpty
                    ? true
                    : onboardingPages.length - 1 == _currentPage),
              ),
              const SizedBox(
                height: 32,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
