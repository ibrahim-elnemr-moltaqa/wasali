import 'package:flutter/material.dart';
import 'package:wasli/core/core.dart';
import 'package:wasli/src/shared/common/presentation/widget/custom_app_bar.dart';

class CustomerSupportPage extends StatelessWidget {
  const CustomerSupportPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        context,
        title: Text(appLocalizer.customerSupport),
      ),
    );
  }
}
