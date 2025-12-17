import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:wasli/core/core.dart';
import 'package:wasli/material/buttons/app_button.dart';
import 'package:wasli/src/layouts/provider/settings/packages/domain/entity/package_entity.dart';
import 'package:wasli/src/layouts/provider/settings/packages/presentation/widget/package_details_info_widget.dart';

class PackageDetailsPage extends StatelessWidget {
  final PackageEntity? package;

  const PackageDetailsPage({super.key, this.package});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(appLocalizer.packageDetails),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            PackageDetailsInfoWidget(package: package),
            const Spacer(),
            AppButton(
              text: appLocalizer.renewSubscription,
              onPressed: () {},
            ),
            const Gap(24),
          ],
        ),
      ),
    );
  }
}
