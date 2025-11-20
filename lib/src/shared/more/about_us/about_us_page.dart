import '../../../../core/core.dart';
import 'package:flutter/material.dart';

class AboutUsPage extends StatelessWidget {
  static const String routeName = '/AboutUsPage';
  const AboutUsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => AppRouter.pop(),
          icon: Icon(
            Icons.arrow_back,
            color: AppColors.primary,
          ),
        ),
        centerTitle: true,
        title: Text(appLocalizer.aboutApp),
      ),
      body: CustomScrollView(
        slivers: [
          // TileCard(
          //   padding: 0,
          //   items: [
          //     TileModel(
          //       title: appLocalizer.aboutApp2,
          //       onTap: () => AppRouter.pushNamed(
          //         AppRoutes.staticPage,
          //         arguments: StaticPageTypeEnum.aboutUs,
          //       ),
          //     ),
          //   ],
          // ),
          // TileCard(
          //   padding: 0,
          //   items: [
          //     TileModel(
          //       title: appLocalizer.termsAndConditions,
          //       onTap: () => AppRouter.pushNamed(
          //         AppRoutes.staticPage,
          //         arguments: StaticPageTypeEnum.termsAndConditions,
          //       ),
          //     ),
          //   ],
          // ),
          // TileCard(
          //   padding: 0,
          //   items: [
          //     TileModel(
          //       title: appLocalizer.privacyPolicy,
          //       onTap: () => AppRouter.pushNamed(
          //         AppRoutes.staticPage,
          //         arguments: StaticPageTypeEnum.privacyPolicy,
          //       ),
          //     ),
          //   ],
          // ),
          // TileCard(
          //   padding: 0,
          //   items: [
          //     TileModel(
          //       title: appLocalizer.faqs,
          //       onTap: () => AppRouter.pushNamed(AppRoutes.faqsPage),
          //     ),
          //   ],
          // ),
          // TileCard(
          //   padding: 0,
          //   items: [
          //     TileModel(
          //       title: appLocalizer.deleteAccount,
          //       color: AppColors.red700,
          //       onTap: () => DeleteAccountBottomSheet.show(context),
          //     ),
          //   ],
          // ),
        ],
      ),
    );
  }
}
