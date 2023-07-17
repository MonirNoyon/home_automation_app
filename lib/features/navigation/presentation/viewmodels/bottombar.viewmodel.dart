import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:home_automation_app/features/navigation/data/models/bottombarnavitem.model.dart';
import 'package:home_automation_app/features/navigation/providers/navigation_providers.dart';
import 'package:home_automation_app/helpers/utils.dart';

class BottomBarViewModel extends StateNotifier<List<BottomBarNavItemModel>> {

  final Ref ref;
  BottomBarViewModel(super.state, this.ref);

  void selectedItem(BottomBarNavItemModel selectedItem) {

    state = [
      for(var item in state)
        item.copyWith(isSelected: selectedItem == item)
    ];

    GoRouter.of(Utils.tabNav.currentContext!).go(selectedItem.route);
  }
}