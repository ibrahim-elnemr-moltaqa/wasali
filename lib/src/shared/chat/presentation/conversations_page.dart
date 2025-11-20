import 'package:wasli/core/core.dart';
import 'package:wasli/core/utils/extensions/widget_ext.dart';
import 'package:wasli/src/shared/chat/presentation/widgets/chat_search_bar_widget.dart';
import 'package:wasli/src/shared/chat/presentation/widgets/conversation_card_widget.dart';
import 'package:flutter/material.dart';

class ConversationsPage extends StatelessWidget {
  const ConversationsPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(appLocalizer.conversations),
      ),
      body: Column(
        spacing: 8,
        children: [
          const ChatSearchBarWidget(),
          Expanded(
              child: ListView.separated(
                  itemBuilder: (ctx, idx) => const ConversationCardWidget(),
                  separatorBuilder: (ctx, idx) => const SizedBox(
                        height: 12,
                      ),
                  itemCount: 40))
        ],
      ).paddingAll(20),
    );
  }
}
