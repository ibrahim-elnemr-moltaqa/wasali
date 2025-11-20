import 'package:wasli/core/utils/extensions/widget_ext.dart';
import 'package:wasli/src/shared/chat/presentation/widgets/chat_card_widget.dart';
import 'package:wasli/src/shared/chat/presentation/widgets/chat_details_app_bar_title_widget.dart';
import 'package:flutter/material.dart';

class ChatDetailsPage extends StatelessWidget {
  const ChatDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const ChatDetailsAppBarTitleWidget()),
      body: ListView.builder(
              itemBuilder: (ctx, idx) => ChatCardWidget(
                    isMe: idx % 2 == 0,
                  ),
              itemCount: 40)
          .paddingAll(20),
    );
  }
}
