import 'package:flutter/material.dart';
import 'package:wasli/core/core.dart';
import 'package:wasli/src/layouts/client/home/presentation/widget/client_home_appbar.dart';

class ClientHomePage extends StatelessWidget {
  const ClientHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: SafeArea(
      child: Padding(
        padding: Dimensions.pageMargins,
        child: Column(
          children: [
            ClientHomeAppbar(),
          ],
        ),
      ),
    ));
  }
}
