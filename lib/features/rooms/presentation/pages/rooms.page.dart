import 'package:flutter/material.dart';
import 'package:home_automation_app/features/shared/widgets/main_page_header.dart';
import 'package:home_automation_app/features/shared/widgets/warning_message.dart';
import 'package:home_automation_app/styles/flicky_icons_icons.dart';

class RoomsPage extends StatelessWidget {

  static const String route = '/rooms';

  const RoomsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MainPageHeader(
          icon: FlickyIcons.room,
          title: 'My Rooms',
        ),
        Expanded(
          child: WarningMessage(message: 'No available rooms'),
        )
      ],
    );
  }
}